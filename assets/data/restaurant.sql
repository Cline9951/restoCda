-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 24 mars 2022 à 22:05
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `cook`
--

DROP TABLE IF EXISTS `cook`;
CREATE TABLE IF NOT EXISTS `cook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7359C454FCDAEAAA` (`order_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cook`
--

INSERT INTO `cook` (`id`, `order_id_id`, `name`) VALUES
(2, 1, 'Luigi'),
(3, 2, 'Mario');

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_81398E0973B8532F` (`table_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`id`, `table_id_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_957D8CB8EEE8BD30` (`menu_id_id`),
  KEY `IDX_957D8CB8CFFE9AD6` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`id`, `menu_id_id`, `orders_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'pizza', 'pizza', '2022-03-24 22:00:58', '2022-03-24 22:00:58'),
(2, 2, 2, 'pot au feu', 'potaufeu', '2022-03-24 22:00:58', '2022-03-24 22:00:58');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220324155009', '2022-03-24 15:50:31', 994);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'midi', 'midi', '2022-03-24 21:57:46', '2022-03-24 21:57:46'),
(2, 'soir', 'soir', '2022-03-24 21:57:46', '2022-03-24 21:57:46');

-- --------------------------------------------------------

--
-- Structure de la table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waiter_id` int(11) DEFAULT NULL,
  `ref` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_480D45C2E9F3D07E` (`waiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notice`
--

INSERT INTO `notice` (`id`, `waiter_id`, `ref`) VALUES
(1, 2, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id_id` int(11) DEFAULT NULL,
  `order_num` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398881ECFA7` (`status_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `status_id_id`, `order_num`, `created_at`, `updated_at`) VALUES
(1, 1, 1111, '2022-03-24 21:37:44', '2022-03-24 21:37:44'),
(2, 2, 1112, '2022-03-24 21:37:44', '2022-03-24 21:37:44');

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_6D28840DFCDAEAAA` (`order_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `order_id_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 39.9, '2022-03-24 21:53:38', '2022-03-24 21:53:38'),
(2, 2, 100, '2022-03-24 21:53:38', '2022-03-24 21:53:38');

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7B61A1F64C3A3BB` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_method`
--

INSERT INTO `payment_method` (`id`, `payment_id`, `payment_method`) VALUES
(1, 1, 'CB'),
(2, 1, 'Cash'),
(3, 2, 'CB');

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `state`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `table`
--

DROP TABLE IF EXISTS `table`;
CREATE TABLE IF NOT EXISTS `table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `waiter_id_id` int(11) DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F6298F469DA2E63A` (`waiter_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `table`
--

INSERT INTO `table` (`id`, `waiter_id_id`, `qr_code`) VALUES
(1, 2, 'assets\\img\\qrcode_cat.png'),
(2, 1, 'assets\\img\\qrcode_cat.png');

-- --------------------------------------------------------

--
-- Structure de la table `waiter`
--

DROP TABLE IF EXISTS `waiter`;
CREATE TABLE IF NOT EXISTS `waiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `waiter`
--

INSERT INTO `waiter` (`id`, `name`) VALUES
(1, 'Napo'),
(2, 'Litin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cook`
--
ALTER TABLE `cook`
  ADD CONSTRAINT `FK_7359C454FCDAEAAA` FOREIGN KEY (`order_id_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_81398E0973B8532F` FOREIGN KEY (`table_id_id`) REFERENCES `table` (`id`);

--
-- Contraintes pour la table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `FK_957D8CB8CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `FK_957D8CB8EEE8BD30` FOREIGN KEY (`menu_id_id`) REFERENCES `menu` (`id`);

--
-- Contraintes pour la table `notice`
--
ALTER TABLE `notice`
  ADD CONSTRAINT `FK_480D45C2E9F3D07E` FOREIGN KEY (`waiter_id`) REFERENCES `waiter` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398881ECFA7` FOREIGN KEY (`status_id_id`) REFERENCES `status` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_6D28840DFCDAEAAA` FOREIGN KEY (`order_id_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `payment_method`
--
ALTER TABLE `payment_method`
  ADD CONSTRAINT `FK_7B61A1F64C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Contraintes pour la table `table`
--
ALTER TABLE `table`
  ADD CONSTRAINT `FK_F6298F469DA2E63A` FOREIGN KEY (`waiter_id_id`) REFERENCES `waiter` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
