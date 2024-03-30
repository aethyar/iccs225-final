DROP TABLE IF EXISTS ingredient_food;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS foods;
DROP TABLE IF EXISTS ingredients;

-- create ingredients
CREATE TABLE "ingredients"
(
    "ingredient_id"   SERIAL PRIMARY KEY,
    "name"            VARCHAR(100) NOT NULL,
    "description"     TEXT,
    "category"        VARCHAR(50)  NOT NULL,
    "quantity"        INT          NOT NULL,
    "expiry_date"     DATE,
    "alert_threshold" INT
);

-- create foods
CREATE TABLE "foods"
(
    "food_id"     SERIAL PRIMARY KEY,
    "name"        VARCHAR(100)   NOT NULL,
    "description" TEXT           NOT NULL,
    "category"    VARCHAR(50)    NOT NULL,
    "cost"        DECIMAL(10, 2) NOT NULL,
    "img_link"    VARCHAR(255)
);

-- create transactions
CREATE TABLE "transactions"
(
    "transaction_id" SERIAL PRIMARY KEY,
    "time"           TIMESTAMP      NOT NULL,
    "food_id"        INT            NOT NULL,
    "quantity"       INT            NOT NULL,
    "total_price"    DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_food FOREIGN KEY (food_id) REFERENCES foods (food_id)
);

-- create connection between ingredients and foods
CREATE TABLE "ingredient_food"
(
    "ingredient_id" INT REFERENCES ingredients (ingredient_id),
    "food_id"       INT REFERENCES foods (food_id),
    PRIMARY KEY (ingredient_id, food_id)
)
