import sqlite3

# Connect to a new database (for restore)
conn = sqlite3.connect('restored_db.db')
cursor = conn.cursor()

# Open the backup file
with open('backup.sql', 'r') as f:
    sql_script = f.read()

# Execute the SQL commands
cursor.executescript(sql_script)

print("✅ Database restored successfully into restored_db.db.")

conn.commit()
conn.close()
