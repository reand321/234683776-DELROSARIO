import mysql.connector

# Connect to the database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="testdb"
)

cursor = conn.cursor()

# Execute a query
cursor.execute("SELECT * FROM users")

# Fetch and print all rows
for row in cursor.fetchall():
    print(row)

# Close the connection
cursor.close()
conn.close()

