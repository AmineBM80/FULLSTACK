-- Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix ) :

SELECT commande.date_commande, commande.nom_client, commande.telephone_client, commande.email_client, commande.adresse_client, plat.nom_plat, commande.total
FROM commande
JOIN plat ON commande.id_plat = plat.id
ORDER BY commande.date_commande DESC;

-- ----------- --

-- Afficher la liste des plats en spécifiant la catégorie :

SELECT plat.nom_plat, categorie.nom_categorie
FROM plat
JOIN categorie ON plat.id_categorie = categorie.id;

-- ----------- --

--Afficher les catégories et le nombre de plats actifs dans chaque catégorie :

SELECT categorie.nom_categorie, COUNT(plat.id)
FROM categorie
JOIN plat ON plat.id_categorie = categorie.id
WHERE plat.actif = 1
GROUP BY categorie.nom_categorie;

-- ----------- --

--Liste des plats les plus vendus par ordre décroissant :

SELECT plat.nom_plat, SUM(commande.quantite) as quantite_totale
FROM plat
JOIN commande ON commande.id_plat = plat.id
GROUP BY plat.id
ORDER BY quantite_totale DESC;


-- ----------- --

-- Le plat le plus rémunérateur :


SELECT plat.nom_plat, MAX(commande.total) as total_max
FROM plat
JOIN commande ON commande.id_plat = plat.id
GROUP BY plat.id
ORDER BY total_max DESC
LIMIT 1;

-- ----------- --

-- Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant) :


SELECT commande.nom_client, SUM(commande.total) as chiffre_affaire
FROM commande
GROUP BY commande.nom_client
ORDER BY chiffre_affaire DESC;


-- -------------------------------------------------------------------------------------------------- --
-- -------------------------------------------------------------------------------------------------- --
-- -----------------------------------MODIFICATION BDD----------------------------------------------- --
-- -------------------------------------------------------------------------------------------------- --
-- -------------------------------------------------------------------------------------------------- --


-- Supprimer les plats non actifs de la base de données :

DELETE FROM plat WHERE active = 'non';

-- ----------- --

-- Supprimer les commandes avec le statut livré :

DELETE FROM commande WHERE etat = 'Livrée';

-- ----------- --

-- Ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie :

INSERT INTO categorie (libelle) VALUES ('Nouvelle Catégorie');
INSERT INTO plat (libelle, description, prix, id_categorie, active) VALUES ('Nouveau Plat', 'Description du nouveau plat', 10.99, (SELECT id FROM categorie WHERE libelle = 'Nouvelle Catégorie'), 'yes');

-- ----------- --

-- Augmenter de 10% le prix des plats de la catégorie 'Pizza' :

UPDATE plat SET prix = prix * 1.1 WHERE id_categorie = (SELECT id FROM categorie WHERE nom = 'Pizza');
