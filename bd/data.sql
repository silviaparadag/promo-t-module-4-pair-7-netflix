CREATE TABLE `netflix`.`movies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NULL,
  `image` VARCHAR(1000) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `year` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

  CREATE TABLE `netflix`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `plan_details` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `idusers_UNIQUE` (`idusers` ASC) VISIBLE);

CREATE TABLE `netflix`.`actors` (
  `idActors` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `year_birthday` INT NULL,
  PRIMARY KEY (`idActors`),
  UNIQUE INDEX `idActors_UNIQUE` (`idActors` ASC) VISIBLE);


INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('Pulp Fiction', 'Crimen', 'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg', 'Top 10', '1994');
INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg', 'Top 10', '1996');
INSERT INTO `netflix`.`movies` (`title`, `genre`, `image`, `category`, `year`) VALUES ('Forrest Gump', 'Comedia', 'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg', 'Top 10', '1994');

INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard');
INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard');
INSERT INTO `netflix`.`users` (`user`, `password`, `name`, `email`, `plan_details`) VALUES ('ester_dev', 'ester', 'Ester', 'ester@gmail.com', 'Standard');

INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Tom', 'Hanks', 'Estados Unidos', '1956');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('Roberto', 'Benigni', 'Italia', '1952');
INSERT INTO `netflix`.`actors` (`name`, `lastname`, `country`, `year_birthday`) VALUES ('John', 'Travolta', 'Estados Unidos', '1954');
