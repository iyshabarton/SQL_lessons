CREATE DATABASE alocine;
USE alocine;

CREATE TABLE `movie` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `release_date` date NULL,
  `media` varchar NULL,
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
  `media` varchar NULL
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

ALTER TABLE `movie` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`realisateur_id`) REFERENCES `realisateur` (`id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`);

ALTER TABLE `movie` ADD FOREIGN KEY (`production_id`) REFERENCES `production` (`id`);

