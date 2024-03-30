-- create or replace view "food_ingredients_view"
CREATE OR REPLACE VIEW food_ingredients_view AS
SELECT f.food_id,
       f.name            AS food_name,
       f.description     AS food_description,
       f.category        AS food_category,
       f.cost            AS food_cost,
       f.img_link        AS food_img_link,
       i.ingredient_id,
       i.name            AS ingredient_name,
       i.description     AS ingredient_description,
       i.category        AS ingredient_category,
       i.stock           AS ingredient_stock,
       i.expiry_date     AS ingredient_expiry_date,
       i.alert_threshold AS ingredient_alert_threshold,
       if.quantity       AS ingredient_quantity
FROM foods f
         JOIN ingredient_food if ON f.food_id = if.food_id
         JOIN ingredients i ON if.ingredient_id = i.ingredient_id;
