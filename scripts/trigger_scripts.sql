-- Create a trigger function to update ingredients table after each transaction
CREATE OR REPLACE FUNCTION update_ingredient_stock()
    RETURNS TRIGGER AS
$$
DECLARE
    ingredient_id_list       INT[];
    ingredient_quantity_list INT[];
    i                        INT;
BEGIN
    -- Fetch the list of ingredient IDs and their respective quantities for the given food_id
    SELECT ARRAY(SELECT if.ingredient_id FROM ingredient_food if WHERE if.food_id = NEW.food_id),
           ARRAY(SELECT if.quantity FROM ingredient_food if WHERE if.food_id = NEW.food_id)
    INTO ingredient_id_list, ingredient_quantity_list;

    -- Loop through each ingredient and update its stock
    FOR i IN 1..array_length(ingredient_id_list, 1)
        LOOP
            -- Update the stock of the ingredient based on the quantity used in the transaction
            UPDATE ingredients
            SET stock = stock - (NEW.quantity * ingredient_quantity_list[i])
            WHERE ingredient_id = ingredient_id_list[i];

            -- Check if the updated stock is negative
            IF (SELECT stock FROM ingredients WHERE ingredient_id = ingredient_id_list[i]) < 0 THEN
                -- Raise an exception if stock becomes negative
                RAISE EXCEPTION 'Stock of ingredient % became negative after transaction. Transaction cancelled.', ingredient_id_list[i];
            END IF;
        END LOOP;

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

-- for staff management --
-- Create a trigger function to update ingredients table after each transaction
CREATE OR REPLACE FUNCTION update_ingredient_stock()
    RETURNS TRIGGER AS
$$
DECLARE
    ingredient_id_list       INT[];
    ingredient_quantity_list INT[];
    i                        INT;
BEGIN
    -- Fetch the list of ingredient IDs and their respective quantities for the given food_id
    SELECT ARRAY(SELECT if.ingredient_id FROM ingredient_food if WHERE if.food_id = NEW.food_id),
           ARRAY(SELECT if.quantity FROM ingredient_food if WHERE if.food_id = NEW.food_id)
    INTO ingredient_id_list, ingredient_quantity_list;

    -- Loop through each ingredient and update its stock
    FOR i IN 1..array_length(ingredient_id_list, 1)
        LOOP
            -- Update the stock of the ingredient based on the quantity used in the transaction
            UPDATE ingredients
            SET stock = stock - (NEW.quantity * ingredient_quantity_list[i])
            WHERE ingredient_id = ingredient_id_list[i];

            -- Check if the updated stock is negative
            IF (SELECT stock FROM ingredients WHERE ingredient_id = ingredient_id_list[i]) < 0 THEN
                -- Raise an exception if stock becomes negative
                RAISE EXCEPTION 'Stock of ingredient % became negative after transaction. Transaction cancelled.', ingredient_id_list[i];
            END IF;
        END LOOP;

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

-- shifts --
-- Create a trigger function to update ingredients table after each transaction
CREATE OR REPLACE FUNCTION update_ingredient_stock()
    RETURNS TRIGGER AS
$$
DECLARE
    ingredient_id_list       INT[];
    ingredient_quantity_list INT[];
    i                        INT;
BEGIN
    -- Fetch the list of ingredient IDs and their respective quantities for the given food_id
    SELECT ARRAY(SELECT if.ingredient_id FROM ingredient_food if WHERE if.food_id = NEW.food_id),
           ARRAY(SELECT if.quantity FROM ingredient_food if WHERE if.food_id = NEW.food_id)
    INTO ingredient_id_list, ingredient_quantity_list;

    -- Loop through each ingredient and update its stock
    FOR i IN 1..array_length(ingredient_id_list, 1)
        LOOP
            -- Update the stock of the ingredient based on the quantity used in the transaction
            UPDATE ingredients
            SET stock = stock - (NEW.quantity * ingredient_quantity_list[i])
            WHERE ingredient_id = ingredient_id_list[i];

            -- Check if the updated stock is negative
            IF (SELECT stock FROM ingredients WHERE ingredient_id = ingredient_id_list[i]) < 0 THEN
                -- Raise an exception if stock becomes negative
                RAISE EXCEPTION 'Stock of ingredient % became negative after transaction. Transaction cancelled.', ingredient_id_list[i];
            END IF;
        END LOOP;

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
