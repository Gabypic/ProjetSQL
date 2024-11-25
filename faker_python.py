import mysql.connector
from faker import Faker
import random

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="e-commerce"
)

cursor = conn.cursor()

# Initialisation de Faker
fake = Faker()

from datetime import datetime, timedelta
import random

def random_datetime(start_date, end_date):
    start_timestamp = int(start_date.timestamp())
    end_timestamp = int(end_date.timestamp())

    random_timestamp = random.randint(start_timestamp, end_timestamp)

    return datetime.fromtimestamp(random_timestamp)

# Génération de données pour Utilisateur
def insert_users(n):
    for _ in range(n):
        query = """
        INSERT INTO user (firstname, lastname, username)
        VALUES (%s, %s, %s)
        """
        values = (fake.first_name(), fake.last_name(), fake.user_name())
        cursor.execute(query, values)
    conn.commit()

def insert_addresses(n):
    cursor.execute("SELECT user_id FROM user")
    user_ids = [i[0] for i in cursor.fetchall()]
    for _ in range(n):
        query = """
        INSERT INTO address (user_id, street_address, city, postal_code)
        VALUES (%s, %s, %s, %s)
        """
        values = (random.choice(user_ids), fake.street_name(), fake.city(), fake.zipcode())
        cursor.execute(query, values)
    conn.commit()

# Génération de données pour Product
def insert_products(n):
    for _ in range(n):
        query = """
        INSERT INTO product (name, description, Price, stock_available)
        VALUES (%s, %s, %s, %s)
        """
        values = (fake.word(), fake.text(max_nb_chars=50), random.randint(10, 1000), random.randint(0, 500))
        cursor.execute(query, values)
    conn.commit()

def insert_cart_product(n):
    cursor.execute("SELECT product_id FROM product")
    user_ids = [i[0] for i in cursor.fetchall()]
    for _ in range(n):
        query = """
        INSERT INTO cart_product (product_id, quantity)
        VALUES (%s, %s)
        """
        values = (random.choice(user_ids), random.randint(1, 10))
        cursor.execute(query, values)
    conn.commit()

# Génération de données pour ProductCart
def insert_product_cart(n):
    cursor.execute("SELECT command_id FROM command")
    command_ids = [i[0] for i in cursor.fetchall()]
    cursor.execute("SELECT user_id FROM user")
    user_ids = [i[0] for i in cursor.fetchall()]
    cursor.execute("SELECT cart_product_id FROM cart_product")
    cart_product_ids = [i[0] for i in cursor.fetchall()]
    for _ in range(n):
        query = """
        INSERT INTO cart (user_id, command_id, cart_product_id)
        VALUES (%s, %s, %s)
        """
        values = (random.choice(user_ids), random.choice(command_ids), random.choice(cart_product_ids))
        cursor.execute(query, values)
    conn.commit()

# Génération de données pour Cart
#def insert_carts(n):
#    cursor.execute("SELECT IDProductCart FROM ProductCart")
#    product_cart_ids = [i[0] for i in cursor.fetchall()]
#    for _ in range(n):
#        query = """
#        INSERT INTO Cart (IDProductCart)
#        VALUES (%s)
#        """
#        values = (random.choice(product_cart_ids),)
#        cursor.execute(query, values)
#    conn.commit()

# Génération de données pour Command
def insert_commands(n):
    cursor.execute("SELECT user_id FROM user")
    user_ids = [i[0] for i in cursor.fetchall()]
    cursor.execute("SELECT product_id FROM product")
    product_ids = [i[0] for i in cursor.fetchall()]
    for _ in range(n):
        query = """
        INSERT INTO command (user_id, product_id, quantity)
        VALUES (%s, %s, %s)
        """
        values = (random.choice(user_ids), random.choice(product_ids), random.randint(1, 15))
        cursor.execute(query, values)
    conn.commit()

# Génération de données pour Invoice
def insert_invoices(n):
    cursor.execute("SELECT user_id FROM user")
    user_ids = [i[0] for i in cursor.fetchall()]
    cursor.execute("SELECT product_id FROM product")
    product_ids = [i[0] for i in cursor.fetchall()]
    for _ in range(n):
        query = """
        INSERT INTO invoices (user_id, product_id, order_date)
        VALUES (%s, %s, %s)
        """
        values = (random.choice(user_ids), random.choice(product_ids),  random_datetime(datetime(2020, 1, 1), datetime(2024, 12, 31)))
        cursor.execute(query, values)
    conn.commit()

# Exécution des fonctions
insert_users(10)
insert_addresses(10)
insert_products(10)
insert_commands(10)
insert_cart_product(20)
insert_product_cart(20)
insert_invoices(10)

# Fermeture de la connexion
cursor.close()
conn.close()