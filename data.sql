CREATE DATABASE alocine;
USE alocine;

CREATE TABLE `movie` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `release_date` date NULL,
  `media` varchar(255) NULL,
  `category_id` int NOT NULL,
  `actor_id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `realisateur_id` int NOT NULL,
  `production_id` int NOT NULL,
  `language_id` int NOT NULL
);

CREATE TABLE `category` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL
);

CREATE TABLE `cinema` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL
);

CREATE TABLE `actor` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `movies` varchar(255) NOT NULL,
  `media` varchar(255) NULL
);

CREATE TABLE `realisateur` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

CREATE TABLE `language` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `speaks` varchar(255) NOT NULL
);

CREATE TABLE `production` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL
);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_category_id' FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_language_id' FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_realisateur_id' FOREIGN KEY (`realisateur_id`) REFERENCES `realisateur` (`id`);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_cinema_id' FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_actor_id' FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`);

ALTER TABLE `movie` ADD CONSTRAINT 'FK_production_id'FOREIGN KEY (`production_id`) REFERENCES `production` (`id`);



ADDING AND MODIFING TO A TABLE:
--ALTER TABLE (name of the table) change
--ALTER TABLE table_name RENAME COLUMN oldcolumn_name to newcolumn_name;
--ALTER TABLE table_name CHANGE COLUMN oldcolumn_name to newcolumn_name;

--TO ADD SOMETHING TO A TABLE = ALTER TABLE table_name
--ADD column_name datatype;

--CHARACTER SET utf8 COLLATE 'utf8_general_ci' (this sets the caracters to utf8 = UTF-8 is a variable-length character encoding used for electronic communication.)

--INSERT INTO cinema SELECT null, `name`, 'Chez jean jack' FROM cinema WHERE id = 1; // copies and adds existing info to a new line.;
--WHERE champX (this means that you can choose what column you want to take the info from, = can be like a filter);

--NULL = NOT OBLIGATORY, NOT NULL = OBLIGATOIR;

--DELETE FROM tableName = deletes all contnte; 
--DELETE FROM TableName WHERE champsX = (is what you are looking for);
--TRUNCATE tableName; (realisalise la place des id )
-- UPDATE movie SET language = 'English' // this will update all the movies to the english langauge;
--SELECT title FROM movie WHERE release_date <= '2005-05-05';
--SELECT title, release_date FROM movie WHERE release_date <= '2005-05-05'; // these filter the info that you want to get

--SELECT title FROM movie WHERE release_date BETWEEN '2010-01-01' AND '2011-12-31'; // another way of filtering out the dates;
--SELECT title, release_date FROM movie WHERE year(release_date) = '1990'; // this will filter out all the films that were released in the year 1990;
--SELECT title, release_date FROM movie WHERE month(release_date) = '11'; // same process for the months and days;

--SELECT title FROM movie WHERE substr(title, 1,3) // 'SHR'; is to select the movie were the first 3 letters are SHR; SUBSTR(string, start, length);
--SELECT title FROM movie WHERE substr(title, 1,1) = 'S'; // same processe and the example above;

--SELECT COUNT(*) FROM movie; this counts how many things you have in a table;
--SELECT COUNT(*) AS nb_movie FROM movie; // same thing as the one before;

--SELECT * FROM `movie` ORDER BY release_date ASC; // ordered the dates of the movies in asc order (can also do DESC 'as descendant');

--SELECT * FROM movie WHERE title like 's%'; this is to select all the movies that start wis S and prits out the rest of the title with %;
--SELECT * FROM movie WHERE title like '%s%'; this is ta fins all titles that contain an S (like a REGEX).

--SELECT UPPER(title) FROM movie WHERE LOWER(title) like '%shrek%'; // to select the same name if it has min and maj in the title;
--SELECT LPAD(title,1,3) FROM movie; // this print out the first letter of every movie;
--SELECT * FROM movie ORDER BY release_date DESC LIMIT 3;// this will print out all the movies dates in desc order up to 3 movies no more should be printed;


--SELECT TRIM(BOTH'X' FROM 'XXXXXXXJERMEYXXXXXXX') AS name;  this is to take out all the XXX in the name ;
--SELECT TRIM(TRAILING'X' FROM 'XXXXXXXJERMEYXXXXXXX') AS name; this is to take out all the XXX AT THE END; 

--SELECT CONCAT(duree, '-', titre) FROM movie; 


--///////////////////////////////////////////////////////////////////////////////////////

--SELECT DATEDIF('2022-01-01', '2021-01-15'); this count hos manydays there are inbetween each other;
--SELECT DAYOFWEEK(release_date) from movie; this tells us what day of the week a film came out (in number form : 2 = monday ...)
--SELECT title FROM movie WHERE DAYOFWEEK(release_date) >=1 AND DAYOFWEEK(release_date) <= 3; this will show sunday to thuesday;


-- SELECT NOW(); selects the current tima and date;
--SELECT CAST(now() AS date);





--JOINTURE:
--SELECT * FROM film
--INNER JOIN category on film.categorie_id = category.id; // join category to film

--SELECT titre, f.date_sortie, c.nom FROM film f INNER JOIN category c ON f.categorie_id = c.id;
--// inner join wil show all that is inscribed for the request
--SELECT titre, f.date_sortie, c.nom FROM film f RIGHT JOIN category c ON f.categorie_id = c.id; this will show all film same as inner join
-- SELECT titre, f.date_sortie, c.nom FROM film f LEFT JOIN category c ON f.categorie_id = c.id;
--LEFT will show all the films that are attached to a category first and the the rest even if they are not joined;

--alter table cinema_film add constraint FK_cinema_film_film FOREIGN KEY (film_id) REFERENCES film(id);
--alter table cinema_film add constraint FK_cinema_film_cinema FOREIGN KEY (cinema_id) REFERENCES cinema(id);
--alter table cinema_film add constraint UC_cinema_film UNIQUE (film_id,cinema_id);// makes the key unique
--INSERT INTO `cinema_film` (`cinema_id`, `film_id`) VALUES ('4', '1'); //enter the 2 fK ids into the cinema_film table;

--SELECT * FROM cinema_film WHERE cinema_id = 1;


-- Exercise 
--Trouver les titre de films qui appartien au cinema id 1 (mettre les nom des cinema en plus)
--SELECT titre, nom FROM film //this selects the title of the film and the name of the cinema 
--INNER JOIN cinema_film ON cinema_film.film_id = film.id // this puts the film id in the table cinema film
--INNER JOIN cinema on cinema.id = cinema_film.cinema_id // thid joind the cinema id to the table cinema film
--WHERE cinema_film.cinema_id = 1; // where the id of the cinema table in at id 1;
/////////////////////////////////////////////////////////////////////////////////////////////
--SELECT DISTINCT `langue` FROM `film`;// show the langue once if there are 7 en it will only show it the once, as it is distinguaéching a single language

--SELECT DISTINCT `langue`, count(titre) FROM `film` GROUP BY langue; // this will count all the times a language is used,

SELECT DISTINCT ville_nom, COUNT(*) FROM `villes_france_free` GROUP BY nom;