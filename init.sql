CREATE DATABASE IF NOT EXISTS `petsunion` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE petsunion;

DROP TABLE IF EXISTS shops;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS shops (
    id int(11) UNSIGNED AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
    address varchar(40),
    picture varchar(40),
    PRIMARY KEY (id),
    UNIQUE KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS pets (
    id int(5) UNSIGNED AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS owners (
    id int(11) UNSIGNED AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS services (
    id bigint(21) UNSIGNED AUTO_INCREMENT,
    shop int(11) UNSIGNED,
    pet int(5) UNSIGNED,
    name varchar(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (id),
    CONSTRAINT belong_shop
    FOREIGN KEY (shop)
    REFERENCES shops (id),
    CONSTRAINT serve_pet
    FOREIGN KEY (pet)
    REFERENCES pets (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS orders (
    id bigint(21) UNSIGNED AUTO_INCREMENT,
    service bigint(21) UNSIGNED NOT NULL,
    owner int(11) UNSIGNED NOT NULL,
    order_time DATETIME NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (id),
    CONSTRAINT service_id
    FOREIGN KEY (service)
    REFERENCES services (id),
    CONSTRAINT owner_id
    FOREIGN KEY (owner)
    REFERENCES owners (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;