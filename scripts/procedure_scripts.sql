-- procedure to update staff information
CREATE OR REPLACE PROCEDURE update_staff_info(cur_staff_id INT, new_name VARCHAR(100), new_address TEXT,
                                              new_phone_number VARCHAR(20), new_email VARCHAR(100), new_hire_date DATE,
                                              new_position VARCHAR(50), new_salary DECIMAL(10, 2))
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE staff
    SET name         = new_name,
        address      = new_address,
        phone_number = new_phone_number,
        email        = new_email,
        hire_date    = new_hire_date,
        position     = new_position,
        salary       = new_salary
    WHERE staff_id = cur_staff_id;
END;
$$;

CREATE OR REPLACE PROCEDURE update_shift_info(cur_shift_id INT, new_staff_id INT, new_shift_start TIMESTAMP, new_shift_end TIMESTAMP)
AS $$
DECLARE
    change_timestamp TIMESTAMP;
BEGIN
    change_timestamp := NOW();
    UPDATE shifts
    SET
        staff_id = new_staff_id,
        shift_start = new_shift_start,
        shift_end = new_shift_end,
        change_timestamp = change_timestamp
    WHERE shift_id = cur_shift_id;

    -- log the shift update
    INSERT INTO shifts (operation, shift_id, staff_id, shift_start, shift_end, change_timestamp)
    VALUES ('UPDATE', cur_shift_id, new_staff_id, new_shift_start, new_shift_end, change_timestamp);

END;
$$ LANGUAGE plpgsql;
