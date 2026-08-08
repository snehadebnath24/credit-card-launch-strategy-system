CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  age INT,
  income NUMERIC(10,2),
  occupation VARCHAR(50),
  region VARCHAR(50)
);


CREATE TABLE credit_history (
  customer_id INT REFERENCES customers(customer_id),
  credit_score INT,
  existing_cards INT,
  default_history BOOLEAN
);


CREATE TABLE transactions (
  transaction_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  monthly_spend NUMERIC(10,2)
);


CREATE TABLE marketing_response (
  customer_id INT REFERENCES customers(customer_id),
  adopted BOOLEAN
);


SELECT * FROM customers LIMIT 10;
SELECT * FROM credit_history LIMIT 10;
SELECT * FROM transactions LIMIT 10;
SELECT * FROM marketing_response LIMIT 10;
