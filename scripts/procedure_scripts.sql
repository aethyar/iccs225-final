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

-- procedure to update shift information
CREATE OR REPLACE PROCEDURE update_shift_info(cur_shift_id INT, new_staff_id INT, new_shift_start TIMESTAMP,
                                              new_shift_end TIMESTAMP)
    LANGUAGE plpgsql AS
$$
BEGIN
    UPDATE shifts
    SET staff_id    = new_staff_id,
        shift_start = new_shift_start,
        shift_end   = new_shift_end
    WHERE shift_id = cur_shift_id;
END;
$$;