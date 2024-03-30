DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS ingredient;

-- Create ingredient table
CREATE TABLE ingredient (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    expiry_date DATE,
    alert_threshold INT
);

-- Create food table
CREATE TABLE food (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ingredient_ids INT[] DEFAULT ARRAY []::INT[],
    price money NOT NULL
);

-- Create transaction table
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    food_id INT,
    quantity INT NOT NULL,
    amount money NOT NULL,
    CONSTRAINT transaction_food_fk FOREIGN KEY (food_id) REFERENCES food (id)
);
