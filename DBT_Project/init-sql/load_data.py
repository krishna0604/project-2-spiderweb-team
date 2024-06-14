import os
import pandas as pd
from sqlalchemy import create_engine

# Konfigurasi koneksi PostgreSQL
db_config = {
    'user': 'postgres',
    'password': 'new_password',
    'host': 'postgres',
    'port': '5432',
    'dbname': 'postgres'
}

# Buat engine SQLAlchemy
engine = create_engine(f"postgresql://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['dbname']}")

# Daftar file CSV dan tabel target
csv_files = {
    'categories': 'categories.csv',
    'customers': 'customers.csv',
    'employees': 'employees.csv',
    'orders': 'cleaned_orders.csv',
    'products': 'products.csv',
    'suppliers': 'suppliers.csv',
    'order_details': 'order_details.csv'
}

# Muat setiap file CSV ke tabel PostgreSQL
for table_name, csv_file in csv_files.items():
    df = pd.read_csv(os.path.join('data', csv_file))
    df.to_sql(table_name, engine, if_exists='replace', index=False)
    print(f"Loaded {csv_file} into {table_name} table.")
