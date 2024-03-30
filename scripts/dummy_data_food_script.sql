-- insert dummy data into ingredients table
INSERT INTO ingredients (name, description, category, quantity, expiry_date, alert_threshold) VALUES
('Espresso Beans', 'High-quality espresso beans', 'Coffee', 50, '2024-06-30', 10),
('Milk', 'Fresh milk', 'Dairy', 100, '2024-04-30', 20),
('Sugar', 'White sugar', 'Sweetener', 200, NULL, 50),
('Flour', 'All-purpose flour', 'Baking', 50, '2024-12-31', 10),
('Butter', 'Unsalted butter', 'Dairy', 30, '2024-08-31', 5);

-- insert dummy data into foods table
INSERT INTO foods (name, description, category, cost, img_link) VALUES
('Espresso', 'Strong coffee brewed by forcing hot water through finely-ground coffee beans.', 'Coffee', 2.50, NULL),
('Latte', 'Coffee drink made with espresso and steamed milk.', 'Coffee', 3.00, NULL),
('Cappuccino', 'Espresso mixed with equal parts of steamed milk and milk foam.', 'Coffee', 3.50, NULL),
('Croissant', 'Buttery, flaky pastry originating from France.', 'Pastry', 2.00, NULL),
('Chocolate Croissant', 'Croissant filled with chocolate.', 'Pastry', 2.50, NULL);

-- insert dummy data into transactions table
INSERT INTO transactions (time, food_id, quantity, total_price) VALUES
('2024-03-31 08:30:00', 1, 1, 2.50),
('2024-03-31 09:15:00', 2, 1, 3.00),
('2024-03-31 10:00:00', 4, 2, 4.00);

-- insert dummy data into ingredient_food table
INSERT INTO ingredient_food (ingredient_id, food_id) VALUES
(1, 1), -- Espresso Beans used in Espresso
(2, 2), -- Milk used in Latte
(1, 3), -- Espresso Beans used in Cappuccino
(2, 3), -- Milk used in Cappuccino
(2, 4), -- Milk used in Croissant
(5, 4); -- Butter used in Croissant
