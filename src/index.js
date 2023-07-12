const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise')

// create and config server
const server = express();


server.use(cors());
server.use(express.json());


// get connection


const getConnection = async () => {
    const connection = await mysql.createConnection( {
        host: 'localhost', 
        user: 'root', 
        password: process.env.PASS,
        database: 'netflix'

    });
    connection.connect();
    return connection;
};

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

// endpoints

server.get('/movies', async (req, res) => {

  const selectMovies = 'SELECT * FROM movies';
  const conn = await getConnection();
  const [results, cols] = await conn.query(selectMovies);
  console.log(results);
  conn.end();
  res.json(results)
})

/* {
  success: true,
  movies:  results
}
*/
 

