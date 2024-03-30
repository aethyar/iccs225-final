-- Create a trigger function to update ingredients table after each transaction
CREATE OR REPLACE FUNCTION update_ingredient_stock()
    RETURNS TRIGGER AS
$$
DECLARE
    needed_stock INT;
BEGIN
    -- Calculate the total quantity of each ingredient needed for the transaction
    SELECT SUM(if.quantity * t.quantity)
    INTO needed_stock
    FROM transactions t
             JOIN ingredient_food if ON t.food_id = if.food_id
    WHERE t.transaction_id = NEW.transaction_id;

    -- Update the stock of each ingredient
    UPDATE ingredients i
    SET stock = stock - needed_stock
    WHERE i.ingredient_id IN (SELECT if.ingredient_id FROM ingredient_food if WHERE if.food_id = NEW.food_id);

    -- Check if stock becomes negative
    IF (SELECT stock
        FROM ingredients
        WHERE ingredient_id IN (SELECT if.ingredient_id FROM ingredient_food if WHERE if.food_id = NEW.food_id)) <
       0 THEN
        -- Raise an exception if stock becomes negative
        RAISE EXCEPTION 'Stock of ingredient(s) became negative after transaction. Transaction cancelled.';
    END IF;

    RETURN NEW;
END;
$$
    LANGUAGE plpgsql;

-- Create the trigger to execute the trigger function after each transaction
CREATE TRIGGER after_transaction_update_ingredient_stock
    AFTER INSERT
    ON transactions
    FOR EACH ROW
EXECUTE FUNCTION update_ingredient_stock();

-- Create a trigger function to generate an alert when inventory stock is updated
CREATE OR REPLACE FUNCTION check_inventory_threshold()
    RETURNS TRIGGER AS
$$
DECLARE
    ingredient_name VARCHAR(100);
BEGIN
    -- Get the name of the ingredient being updated
    SELECT name
    INTO ingredient_name
    FROM ingredients
    WHERE ingredient_id = NEW.ingredient_id;

    -- Check if the updated stock is below the alert threshold
    IF NEW.stock < NEW.alert_threshold THEN
        -- Raise an alert
        RAISE NOTICE 'Alert: Stock of % is below threshold. Current stock: %', ingredient_name, NEW.stock;
    END IF;

    RETURN NEW;
END;
$$
    LANGUAGE plpgsql;

-- Create the trigger to execute the trigger function after updating the inventory stock
CREATE TRIGGER after_inventory_update_check_threshold
    AFTER UPDATE OF stock
    ON ingredients
    FOR EACH ROW
EXECUTE FUNCTION check_inventory_threshold();

