# Commands used during the demo:  

Enter the mysql CLI:  
`docker exec -it -p ${PWD}:/app -w /app mysql mysql -u root -p`

Load data to DB:  
`docker exec -it -p ${PWD}:/app -w /app mysql mysql -u root -p < /app/mysql.sql`

Select the database:  
`use university_db;`

Select records from tables:  
```
SELECT * FROM students;
SELECT * FROM dorms;
SELECT * FROM universities;
```

