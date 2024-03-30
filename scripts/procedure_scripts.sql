-- procedure to update food information
CREATE OR REPLACE PROCEDURE update_food_info(cur_food_id INT, new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50), new_cost DECIMAL(10, 2), new_img_link VARCHAR(255))
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE "foods"
    SET "name" = new_name, "description" = new_description, "category" = new_category, "cost" = new_cost, "img_link" = new_img_link
    WHERE "food_id" = cur_food_id;
END;
$$;

-- procedure to update ingredient information
CREATE OR REPLACE PROCEDURE update_ingredient_info(cur_ingredient_id INT, new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50), new_quantity INT, new_expiry_date DATE, new_alert_threshold INT)
LANGUAGE plpgsql AS $$
BEGIN
    UPDATE "ingredients"
    SET "name" = new_name, "description" = new_description, "category" = new_category, "quantity" = new_quantity, "expiry_date" = new_expiry_date, "alert_threshold" = new_alert_threshold
    WHERE "ingredient_id" = cur_ingredient_id;
END;
$$;

