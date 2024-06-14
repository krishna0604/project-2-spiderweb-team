import psycopg2
from psycopg2 import sql

# Masukkan kredensial PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    database="postgres",
    user="postgres",
    password="new_password"  # Gantilah dengan kata sandi PostgreSQL Anda
)

# Buat cursor untuk eksekusi query
cursor = conn.cursor()

# Eksekusi query
cursor.execute("SELECT version();")

# Ambil hasil
record = cursor.fetchone()
print("You are connected to - ", record, "\n")

# Tutup koneksi
cursor.close()
conn.close()
