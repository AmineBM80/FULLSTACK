-- Base de données : `the_district`
--
DROP DATABASE IF EXISTS `the_district`;
create database `the_district`;

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int AUTO_INCREMENT PRIMARY KEY ,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` varchar(10) NOT NULL
) ;


INSERT INTO categorie (id, libelle, image, active) VALUES 
(4, 'Pizza', 'pizza_cat.jpg', 'Yes'),
(5, 'Burger', 'burger_cat.jpg', 'Yes'),
(9, 'Wraps', 'wrap_cat.jpg', 'Yes'),
(10, 'Pasta', 'pasta_cat.jpg', 'Yes'),
(11, 'Sandwich', 'sandwich_cat.jpg', 'Yes'),
(12, 'Asian Food', 'asian_food_cat.jpg', 'No'),
(13, 'Salade', 'salade_cat.jpg', 'Yes'),
(14, 'Veggie', 'veggie_cat.jpg', 'Yes');


--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `libelle` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_categorie` int NOT NULL REFERENCES categorie(id),
  `active` varchar(10) NOT NULL
) ;

INSERT INTO plat (id, libelle, description, prix, image, id_categorie, active) VALUES 
(4, 'District Burger', 'Burger composé d’un bun’s du boulanger, deux steak...', 8.00, 'hamburger.jpg', 5, 'Yes'),
(5, 'Pizza Bianca', 'Une pizza fine et croustillante garnie de crème ma...', 14.00, 'pizza-salmon.png', 4, 'Yes'),
(9, 'Buffalo Chicken Wrap', 'Du bon filet de poulet mariné dans notre spécialit...', 5.00, 'buffalo-chicken.webp', 9, 'Yes'),
(10, 'Cheeseburger', 'Burger composé d’un bun’s du boulanger, de salade,...', 8.00, 'cheesburger.jpg', 5, 'Yes'),
(12, 'Spaghetti aux légumes', 'Un plat de spaghetti au pesto de basilic et légume...', 10.00, 'spaghetti-legumes.jpg', 10, 'Yes'),
(13, 'Salade César', 'Une délicieuse salade Caesar (César) composée de f...', 7.00, 'cesar_salad.jpg', 13, 'Yes'),
(14, 'Pizza Margherita', 'Une authentique pizza margarita, un classique de l...', 14.00, 'pizza-margherita.jpg', 4, 'Yes'),
(15, 'Courgettes farcies au quinoa et duxelles de champi...', 'Voici une recette équilibrée à base de courgettes,...', 8.00, 'courgettes_farcies.jpg', 14, 'Yes'),
(16, 'Lasagnes', "Découvrez notre recette des lasagnes, l'une des sp...", 12.00, 'lasagnes_viande.jpg', 10, 'Yes'),
(17, 'Tagliatelles au saumon', 'Découvrez notre recette délicieuse de tagliatelles...', 12.00, 'tagliatelles_saumon.webp', 10, 'Yes');


--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
                            `id` int AUTO_INCREMENT PRIMARY KEY,
                            `id_plat` int NOT NULL REFERENCES plat(id),
                            `quantite` int NOT NULL,
                            `total` decimal(10,2) NOT NULL,
                            `date_commande` datetime NOT NULL,
                            `etat` varchar(50) NOT NULL,
                            `nom_client` varchar(150) NOT NULL,
                            `telephone_client` varchar(20) NOT NULL,
                            `email_client` varchar(150) NOT NULL,
                            `adresse_client` varchar(255) NOT NULL
) ;

INSERT INTO commande (id_plat, quantite, total, date_commande, etat, nom_client, telephone_client, email_client, adresse_client) VALUES 
(4, 4, 16.00, '2020-11-30 03:52:43', 'Livrée', 'Kelly Dillard', '7896547800', 'kelly@gmail.com', '308 Post Avenue'),
(5, 2, 20.00, '2020-11-30 04:07:17', 'Livrée', 'Thomas Gilchrist', '7410001450', 'thom@gmail.com', '1277 Sunburst Drive'),
(5, 1, 10.00, '2021-05-04 01:35:34', 'Livrée', 'Martha Woods', '78540001200', 'marthagmail.com', '478 Avenue Street'),
(9, 1, 7.00, '2021-07-20 06:10:37', 'Livrée', 'Charlie', '7458965550', 'charlie@gmail.com', '3140 Bartlett Avenue'),
(10, 2, 8.00, '2021-07-20 06:40:21', 'En cours de livraison', 'Claudia Hedley', '7451114400', 'hedley@gmail.com', '1119 Kinney Street'),
(14, 1, 6.00, '2021-07-20 06:40:57', 'En préparation', 'Vernon Vargas', '7414744440', 'venno@gmail.com', '1234 Hazelwood Avenue'),
(9, 4, 20.00, '2021-07-20 07:06:06', 'Annulée', 'Carlos Grayson', '7401456980', 'carlos@gmail.com', '2969 Hartland Avenue'),
(16, 4, 12.00, '2021-07-20 07:11:06', 'Livrée', 'Jonathan Caudill', '7410256996', 'jonathan@gmail.com', '1959 Limer Street');


--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int AUTO_INCREMENT PRIMARY KEY,
  `nom_prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ;


