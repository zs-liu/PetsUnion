CREATE DATABASE `petsunion` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE petsunion;
CREATE TABLE IF NOT EXISTS shops (
    id int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
    address varchar(40),
    picture varchar(40)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS pets (
    id int(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) NOT NULL
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS owners (
    id int(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
)

CREATE TABLE IF NOT EXISTS services (
    id bigint(21) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    shop int(11) NOT NULL,
    pet int(5) NOT NULL,
    name varchar(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
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
    id bigint(21) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    service bigint(21) UNSIGNED NOT NULL,
    owner int(11) UNSIGNED NOT NULL,
    order_time DATETIME NOT NULL,
    CONSTRAINT service_id
    FOREIGN KEY (service)
    REFERENCES services (id),
    CONSTRAINT owner_id
    FOREIGN KEY (owner)
    REFERENCES owners (id),
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;