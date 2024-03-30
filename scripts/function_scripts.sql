-- function for adding a food
CREATE OR REPLACE FUNCTION add_food(new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50), new_cost DECIMAL(10, 2), new_img_link VARCHAR(255))
RETURNS VOID AS
$$
BEGIN
    INSERT INTO foods (name, description, category, cost, img_link)
    VALUES (new_name, new_description, new_category, new_cost, new_img_link);
END;
$$
LANGUAGE plpgsql;

-- function for adding an ingredient
CREATE OR REPLACE FUNCTION add_ingredient(new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50), new_stock INT, new_expiry_date DATE, new_alert_threshold INT)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO ingredients (name, description, category, stock, expiry_date, alert_threshold)
    VALUES (new_name, new_description, new_category, new_stock, new_expiry_date, new_alert_threshold);
END;
$$
LANGUAGE plpgsql;

-- function for adding a connection between food and ingredient
CREATE OR REPLACE FUNCTION add_ingredient_food_connection(new_ingredient_id INT, new_food_id INT, new_quantity INT)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
    VALUES (new_ingredient_id, new_food_id, new_quantity);
END;
$$
LANGUAGE plpgsql;
