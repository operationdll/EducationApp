DROP TABLE IF EXISTS `areas`;

CREATE TABLE IF NOT EXISTS `areas` (
   ID int NOT NULL AUTO_INCREMENT Primary key,
   `name` VARCHAR(50) NOT NULL
) character set = utf8;

INSERT INTO areas(name) VALUES('金牛区');

DROP TABLE IF EXISTS `schools`;

CREATE TABLE IF NOT EXISTS `schools` (
   ID int NOT NULL AUTO_INCREMENT Primary key,
   `name` VARCHAR(50) NOT NULL,
   aid int not null,
   FOREIGN KEY (aid) REFERENCES areas(ID)
)character set = utf8;

DROP TABLE IF EXISTS `streets`;

CREATE TABLE IF NOT EXISTS `streets` (
   ID int NOT NULL AUTO_INCREMENT Primary key,
   `name` VARCHAR(50) NOT NULL,
   sid int not null,
   FOREIGN KEY (sid) REFERENCES schools(ID)
)character set = utf8;
