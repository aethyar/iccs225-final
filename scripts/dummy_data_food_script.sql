-- insert dummy data into ingredients table
INSERT INTO ingredients (name, description, category, stock, expiry_date, alert_threshold)
VALUES ('Espresso Beans', 'High-quality espresso beans', 'Coffee', 500, '2025-12-31', 50),
       ('Milk', 'Fresh milk', 'Dairy', 1000, '2025-12-31', 100),
       ('Sugar', 'White sugar', 'Sweetener', 500, '2025-12-31', 50),
       ('Chocolate Sauce', 'Rich chocolate sauce', 'Condiment', 300, '2025-12-31', 30),
       ('Flour', 'All-purpose flour', 'Baking', 800, '2025-12-31', 80),
       ('Butter', 'Unsalted butter', 'Dairy', 300, '2025-12-31', 30),
       ('Yeast', 'Baker yeast', 'Baking', 200, '2025-12-31', 20),
       ('Eggs', 'Fresh eggs', 'Dairy', 400, '2025-12-31', 40),
       ('Cream Cheese', 'Soft cream cheese', 'Dairy', 200, '2025-12-31', 20),
       ('Mixed Fruit', 'Assorted fresh fruits', 'Fruit', 600, '2025-12-31', 60);

-- insert dummy data into foods table
INSERT INTO foods (name, description, category, cost)
VALUES ('Espresso', 'Strong coffee brewed by forcing hot water through finely-ground coffee beans.', 'Coffee', 100),
       ('Latte', 'Coffee drink made with espresso and steamed milk.', 'Coffee', 120),
       ('Cappuccino', 'Espresso mixed with equal parts of steamed milk and milk foam.', 'Coffee', 140),
       ('Americano', 'Black coffee made by diluting espresso with hot water.', 'Coffee', 90),
       ('Mocha', 'Espresso mixed with steamed milk and chocolate sauce.', 'Coffee', 150),
       ('Croissant', 'Buttery, flaky pastry originating from France.', 'Pastry', 50),
       ('Chocolate Croissant', 'Croissant filled with chocolate.', 'Pastry', 60),
       ('Donut', 'Sweet fried dough pastry.', 'Pastry', 50),
       ('Bagel', 'Ring-shaped bread roll.', 'Pastry', 40),
       ('Fruit Smoothie', 'Blended mixture of assorted fruits and milk.', 'Beverage', 80);

-- insert dummy data into ingredient_food table

-- Espresso Ingredients (2 Espresso Beans, 1 Milk, 1 Sugar)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (1, 1, 2),
       (2, 1, 1),
       (3, 1, 1);

-- Latte Ingredients (1 Espresso Beans, 2 Milk)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (1, 2, 1),
       (2, 2, 2);

-- Cappuccino Ingredients (2 Espresso Beans, 2 Milk, 1 Chocolate Sauce)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (1, 3, 2),
       (2, 3, 2),
       (4, 3, 1);

-- Americano Ingredients (1 Espresso Beans, 1 Water)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (1, 4, 1),
       (8, 4, 1);

-- Mocha Ingredients (2 Espresso Beans, 2 Milk, 1 Chocolate Sauce)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (1, 5, 2),
       (2, 5, 2),
       (4, 5, 1);

-- Croissant Ingredients (2 Flour, 1 Butter, 1 Yeast)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (5, 6, 2),
       (6, 6, 1),
       (7, 6, 1);

-- Chocolate Croissant Ingredients (1 Butter, 1 Chocolate Sauce)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (6, 7, 1),
       (4, 7, 1);

-- Donut Ingredients (1 Flour, 1 Sugar, 1 Yeast)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (5, 8, 1),
       (3, 8, 2),
       (7, 8, 1);

-- Bagel Ingredients (1 Flour, 1 Flour)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (5, 9, 1),
       (7, 9, 1);

-- Fruit Smoothie Ingredients (2 Mixed Fruit, 1 Milk, 1 Sugar)
INSERT INTO ingredient_food (ingredient_id, food_id, quantity)
VALUES (10, 10, 2),
       (2, 10, 1),
       (3, 10, 1);

-- insert dummy data into transactions table
INSERT INTO transactions (time, food_id, quantity, total_price)
VALUES ('2024-04-01 08:30:00', 1, 2, 200),
       ('2024-04-01 09:15:00', 2, 1, 120),
       ('2024-04-01 10:00:00', 3, 1, 140),
       ('2024-04-02 08:45:00', 8, 3, 150),
       ('2024-04-02 09:30:00', 6, 2, 100),
       ('2024-04-02 10:15:00', 10, 2, 160),
       ('2024-04-03 08:30:00', 5, 4, 200),
       ('2024-04-03 09:15:00', 7, 2, 120),
       ('2024-04-03 10:00:00', 4, 1, 90),
       ('2024-04-04 08:45:00', 9, 1, 80);
