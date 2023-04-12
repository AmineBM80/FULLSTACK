CREATE DATABASE IF NOT EXISTS jarditou;

USE jarditou;

CREATE TABLE IF NOT EXISTS client (
    CliID INT PRIMARY KEY,
    Type BIT(1),
    Nom VARCHAR(255),
    Prénom VARCHAR(255),
    Adresse VARCHAR(255),
    CP VARCHAR(10),
    Ville VARCHAR(255),
    Tel VARCHAR(20),
    Mail VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS rubrique (
    RubID INT PRIMARY KEY,
    Libelle VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS fournisseur (
    FouID INT PRIMARY KEY,
    Nom VARCHAR(255),
    Adresse VARCHAR(255),
    CP VARCHAR(10),
    Ville VARCHAR(255),
    Tel VARCHAR(20),
    Mail VARCHAR(255),
    Type BIT(1)
);

CREATE TABLE IF NOT EXISTS commande (
    ComID INT PRIMARY KEY,
    DateCommande DATE,
    DateLivraison DATE,
    EtatCommande VARCHAR(50),
    EditionFacture BIT(1),
    Client INT,
    FOREIGN KEY (Client) REFERENCES client(CliID)
);

CREATE TABLE IF NOT EXISTS produit (
    ProCode VARCHAR(50) PRIMARY KEY,
    Libelle VARCHAR(255),
    Description TEXT,
    Photo VARCHAR(255),
    Affichage BIT(1),
    PrixAchat DECIMAL(10,2),
    StockPhysique INT,
    StockAlerte INT,
    fournisseur INT,
    rubrique INT,
    FOREIGN KEY (fournisseur) REFERENCES fournisseur(FouID),
    FOREIGN KEY (rubrique) REFERENCES rubrique(RubID)
);

CREATE TABLE IF NOT EXISTS panier (
    compQuatiteProduit INT,
    compPrixVentePar DECIMAL(10,2),
    compPrixVentePro DECIMAL(10,2),
    produit VARCHAR(50),
    commande INT,
    FOREIGN KEY (commande) REFERENCES commande(ComID),
    FOREIGN KEY (produit) REFERENCES produit(ProCode)
);


INSERT INTO `client` (`CliID`,`Nom`,`Prénom`,`Adresse`,`CP`,`Ville`,`Tel`, `Mail`)
VALUES
(1,"MONKEY.D","Luffy", "SunnyGo", 80000, "Fushia", "56-56-56-56-56", "monkeyd.luffy@onepiece.com"),
(2,"RORONOA","Zorro", "EastBlue", 11000, "Shimotsuki", "11-11-11-11-11", "roronoa.zoro@onepiece.com"),
(3,"ORANGE","Nami", "ArlongPark", 36000, "Kokoyashi", "36-60-00-00-00", "nami@onepiece.com"),
(4,"GOD","Usopp", "VogueMerry", 20000, "Sirop", "50-00-00-00-00", "sogeking@onepiece.com"),
(5,"VINSMOKE","Sanji", "NorthBlue", 10320, "Germa66", "10-32-00-00-00", "vinsmoke.sanji@onepiece.com"),
(6,"TONY TONY","Chopper", "Grandline", 01000, "Drum", "00-00-00-10-00", "tonytony.chopper@onepiece.com"),
(7,"NICO","Robin", "CalmBelt", 79000, "Ohara", "79-00-00-00-00", "nico.robin@onepiece.com"),
(8,"CUTTY","Flam", "FrankyFamily", 44000, "Water Seven", "44-00-00-00-00", "franky@onepiece.com"),
(9,"SOUL KING", "Brook", "Rumbar", 38300, "Thriller Bark", "38-30-00-00-00", "soulking@onepiece.com"),
(10,"NEFERTARI","Vivi", "Baroque Works", 02000, "Alabasta", "02-02-00-00-00", "nefertari.vivi@onepiece.com")

INSERT INTO fournisseur (FouID, Nom, Adresse, CP, Ville, Tel, Mail, Type) 
VALUES
(1, 'Kaido', '5 Rue du Commerce', '75001', 'Paris', '01 23 45 67 89', 'kaido@onepiece.com', 1),
(2, 'Charlotte Linlin', '10 Avenue des Champs-Élysées', '75008', 'Paris', '01 23 45 67 90', 'charlotte.linlin@onepiece.com', 0),
(3, 'Edward Newgate', '23 Rue de la République', '13002', 'Marseille', '04 91 23 45 67', 'edward.newgate@onepiece.com', 1),
(4, 'Masharll.D. Teach', '8 Rue de la Paix', '69002', 'Lyon', '04 78 12 34 56', 'marshalld.teach@onepiece.com', 0),
(5, 'Akagami no Shanks', '16 Rue de la Liberté', '59000', 'Lille', '03 20 12 34 56', 'figarland.shanks@onepiece.com', 1);

INSERT INTO produit (ProCode, Libelle, Description, Photo, Affichage, PrixAchat, StockPhysique, StockAlerte, fournisseur, rubrique) 
VALUES
('FDD1', 'Fruit du démon Gomu Gomu', "Fruit qui permet à son utilisateur d'étirer son corps comme du caoutchouc", 'gomu-gomu-fruit.jpg', 1, 100, 50, 10, 1, 1),
('FDD2', 'Fruit du démon Mera Mera', 'Fruit qui permet à son utilisateur de créer et de contrôler le feu', 'mera-mera-fruit.jpg', 1, 200, 30, 5, 2, 1),
('FDD3', 'Fruit du démon Hie Hie', 'Fruit qui permet à son utilisateur de créer et de contrôler la glace', 'hie-hie-fruit.jpg', 1, 300, 20, 5, 3, 1),
('FDD4', 'Fruit du démon Gura Gura', 'Fruit qui permet à son utilisateur de créer des tremblements de terre', 'gura-gura-fruit.jpg', 1, 400, 10, 2, 4, 1),
('FDD5', 'Fruit du démon Ope Ope', 'Fruit qui permet à son utilisateur de manipuler les personnes et les objets à sa guise', 'ope-ope-fruit.jpg', 1, 500, 5, 1, 5, 1),
('FDD6', 'Fruit du démon Bara Bara', 'Fruit qui permet à son utilisateur de se diviser en plusieurs parties', 'bara-bara-fruit.jpg', 1, 100, 50, 10, 1, 1),
('FDD7', 'Fruit du démon Goro Goro', 'Fruit qui permet à son utilisateur de créer et de contrôler la foudre', 'goro-goro-fruit.jpg', 1, 200, 30, 5, 2, 1),
('FDD8', 'Fruit du démon Yami Yami', "Fruit qui permet à son utilisateur d'absorber toute chose dans les ténèbres", 'yami-yami-fruit.jpg', 1, 300, 20, 5, 3, 1),
('FDD9', 'Fruit du démon Giro Giro', 'Fruit qui permet à son utilisateur de lire les pensées des autres', 'giro-giro-fruit.jpg', 1, 400, 10, 2, 4, 1),
('FDD10', 'Fruit du démon Horo Horo', 'Fruit qui permet à son utilisateur de faire apparaître des fantômes', 'horo-horo-fruit.jpg', 1, 500, 5, 1, 5, 1);

-- Insertion des sabres
INSERT INTO Produit (ProCode, Libelle, Description, Photo, Affichage, PrixAchat, StockPhysique, StockAlerte, fournisseur, rubrique) 
VALUES 
("SAB001", "Kitetsu", "Un sabre maudit qui porte malheur à son propriétaire", "kitetsu.jpg", 1, 300, 50, 10, "F001", "R002"),
("SAB002", "Yubashiri", "Un sabre en acier trempé très résistant", "yubashiri.jpg", 1, 500, 60, 15, "F001", "R002"),
("SAB003", "Shusui", "Un des 21 grands sabres de grade Meito, capable de fendre l'acier", "shusui.jpg", 1, 1000, 80, 20, "F001", "R002"),
("SAB004", "Sandai Kitetsu", "Un autre sabre maudit de la famille Kitetsu", "sandai_kitetsu.jpg", 1, 200, 40, 5, "F001", "R002"),
("SAB005", "Nidai Kitetsu", "Le deuxième sabre maudit de la famille Kitetsu", "nidai_kitetsu.jpg", 1, 250, 45, 5, "F001", "R002"),
("SAB006", "Wado Ichimonji", "Le sabre de famille du dojo Shimotsuki, capable de trancher l'acier", "wado_ichimonji.jpg", 1, 800, 70, 15, "F001", "R002"),
("SAB007", "Yoru", "Le sabre noir d'un des 4 empereurs, capable de couper n'importe quoi", "yoru.jpg", 1, 1500, 90, 30, "F002", "R002"),
("SAB008", "Shodai Kitetsu", "Le premier sabre maudit de la famille Kitetsu, très rare", "shodai_kitetsu.jpg", 1, 5000, 100, 50, "F002", "R002"),
("SAB009", "Enma", "Le sabre du Dieu des Enfers, capable de trancher la vie même", "enma.jpg", 1, 2000, 80, 25, "F003", "R002"),
("SAB010", "Kikoku", "Le sabre de la justice absolue, autrefois utilisé par un amiral de la Marine", "kikoku.jpg", 1, 2500, 90, 30, "F003", "R002");


-- Insertion de données dans la table Commande
INSERT INTO commande (ComID, DateCommande, DateLivraison, EtatCommande, EditionFacture, Client) 
VALUES 
  (1, '2022-05-10', '2022-05-20', 'En cours de traitement', 0, 1),
  (2, '2022-06-01', '2022-06-10', 'En cours de traitement', 0, 2),
  (3, '2022-06-15', '2022-06-20', 'En cours de traitement', 0, 3),
  (4, '2022-07-01', '2022-07-10', 'En cours de traitement', 0, 4),
  (5, '2022-07-15', '2022-07-20', 'En cours de traitement', 0, 5);

-- Insertion de données dans la table Panier
INSERT INTO panier (compQuantiteProduit, compPrixVentePar, compPrixVentePro, produit, commande) 
VALUES 
  (1, 10.99, 9.99, 'FDD1', 1),
  (2, 7.99, 6.99, 'FDD2', 1),
  (3, 5.99, 4.99, 'FDD3', 2),
  (4, 12.99, 11.99, 'FDD4', 2),
  (1, 19.99, 18.99, 'FDD5', 3),
  (2, 14.99, 13.99, 'FDD6', 3),
  (3, 8.99, 7.99, 'FDD7', 4),
  (4, 11.99, 10.99, 'FDD8', 4),
  (1, 9.99, 8.99, 'FDD9', 5),
  (2, 6.99, 5.99, 'FDD10', 5),
  (1, 99.99, 89.99, 'SAB001', 1),
  (2, 89.99, 79.99, 'SAB002', 1),
  (3, 109.99, 99.99, 'SAB003', 2),
  (4, 159.99, 139.99, 'SAB004', 2),
  (1, 69.99, 59.99, 'SAB005', 3),
  (2, 129.99, 119.99, 'SAB006', 3),
  (3, 179.99, 159.99, 'SAB007', 4),
  (4, 219.99, 199.99, 'SAB008', 4),
  (1, 99.99, 89.99, 'SAB009', 5),
  (2, 149.99, 129.99, 'SAB010', 5);


CREATE USER 'gestionnaire'@'%' IDENTIFIED BY 'gestion';
CREATE USER 'approvisionneur'@'%' IDENTIFIED BY 'appro';
CREATE USER 'administrateur'@'%' IDENTIFIED BY 'admin';

GRANT SELECT
ON jarditou.produit
TO 'gestionnaire'@'%'; 
FLUSH PRIVILEGES;

GRANT SELECT
ON jarditou.commande
TO 'gestionnaire'@'%'; 
FLUSH PRIVILEGES;

GRANT SELECT
ON jarditou.client
TO 'gestionnaire'@'%'; 
FLUSH PRIVILEGES;

GRANT SELECT
ON jarditou.panier
TO 'gestionnaire'@'%'; 
FLUSH PRIVILEGES;

GRANT SELECT, INSERT
ON jarditou.produit
TO 'approvisionneur'@'%';
FLUSH PRIVILEGES;

GRANT SELECT
ON jarditou.fournisseur
TO 'approvisionneur'@'%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES
ON jarditou.*
TO 'administrateur'@'%';
FLUSH PRIVILEGES;