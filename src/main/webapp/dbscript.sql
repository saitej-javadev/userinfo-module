create database  demo;
use demo;



CREATE TABLE users (
                       id int NOT NULL AUTO_INCREMENT,
                       name varchar(120) NOT NULL,
                       email varchar(220) NOT NULL,
                       password varchar(30) NOT NULL,
                       role varchar(30) DEFAULT NULL,
                       status varchar(30) DEFAULT NULL,
                       created_date varchar(225) DEFAULT NULL,
                       updated_date varchar(255) DEFAULT NULL,
                       PRIMARY KEY (id)
)



INSERT INTO demo.users(name,email,password,role,status)
VALUES('bob','bob@yahoo.com','bob','administrator','Active');
