-- function for adding a food
CREATE OR REPLACE FUNCTION add_food(new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50),
                                    new_cost DECIMAL(10, 2), new_img_link VARCHAR(255))
    RETURNS VOID AS
$$
BEGIN
    INSERT INTO foods (name, description, category, cost, img_link)
    VALUES (new_name, new_description, new_category, new_cost, new_img_link);
END;
$$
    LANGUAGE plpgsql;

-- function for adding an ingredient
CREATE OR REPLACE FUNCTION add_ingredient(new_name VARCHAR(100), new_description TEXT, new_category VARCHAR(50),
                                          new_stock INT, new_expiry_date DATE, new_alert_threshold INT)
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
-- for updating staff info
CREATE OR REPLACE FUNCTION update_staff_info(cur_staff_id INT, new_name VARCHAR(100), new_address TEXT, new_phone_number VARCHAR(20), new_email VARCHAR(100), new_hire_date DATE, new_position VARCHAR(50), new_salary DECIMAL(10, 2))
RETURNS VOID AS
$$
BEGIN
    UPDATE staff
    SET name = new_name, address = new_address, phone_number = new_phone_number, email = new_email, hire_date = new_hire_date, position = new_position, salary = new_salary
    WHERE staff_id = cur_staff_id;
END;
$$
LANGUAGE plpgsql;

-- for updating shift info
CREATE OR REPLACE FUNCTION update_shift_info(cur_shift_id INT, new_staff_id INT, new_shift_start TIMESTAMP, new_shift_end TIMESTAMP)
RETURNS VOID AS
$$
BEGIN
    UPDATE shifts
    SET staff_id = new_staff_id, shift_start = new_shift_start, shift_end = new_shift_end
    WHERE shift_id = cur_shift_id;
END;
$$
LANGUAGE plpgsql;
-- for recording attendance
CREATE OR REPLACE FUNCTION record_attendance_function(cur_staff_id INT, cur_shift_id INT, cur_attendance_status BOOLEAN)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO attendance (staff_id, shift_id, attendance_status, attendance_time)
    VALUES (cur_staff_id, cur_shift_id, cur_attendance_status, CURRENT_TIMESTAMP);
END;
$$
LANGUAGE plpgsql;