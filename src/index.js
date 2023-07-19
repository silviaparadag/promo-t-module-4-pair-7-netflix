const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

// create and config server
const server = express();

server.use(cors());
server.use(express.json());

// get connection

const getConnection = async () => {
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "manzana12393",
    database: "netflix",
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

server.get("/movies", async (req, res) => {
  const genreFilterParam = req.query.genre;
  

  const conn = await getConnection();
  

  if (genreFilterParam && genreFilterParam !== 'All') {
    console.log('con parámetros');
    const selectMovies = `SELECT * FROM movies WHERE genre=? `;
    const [results] = await conn.query(selectMovies, genreFilterParam);
    conn.end();
    res.json({
      success: true,
      movies: results,
    });
  } else {
  console.log('sin parametros');
  const selectMovies = `SELECT * FROM movies  `;
  const [results] = await conn.query(selectMovies);
  conn.end();
  res.json({
    success: true,
    movies: results,
  });}
});

// static server

server.use(express.static("./src/public-react"));
server.use(express.static("./src/public-movies-images"));

