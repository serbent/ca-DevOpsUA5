from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String, select


engine = create_engine('sqlite:///example.db')

# Create a new table
metadata = MetaData()
users = Table('users', metadata,
                 Column('id', Integer, primary_key=True),
                 Column('name', String, nullable=False),
                 Column('age', Integer, nullable=False))

# Create the table in the database
try:
    metadata.create_all(engine)
    print("Table 'users' created successfully.")
except exc.OperationalError as e:
    print(f"Error creating table: {e}")

# Insert some data
with engine.connect() as conn:
    conn.execute(users.insert().values(name='Nick', age=30))
    conn.execute(users.insert().values(name='Sue', age=25))
    conn.execute(users.insert().values(name='James', age=35))
    conn.execute(users.insert().values(name='Jack', age=28))
    print("Inserted sample data into 'users' table.")
conn.commit()


# Query the data
with engine.connect() as conn:
    result = conn.execute(select(users))
    print("Initial data in 'users' table:")
    for row in result:
        print(row)