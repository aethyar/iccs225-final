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
