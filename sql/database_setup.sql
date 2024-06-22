CREATE DATABASE Floriant_Dubois-Nehemie_Mubenga_Maweja;
USE Floriant_Dubois-Nehemie_Mubenga_Maweja;

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    nom varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    mot_de_passe varchar(50) NOT NULL,
    date_inscription DATETIME DEFAULT CURRENT_TIMESTAMP,
    credit_temps FLOAT DEFAULT 10

);

