﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 2023.02.24. 10:57:47
-- Server version: 5.5.5-10.1.38-MariaDB
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS diakmunka;

CREATE DATABASE diakmunka
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;

--
-- Set default database
--
USE diakmunka;

--
-- Create table `students`
--
CREATE TABLE students (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) DEFAULT NULL,
  datetime DATETIME DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `employers`
--
CREATE TABLE employers (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) DEFAULT NULL,
  settlement VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 1489,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create table `projects`
--
CREATE TABLE projects (
  id INT(11) NOT NULL AUTO_INCREMENT,
  employerid INT(11) DEFAULT NULL,
  studentid INT(11) DEFAULT NULL,
  job VARCHAR(255) DEFAULT NULL,
  date DATETIME DEFAULT NULL,
  hourlyrate INT(11) DEFAULT NULL,
  numberofhours INT(11) DEFAULT NULL,
  highschoolstudent INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 124,
AVG_ROW_LENGTH = 399,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

--
-- Create foreign key
--
ALTER TABLE projects 
  ADD CONSTRAINT FK_projects_employers_id FOREIGN KEY (employerid)
    REFERENCES employers(id);

--
-- Create foreign key
--
ALTER TABLE projects 
  ADD CONSTRAINT FK_projects_students_id FOREIGN KEY (studentid)
    REFERENCES students(id);

--
-- Create table `users`
--
CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(255) DEFAULT NULL,
  lastName VARCHAR(255) DEFAULT NULL,
  gender VARCHAR(255) DEFAULT NULL,
  userName VARCHAR(255) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  number INT(11) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_hungarian_ci;

-- 
-- Dumping data for table students
--
INSERT INTO students VALUES
(1, 'Kos Péter', '1987-11-05 00:00:00'),
(2, 'Port Imre', '1990-05-05 00:00:00'),
(3, 'Kovács Imre', '1984-03-02 00:00:00'),
(4, 'Horváth Emil', '1988-05-02 00:00:00'),
(5, 'Kapos Petra', '1985-12-23 00:00:00'),
(6, 'Csóka Anna', '1981-11-30 00:00:00'),
(7, 'Nyúl Tamás', '1988-02-16 00:00:00'),
(8, 'Ordasi Emma', '1989-01-03 00:00:00'),
(9, 'Koppány Olga', '1984-02-28 00:00:00'),
(10, 'Kozma Patrícia', '1983-06-01 00:00:00');

-- 
-- Dumping data for table employers
--
INSERT INTO employers VALUES
(1, 'Bicaj Futárszolgálat', 'Csepűfalva'),
(2, 'Soós Pékség', 'Szombati'),
(3, 'Pokol Vagyonvédelem', 'Komád'),
(4, 'Vass Kereskedés', 'Zombrád'),
(5, 'Kati Virágbolt', 'Komád'),
(6, 'Fekete Kávéház', 'Szombati'),
(7, 'Körúti Kávéház', 'Csepűfalva'),
(8, 'Királyi Cukrászat', 'Zombrád'),
(9, 'Konty Fodrászat', 'Szombati'),
(10, 'Falat Pékség', 'Komád'),
(11, 'Korr Vaskereskedés', 'Csepűfalva');

-- 
-- Dumping data for table users
--
-- Table diakmunka.users does not contain any data (it is empty)

-- 
-- Dumping data for table projects
--
INSERT INTO projects VALUES
(83, 1, 1, 'kézbesítő', '2003-07-02 00:00:00', 400, 4, 0),
(84, 1, 2, 'ügyfélszolgálati munkatárs', '2003-07-03 00:00:00', 300, 4, 0),
(85, 2, 1, 'kisegítő', '2003-07-01 00:00:00', 500, 4, 1),
(86, 2, 2, 'eladó', '2003-07-01 00:00:00', 350, 4, 0),
(87, 1, 1, 'kézbesítő', '2003-07-03 00:00:00', 450, 6, 0),
(88, 1, 2, 'futár', '2003-07-06 00:00:00', 300, 5, 1),
(89, 2, NULL, 'eladó', '2003-07-07 00:00:00', 400, 6, 0),
(90, 9, NULL, 'kisegítő', '2003-06-19 00:00:00', 300, 4, 0),
(91, 9, 6, 'takarító', '2003-06-19 00:00:00', 400, 4, 0),
(92, 9, 6, 'takarító', '2003-06-20 00:00:00', 400, 4, 0),
(93, 9, 8, 'kisegítő', '2003-06-21 00:00:00', 300, 6, 1),
(94, 9, 8, 'kisegítő', '2003-06-22 00:00:00', 300, 6, 1),
(95, 9, 6, 'takarító', '2003-06-23 00:00:00', 400, 4, 0),
(96, 6, 4, 'ruhatáros', '2003-09-11 00:00:00', 400, 4, 0),
(97, 6, 7, 'ruhatáros', '2003-09-11 00:00:00', 400, 4, 0),
(98, 6, 5, 'pincér', '2003-06-11 00:00:00', 450, 6, 0),
(99, 6, 5, 'pincér', '2003-06-12 00:00:00', 450, 6, 0),
(100, 8, 9, 'eladó', '2003-07-21 00:00:00', 500, 4, 0),
(101, 8, 9, 'eladó', '2003-07-22 00:00:00', 500, 4, 0),
(102, 8, 10, 'takarító', '2003-08-10 00:00:00', 350, 6, 1),
(103, 8, 10, 'takarító', '2003-08-11 00:00:00', 350, 6, 1),
(104, 11, 5, 'eladó', '2003-05-10 00:00:00', 400, 4, 0),
(105, 11, 6, 'raktáros', '2003-05-20 00:00:00', 300, 4, 0),
(106, 11, 5, 'eladó', '2003-06-23 00:00:00', 300, 6, 0),
(107, 10, NULL, 'takarító', '2003-07-29 00:00:00', 250, 4, 1),
(108, 10, NULL, 'takarító', '2003-07-30 00:00:00', 250, 4, 1),
(109, 10, 3, 'takarító', '2003-07-31 00:00:00', 300, 4, 1),
(110, 10, 3, 'takarító', '2003-08-01 00:00:00', 300, 4, 1),
(111, 10, 8, 'eladó', '2003-09-12 00:00:00', 300, 6, 1),
(112, 10, 8, 'eladó', '2003-09-13 00:00:00', 300, 6, 1),
(113, 7, 8, 'ruhatáros', '2003-08-20 00:00:00', 200, 4, 1),
(114, 7, 8, 'ruhatáros', '2003-08-21 00:00:00', 200, 4, 1),
(115, 7, NULL, 'ruhatáros', '2003-08-22 00:00:00', 200, 4, 1),
(116, 7, NULL, 'ruhatáros', '2003-08-23 00:00:00', 200, 4, 1),
(117, 4, NULL, 'raktáros', '2003-10-10 00:00:00', 300, 6, 0),
(118, 4, NULL, 'raktáros', '2003-10-11 00:00:00', 300, 6, 0),
(119, 4, NULL, 'raktáros', '2003-10-12 00:00:00', 300, 6, 0),
(120, 5, 7, 'eladó', '2003-06-05 00:00:00', 400, 4, 0),
(121, 5, 7, 'eladó', '2003-06-06 00:00:00', 400, 4, 0),
(122, 5, 7, 'eladó', '2003-06-07 00:00:00', 400, 4, 0),
(123, 11, NULL, 'eladó', '2003-07-07 00:00:00', 400, 6, 0);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;