-- create or replace view "food_ingredients_view"
CREATE OR REPLACE VIEW food_ingredients_view AS
SELECT f.food_id,
       f.name            AS food_name,
       i.ingredient_id,
       i.name            AS ingredient_name,
       if.quantity       AS ingredient_quantity,
       i.stock           AS ingredient_stock,
       i.alert_threshold AS ingredient_alert_threshold
FROM foods f
         JOIN ingredient_food if ON f.food_id = if.food_id
         JOIN ingredients i ON if.ingredient_id = i.ingredient_id;
