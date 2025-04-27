import sqlite3

# Connect to (or create) a database
conn = sqlite3.connect('sample_db.db')  # This creates a new database file called 'sample_db.db' in the same directory
cursor = conn.cursor()

# Create a simple table
cursor.execute('''
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    marks INTEGER
)
''')

# Insert sample data
cursor.executemany('''
INSERT INTO students (name, marks) VALUES (?, ?)
''', [
    ('Alice', 85),
    ('Bob', 90),
    ('Charlie', 78)
])

# Commit and close
conn.commit()
conn.close()

print("Database and sample data created successfully!")
