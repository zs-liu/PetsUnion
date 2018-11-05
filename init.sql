DROP DATABASE IF EXISTS `petsunion`;
CREATE DATABASE IF NOT EXISTS `petsunion` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE petsunion;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS shops;
DROP TABLE IF EXISTS pet_categories;
DROP TABLE IF EXISTS service_categories;

CREATE TABLE IF NOT EXISTS shops (
    id int(11) UNSIGNED AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
    address varchar(40),
    picture varchar(40),
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS pet_categories (
    id int(5) UNSIGNED AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS service_categories (
    id int(5) UNSIGNED AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS owners (
    id int(11) UNSIGNED AUTO_INCREMENT,
    name varchar(40) NOT NULL,
    password char(32) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS services (
    id bigint(21) UNSIGNED AUTO_INCREMENT,
    shop int(11) UNSIGNED,
    pet_category int(5) UNSIGNED,
    service_category int(5) UNSIGNED,
    start_time int(2) NOT NULL,
    end_time int(2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT shop_id FOREIGN KEY (shop) REFERENCES shops (id),
    CONSTRAINT pet_which_services FOREIGN KEY (pet_category) REFERENCES pet_categories (id),
    CONSTRAINT serve_which_services FOREIGN KEY (service_category) REFERENCES service_categories (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS pets (
    id int(11) UNSIGNED AUTO_INCREMENT,
    pet_category int(5) UNSIGNED NOT NULL,
    name varchar(10),
    owner int(11) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT owner_id_pets FOREIGN KEY (owner) REFERENCES owners (id),
    CONSTRAINT pet_which_pets FOREIGN KEY (pet_category) REFERENCES pet_categories (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS orders (
    id bigint(21) UNSIGNED AUTO_INCREMENT,
    service bigint(21) UNSIGNED NOT NULL,
    pet int(11) UNSIGNED NOT NULL,
    order_time DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT service_id_orders FOREIGN KEY (service) REFERENCES services (id),
    CONSTRAINT owner_id_orders FOREIGN KEY (pet) REFERENCES pets (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8;