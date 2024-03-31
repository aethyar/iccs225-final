-- ROLLBACK;
-- staff table --
INSERT INTO staff (name, address, phone_number, email, hire_date, position, salary)
VALUES
    ('Jotsarup Narula', '123 Main St', '971-55-4830-755', 'jotsarup@student.mahidol.edu', '2022-01-01', 'Barista', 2500.00),
    ('Wayne Rooney', '456 Elm St', '971-50-2812-755', 'waynetheblane@example.com', '2022-02-01', 'Manager', 3500.00),
    ('Marcus Rashford', '789 Oak St', '971-52-4830-5010', 'rashford@example.com', '2022-03-01', 'Server', 2000.00),
    ('Andre Onana', '101 Pine St', '971-51-4345-0000', 'andresaves@example.com', '2022-04-01', 'Barista', 2400.00),
    ('Mason Mount', '202 Cedar St', '971-23-2345-2345', 'mount.mason@example.com', '2022-05-01', 'Server', 2100.00);

-- Inserting mock data into the shifts table
INSERT INTO shifts (staff_id, shift_start, shift_end, attendance_status)
VALUES
    (1, '2024-03-30 08:00:00', '2024-03-30 12:00:00', true),
    (2, '2024-03-30 12:00:00', '2024-03-30 16:00:00', true),
    (3, '2024-03-30 16:00:00', '2024-03-30 20:00:00', true),
    (4, '2024-03-31 08:00:00', '2024-03-31 12:00:00', false),
    (5, '2024-03-31 12:00:00', '2024-03-31 16:00:00', true);