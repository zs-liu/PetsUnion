CREATE DATABASE petsunion;
USE petsunion;
CREATE TABLE shops (
    id int(11) AUTO_INCREMENT PRIMARY KEY,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL
);