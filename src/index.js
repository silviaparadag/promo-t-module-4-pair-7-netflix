const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");
const jwtutils = require("../services/jwt");

// create and config server
const server = express();

server.use(cors());
server.use(express.json());
server.set("view engine", "ejs");

// get connection

const getConnection = async () => {
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
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

// endpoints MOVIES

server.get("/movies", async (req, res) => {
  const genreFilterParam = req.query.genre;
  const sortFilterParam = req.query.sort;
  const conn = await getConnection();

  if (genreFilterParam && genreFilterParam !== "All") {
    console.log("con parámetros");
    const selectMovies = `SELECT * FROM movies WHERE genre=? ORDER BY title ${
      sortFilterParam === "desc" ? "desc" : "asc"
    }`;
    const [results] = await conn.query(selectMovies, [genreFilterParam]);
    conn.end();
    res.json({
      success: true,
      movies: results,
    });
  } else {
    console.log("sin parametros");
    const selectMovies = `SELECT * FROM movies ORDER BY title ${
      sortFilterParam === "desc" ? "desc" : "asc"
    }`;
    const [results] = await conn.query(selectMovies);
    conn.end();
    res.json({
      success: true,
      movies: results,
    });
  }
});

// POST /api/signin

server.post("/api/signin", async (req, res) => {
  res.status(501).send("Not implemented");
});

// POST /api/login

server.post("/api/login", async (req, res) => {
  res.status(501).send("Not implemented");
});

// GET /api/past-products

server.get(
  "/api/past-products",
  jwtutils.authenticateToken,
  async (req, res) => {
    res.status(501).send("Not implemented");
  }
);

// motores de plantillas

server.get("/movies/:movieId", async (req, res) => {
  const idMovie = req.params.movieId;
  const sql = `SELECT * FROM movies WHERE id= ? `;
  console.log(idMovie);
  const conn = await getConnection();
  const [results] = await conn.query(sql, idMovie);
  conn.end();
  res.render("eachMovie", results[0]);
});

// static server

server.use(express.static("./src/public-react"));
server.use(express.static("./src/public-movies-images"));
const pathServerPublicStyles = "./src/public-css";
server.use(express.static(pathServerPublicStyles));
