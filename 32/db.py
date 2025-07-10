import sqlite3

def create_connection(db_file):
    """Create a database connection to the SQLite database specified by db_file."""
    conn = None
    try:
        conn = sqlite3.connect(db_file)
        print(f"Connected to database: {db_file}")
    except sqlite3.Error as e:
        print(f"Error connecting to database: {e}")
    return conn

db_file = "example.db"

# Create a database connection
conn = create_connection(db_file)

# Create a table if it does not exist
try:
    conn.execute('''CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
    )''')
    print("Table 'users' created successfully.")
except sqlite3.Error as e:
    print(f"Error creating table: {e}")
    
conn.execute("INSERT INTO users (name, age) VALUES ('Alice', 30)")
conn.execute("INSERT INTO users (name, age) VALUES ('Bob', 25)")
conn.execute("INSERT INTO users (name, age) VALUES ('Charlie', 35)")
conn.execute("INSERT INTO users (name, age) VALUES ('Diana', 28)")
print("Inserted sample data into 'users' table.")
conn.execute("select * from users")
print("Initial data in 'users' table:")
for row in conn.execute("SELECT * FROM users"):
    print(row)
conn.execute("UPDATE users SET age = 31 WHERE name = 'Alice'")
conn.execute("select * from users")
print("Updated Alice's age to 31:")
for row in conn.execute("SELECT * FROM users"):
    print(row)
conn.execute("DELETE FROM users WHERE name = 'Bob'")
conn.execute("select * from users")
print("Deleted Bob from 'users' table:")
for row in conn.execute("SELECT * FROM users"):
    print(row)

# Commit the changes and close the connection
conn.commit()
conn.close()