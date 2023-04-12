DROP DATABASE IF EXISTS livraison;
create database livraison;

use livraison;

CREATE TABLE client (
  cli_num INT PRIMARY KEY,
  cli_nom VARCHAR(50),
  cli_adresse VARCHAR(100),
  cli_tel VARCHAR(20)
);

CREATE TABLE commande (
  com_num INT,
  cli_num INT,
  com_date DATE,
  com_obs TEXT,
  PRIMARY KEY (com_num),
  FOREIGN KEY (cli_num) REFERENCES client(cli_num)
);


CREATE TABLE produit (
  pro_num INT PRIMARY KEY,
  pro_libelle VARCHAR(50),
  pro_description TEXT
);

CREATE TABLE detail (
  com_num INT,
  pro_num INT,
  qte_cde INT,
  PRIMARY KEY (com_num, pro_num),
  FOREIGN KEY (com_num) REFERENCES commande(com_num),
  FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
);


-- CREATE USER 'util1'@'%' IDENTIFIED BY 'uti';
-- CREATE USER 'util2'@'%' IDENTIFIED BY 'uti';
-- CREATE USER 'util3'@'%' IDENTIFIED BY 'uti';

-- GRANT ALL PRIVILEGES 
-- ON hotel.* 
-- TO 'util1'@'%';
-- FLUSH PRIVILEGES; 

-- GRANT SELECT
-- ON hotel.* 
-- TO 'util2'@'%'; 
-- FLUSH PRIVILEGES; 

-- GRANT SELECT 
-- ON hotel.station
-- TO 'util3'@'%';
-- FLUSH PRIVILEGES;