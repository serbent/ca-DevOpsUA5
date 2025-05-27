Commands:  

Access the mongoDB CLI:  
`docker exec -it mongodb mongosh -u root -p example --authenticationDatabase admin`
  
Use or create a database  
`use movieapp` 

Insert data  
```
db.movies.insertMany([
  { title: "The Matrix", year: 1999, genre: "Sci-Fi" },
  { title: "Inception", year: 2010, genre: "Sci-Fi" },
  { title: "The Godfather", year: 1972, genre: "Crime" },
  { title: "Interstellar", year: 2014, genre: "Sci-Fi" },
  { title: "Parasite", year: 2019, genre: "Thriller" }
])
```

Retrieve all movies:   
```
db.movies.find().pretty()
```

Find movies by genre:  
`db.movies.find({ genre: "Sci-Fi" }).pretty()
`

Find movies after y2000:  
`db.movies.find({ year: { $gt: 2000 } }).pretty()
`

Count all movies:  
`db.movies.countDocuments()
`

Update a movie:  
```
db.movies.updateOne(
  { title: "Inception" },
  { $set: { genre: "Science Fiction" } }
)
```

Delete a movie:  
`db.movies.deleteOne({ title: "The Godfather" })
`


