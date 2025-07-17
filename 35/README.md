# Commands used.


POST from file
```
curl -X POST http://localhost:5000/users -H "Content-Type: application/json" -d @new_user.json
```

GET all users
```
curl http://localhost:5000/users
```

POST user inline
```
curl -X POST http://localhost:5000/users -H "Content-Type: application/json" -d '{"name":"Carmen Gereiro", "
email":"camern.gereiro@yahoo.es"}'
```

Update (PUT) user inline
```
curl -X PUT http://localhost:5000/users/2 -H "Content-Type: application/json" -d '{"name":"Carmen Gereiro", "email":"camern.gereiro@yahoo.mx"
```

DELETE specific user
```
curl -X DELETE http://localhost:5000/users/1
```