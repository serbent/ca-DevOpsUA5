# Docker Volumes, Network, and Environment Variables​
## Docker Volumes


1. create create 3 named volumes *test*, *stage* and *prod* 
1. create 3 *ubuntu* containers for each environment with volumes mounted at */app*.
1. create a file in *prod* container 
1. inspect the volumes 
1. find the file on your local file system 
1. edit the file localy and check the changes in the container. 
1. create a process to copy files from container_prod:/app to container_stage:/app 

[TIP:] Launch a docker container that will do copying and the exit.

[NOTE]: To run container continiously you can use this syntax:
```docker run -d ubuntu bash -c "while true; do echo "1"; sleep 2; done"```

1. Bind a local path to a container. 
2. Bind the local path to 2 more containers. 
3. Create more file localy. 
4. Check the containers for newly created files.

## Docker networks 
1. Create 3 networks (network1/2/3) with different subnets (to avoid IP conflicts)
2. Create 3 nginx containers(container1/2/3) and connect them to different networks. Bind mount local directory to /usr/share/nginx/www. Create index.html localy with simple HTML 
```
<title>
    My docker networking test
</title>
<body>
    This is inside my container
</body>
```
3. Create one more nginx container(container4) and attach it to network1 and network2 
4. Curl container1, container2 and container3 from inside container4. 

## Docker port forwarding
1. Create the same containeres as in Docker networks 1. and publish container portr 8080:80, 8081:80 and 8082:80.
2. Try accessing localhost on those portrs (8080,8081,8082)

## Docker environment variables

1. Create a directory nodejs. 
2. create app.js in that directory. 
3. populate it with this content: 
```
// Import the express module
const express = require('express');
const app = express();

// Set the port number to 3000 (or use an environment variable)
const port = process.env.PORT || 3000;

// Define the route to display environment variables
app.get('/', (req, res) => {
  const environment = process.env.ENVIRONMENT || 'Not Set';
  const customText = process.env.CUSTOM_TEXT || 'Not Set';
  const currentDate = new Date().toLocaleString(); // Get current date and time

  // Send the environment variables as a response
  res.send(`
    <h1>Environment Variables</h1>
    <p><strong>ENVIRONMENT:</strong> ${environment}</p>
    <p><strong>CUSTOM_TEXT:</strong> ${customText}</p>
    <p><strong>DATE:</strong> ${currentDate}</p>
  `);
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
```
4. Install dependencies:
```
docker run -v ./nodejs:/app -w /app node:18 npm install express
```
5. Run the app with environment variables. 
[TIP:] To run nodejs application run 
``` 
node app.js
```