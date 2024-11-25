-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 nov. 2024 à 10:51
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `street_address` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `postal_code` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `street_address`, `city`, `postal_code`) VALUES
(1, 5, 'Curry Skyway', 'West Jasontown', '46927'),
(2, 5, 'Bradley Ports', 'West Diane', '82610'),
(3, 10, 'Jimmy Port', 'Ashleestad', '41507'),
(4, 1, 'Kathryn River', 'East Catherinestad', '02696'),
(5, 5, 'Terri Manors', 'Scottbury', '95865'),
(6, 6, 'Davis Summit', 'Greenborough', '04536'),
(7, 3, 'Smith Forest', 'Virginiafort', '68055'),
(8, 1, 'Schmidt Wall', 'Nicoleborough', '83397'),
(9, 4, 'Holmes Street', 'Brucechester', '62475'),
(10, 2, 'Stephanie Orchard', 'New Michael', '51164');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `command_id` int(11) DEFAULT NULL,
  `cart_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `command_id`, `cart_product_id`) VALUES
(1, 9, 2, 15),
(2, 4, 6, 12),
(3, 2, 3, 9),
(4, 6, 10, 17),
(5, 1, 3, 3),
(6, 1, 4, 10),
(7, 8, 9, 20),
(8, 5, 5, 5),
(9, 10, 3, 4),
(10, 4, 9, 15),
(11, 1, 9, 1),
(12, 6, 8, 15),
(13, 5, 9, 17),
(14, 7, 7, 10),
(15, 2, 4, 6),
(16, 8, 1, 16),
(17, 10, 6, 10),
(18, 7, 10, 13),
(19, 5, 10, 1),
(20, 1, 7, 17);

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

CREATE TABLE `command` (
  `command_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`command_id`, `user_id`, `product_id`, `quantity`) VALUES
(1, 10, 6, 2),
(2, 3, 8, 14),
(3, 5, 1, 7),
(4, 3, 5, 2),
(5, 10, 7, 10),
(6, 9, 1, 12),
(7, 1, 6, 9),
(8, 1, 5, 15),
(9, 5, 9, 15),
(10, 1, 10, 12);

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `user_id`, `product_id`, `order_date`) VALUES
(1, 10, 1, '2020-04-08 15:09:18'),
(2, 10, 1, '2022-12-10 08:45:35'),
(3, 1, 7, '2024-07-16 01:32:00'),
(4, 4, 1, '2023-12-17 03:10:00'),
(5, 10, 7, '2023-04-24 22:15:43'),
(6, 9, 10, '2024-04-07 00:30:08'),
(7, 8, 7, '2020-06-26 19:03:04'),
(8, 4, 1, '2021-06-15 04:55:32'),
(9, 4, 2, '2022-05-08 16:58:47'),
(10, 3, 1, '2020-11-11 18:24:28');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `price`, `stock_available`) VALUES
(1, 'heart', 'Year occur make environmental white.', 808.00, 356),
(2, 'arrive', 'I total sign quickly.', 279.00, 302),
(3, 'wait', 'Manager nothing sign team fight behind happen.', 486.00, 6),
(4, 'decision', 'Cell easy know land during crime.', 418.00, 88),
(5, 'kind', 'Leader pull speech public avoid style.', 94.00, 58),
(6, 'particular', 'Fine old why various health court you.', 969.00, 214),
(7, 'friend', 'None red ten hear.', 952.00, 11),
(8, 'play', 'Include financial mention.', 964.00, 485),
(9, 'test', 'Few animal section here attack social nice field.', 996.00, 302),
(10, 'in', 'Mind husband market century girl same both.', 803.00, 179);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` text DEFAULT NULL,
  `lastname` text DEFAULT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `username`) VALUES
(1, 'Paul', 'Mitchell', 'james54'),
(2, 'Paul', 'Johnson', 'kholt'),
(3, 'Katie', 'Kelly', 'rasmussentyler'),
(4, 'Dennis', 'Brown', 'alanrodriguez'),
(5, 'James', 'Thomas', 'hayesjessica'),
(6, 'Chelsea', 'Dunn', 'julian38'),
(7, 'Jessica', 'Green', 'tonyamullen'),
(8, 'David', 'Shaw', 'williamhebert'),
(9, 'Ruth', 'Taylor', 'romeronancy'),
(10, 'Katrina', 'Clark', 'colemankim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `command_id` (`command_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cart_product_id` (`cart_product_id`);

--
-- Index pour la table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`command_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `command`
--
ALTER TABLE `command`
  MODIFY `command_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`command_id`) REFERENCES `command` (`command_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`cart_product_id`) REFERENCES `cart_product` (`cart_product_id`);

--
-- Contraintes pour la table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `command_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `command_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
