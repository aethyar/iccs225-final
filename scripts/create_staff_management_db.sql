DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS shifts CASCADE;
DROP TABLE IF EXISTS attendance CASCADE;

CREATE TABLE staff
(
    staff_id     SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    address      TEXT,
    phone_number VARCHAR(20),
    email        VARCHAR(100),
    hire_date    DATE,
    position     VARCHAR(50),
    salary       DECIMAL(10, 2),
    CONSTRAINT unique_email UNIQUE (email) -- Ensuring emails are unique
);

CREATE TABLE shifts
(
    shift_id          SERIAL PRIMARY KEY,
    staff_id          INT       NOT NULL,
    shift_start       TIMESTAMP NOT NULL,
    shift_end         TIMESTAMP NOT NULL,
    attendance_status BOOLEAN,
    CONSTRAINT fk_staff_shift FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

CREATE TABLE attendance
(
    attendance_id     SERIAL PRIMARY KEY,
    staff_id          INT       NOT NULL,
    shift_id          INT       NOT NULL,
    attendance_time   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    attendance_status BOOLEAN,
    CONSTRAINT fk_staff_attendance FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    CONSTRAINT fk_shift_attendance FOREIGN KEY (shift_id) REFERENCES shifts (shift_id)
);