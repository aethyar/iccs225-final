-- indexing for food categories in foods table
CREATE INDEX idx_food_category ON foods (category);
-- an index for the email column in the staff table
CREATE INDEX idx_staff_email ON staff(email);
-- Create an index on the position column in the staff table
CREATE INDEX idx_staff_position ON staff(position);
