import psycopg2
import pandas as pd
import numpy as np
from faker import Faker
import random

# Initialize Faker
fake = Faker()

# Number of synthetic customers
N = 200  

# Generate Customers Table
customers = []
for i in range(1, N+1):
    customers.append((
        i,
        random.randint(18, 65),  # age
        random.randint(20000, 150000),  # income
        random.choice(["Engineer", "Doctor", "Teacher", "Student", "Business"]),
        random.choice(["North", "South", "East", "West"])
    ))

customers_df = pd.DataFrame(customers, columns=["customer_id","age","income","occupation","region"])

# Generate Credit History Table
credit_history = []
for i in range(1, N+1):
    default_val = random.choice([True, False])  # boolean
    credit_history.append((
        i,
        random.randint(300, 850),
        random.randint(0, 5),
        default_val
    ))

credit_df = pd.DataFrame(credit_history, columns=["customer_id","credit_score","existing_cards","default_history"])

# Generate Transactions Table
transactions = []
for i in range(1, N*3):  # multiple transactions per customer
    transactions.append((
        i,
        random.randint(1, N),
        random.randint(500, 5000)  # monthly spend
    ))

transactions_df = pd.DataFrame(transactions, columns=["transaction_id","customer_id","monthly_spend"])

# Generate Marketing Response Table
marketing_response = []
for i in range(1, N+1):
    adopted_val = random.choice([True, False])  # boolean
    marketing_response.append((
        i,
        adopted_val
    ))
    
marketing_df = pd.DataFrame(marketing_response, columns=["customer_id","adopted"])


# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="credit_card_project",
    user="postgres",
    password="Sneha@40",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Clear old data before inserting new (important to avoid duplicate key errors)
cur.execute("TRUNCATE customers, credit_history, transactions, marketing_response RESTART IDENTITY CASCADE;")
conn.commit()

# Insert Customers
for row in customers:
    cur.execute("""
        INSERT INTO customers (customer_id, age, income, occupation, region)
        VALUES (%s, %s, %s, %s, %s)
    """, row)

# Insert Credit History
for row in credit_history:
    cur.execute("""
        INSERT INTO credit_history (customer_id, credit_score, existing_cards, default_history)
        VALUES (%s, %s, %s, %s)
    """, row)

# Insert Transactions
for row in transactions:
    cur.execute("""
        INSERT INTO transactions (transaction_id, customer_id, monthly_spend)
        VALUES (%s, %s, %s)
    """, row)

# Insert Marketing Response
for row in marketing_response:
    cur.execute("""
        INSERT INTO marketing_response (customer_id, adopted)
        VALUES (%s, %s)
    """, row)

# Commit and close
conn.commit()
cur.close()
conn.close()


# Export synthetic dataframes to CSV
customers_df.to_csv("customers.csv", index=False)
credit_df.to_csv("credit_history.csv", index=False)
transactions_df.to_csv("transactions.csv", index=False)
marketing_df.to_csv("marketing_response.csv", index=False)
