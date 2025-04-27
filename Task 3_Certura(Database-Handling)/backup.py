import sqlite3

# Connect to the database
conn = sqlite3.connect('sample_db.db')

# Open backup file
with open('backup.sql', 'w') as f:
    for line in conn.iterdump():
        f.write('%s\n' % line)

print("✅ Backup completed successfully into backup.sql file.")

conn.close()
