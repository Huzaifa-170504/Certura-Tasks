import sqlite3

# Connect to the restored database
conn = sqlite3.connect('restored_db.db')
cursor = conn.cursor()

# Query to select all records from the 'students' table
cursor.execute('SELECT * FROM students')

# Fetch all the rows from the query result
rows = cursor.fetchall()

# Print each row (student record)
for row in rows:
    print(row)

# Close the connection
conn.close()
