-- Création de la base de données
CREATE DATABASE Florian_Dubois-Nehemie_Mubenga_Maweja;

-- Utilisation de la base de données
USE Florian_Dubois-Nehemie_Mubenga_Maweja;

-- Table Utilisateurs
CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(50) NOT NULL,
    date_inscription DATETIME DEFAULT CURRENT_TIMESTAMP,
    credit_temps FLOAT DEFAULT 10.0
);

-- Table Services
CREATE TABLE Services (
    id_service INT PRIMARY KEY AUTO_INCREMENT,
    type_service VARCHAR(100) NOT NULL,
    description_service TEXT,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

-- Table Crédit Temps
CREATE TABLE Credit_Temps (
    id_credit INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur INT NOT NULL,
    heures_disponibles FLOAT DEFAULT 10.0,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

-- Table Transactions
CREATE TABLE Transactions (
    id_transaction INT PRIMARY KEY AUTO_INCREMENT,
    id_service INT NOT NULL,
    id_utilisateur INT NOT NULL,
    heures_echangees FLOAT NOT NULL,
    date_transaction DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_service) REFERENCES Services(id_service),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

-- Tables Optionnelles --

-- Table Commentaires (permet de faire des commentaires sur les services)
CREATE TABLE Commentaires (
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    id_service INT NOT NULL,
    id_utilisateur INT NOT NULL,
    texte_commentaire TEXT NOT NULL,
    date_commentaire DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_service) REFERENCES Services(id_service),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);


-- Table Evaluations (permet de donner une évaluation sur les services)
CREATE TABLE Evaluations (
    id_evaluation INT PRIMARY KEY AUTO_INCREMENT,
    id_service INT NOT NULL,
    id_utilisateur INT NOT NULL,
    note TINYINT NOT NULL CHECK (note BETWEEN 1 AND 5),
    commentaire TEXT,
    date_evaluation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_service) REFERENCES Services(id_service),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

-- Table Messages (permet d'envoyer des messages entre utilisateurs)
CREATE TABLE Messages (
    id_message INT PRIMARY KEY AUTO_INCREMENT,
    id_expediteur INT NOT NULL,
    id_destinataire INT NOT NULL,
    contenu TEXT NOT NULL,
    date_envoi DATETIME DEFAULT CURRENT_TIMESTAMP,
    lu BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_expediteur) REFERENCES Utilisateurs(id_utilisateur),
    FOREIGN KEY (id_destinataire) REFERENCES Utilisateurs(id_utilisateur)
);

