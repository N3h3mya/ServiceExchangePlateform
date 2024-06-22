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

CREATE TABLE Services(
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    type_service varchar(100) NOT NULL,
    description_service TEXT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE time_credit( 
    credit_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    heures_disponibles FLOAT DEFAULT 10,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Transactions( 
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    service_id INT NOT NULL,
    user_id INT NOT NULL,
    heures_echangees FLOAT NOT NULL,
    date_transaction DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
