create database hw_2606;
use hw_2606;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) NOT NULL
);

INSERT INTO users (id, firstname, lastname, age, gender)
VALUES (1, 'Анатолий', 'Ушанов', 28, 'm'),
       (2, 'Светлана', 'Демидова', 25, 'f'),
       (3, 'Никита', 'Иванов', 33, 'm'),
       (4, 'Ольга', 'Петрова', 22, 'f');


CREATE TABLE workers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    position VARCHAR(128) NOT NULL,
    salary INT DEFAULT 0
);

INSERT INTO workers (id, firstname, lastname, position, salary)
VALUES (1, 'Петр', 'Сергеев', 'CEO', 7000),
       (2, 'Виктор', 'Семенов', 'Web-developer', 5000),
       (3, 'Никита', 'Петров', 'Assistant', 3500),
       (4, 'Инна', 'Орлова', 'Accountant', 4500);


CREATE TABLE fruits (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10 , 2) DEFAULT 0,
    count INT DEFAULT 0
);

INSERT INTO fruits (id, title, price, count)
VALUES (1, 'Apple', 280.00, 4),
       (2, 'Lemon', 300.00, 8),
       (3, 'Lime', 500.00, 3),
       (4, 'Orange', 200.00, 8);


CREATE TABLE vegetables (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    price DECIMAL(10 , 2) DEFAULT 0,
    count INT DEFAULT 0,
    country VARCHAR(255) NOT NULL
);

INSERT INTO vegetables (id, title, price, count, country)
VALUES (1, 'Potato', 370.00, 5, 'Germany'),
       (2, 'Onion', 320.00, 3, 'Poland'),
       (3, 'Tomato', 210.00, 9, 'Spain'),
       (4, 'Carrot', 280.00, 4, 'France');
