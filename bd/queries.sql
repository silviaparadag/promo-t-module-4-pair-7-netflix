SELECT * FROM movies;

INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg', 'Top 10', '1996');

-- SOBRE LAS PELÍCULAS 

SELECT title, genre 
	FROM movies
    WHERE year > 1990;
    
SELECT title 
	FROM movies
    WHERE category = 'Top 10';
    
UPDATE movies
	SET year = 1997
    WHERE id=3; 
    
-- SOBRE LAS ACTORES 

SELECT * FROM actors;
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Tom', 'Hanks', 'Estados Unidos', '1956');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('John', 'Travolta', 'Estados Unidos', '1954');
    
SELECT name 
	FROM actors
    WHERE year_birthday BETWEEN 1950 and 1960;
    
    
SELECT name, lastname
	FROM actors
    WHERE country = 'Estados Unidos';

SELECT * FROM users;

INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard');
INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard');
    
DELETE 
	FROM users
    WHERE name LIKE 'M%' ;

ALTER TABLE actors
	ADD photo VARCHAR(128);
    
DROP TABLE actors;

CREATE TABLE `netflix`.`actors` (
  `idActors` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `year_birthday` INT NULL,
  PRIMARY KEY (`idActors`),
  UNIQUE INDEX `idActors_UNIQUE` (`idActors` ASC) VISIBLE);

INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Tom', 'Hanks', 'Estados Unidos', '1956');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Roberto', 'Benigni', 'Italia', '1952');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('John', 'Travolta', 'Estados Unidos', '1954');

    