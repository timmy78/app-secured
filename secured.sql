-- phpMyAdmin SQL Dump
-- version 4.0.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 12 Avril 2015 à 14:57
-- Version du serveur: 5.6.11-log
-- Version de PHP: 5.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `secured`
--
CREATE DATABASE IF NOT EXISTS `secured` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `secured`;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1428845623),
('m130524_201442_init', 1428845625);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Lorem ipsum #1', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \r\n\r\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. \r\nUt enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 1428846950, 1428846950, 1),
(2, 'Lorem ipsum #2', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \r\nNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. ', 1428846961, 1428846961, 2),
(3, 'pouet', 'bla bla', 1428847334, 1428847334, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `blocked` int(1) DEFAULT NULL,
  `attempts` int(2) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `blocked`, `attempts`, `created_at`, `updated_at`) VALUES
(1, 'timothee', 'fCPbEIAzfpE8OxGYng5CDKsEJoWBTE6e', '$2y$13$bhP/M3cirdV0TqBKY8WWIeiuwcFKyy9zLuuQtFblZsfQ2c19HkQMa', NULL, 'timothep@yahoo.fr', 1, NULL, NULL, 1428845911, 1428845911),
(2, 'admin', 'QD0JRhf9E_ecKKrv7lHPI_ET0Nc2XksR', '$2y$13$NpHgfWRKrOZtukE4jFB/aeuh5viJ2b/cH0SF4hKsVUAApvIWwRnAa', NULL, 'timothee.planchais@gmail.com', 1, NULL, NULL, 1428845928, 1428845928),
(3, 'yoann', 'QPiT0UMYkJ4SGRIkTxGlYxECRvBwDtIw', '$2y$13$4vXpL/YYN7oePT4TIvc2CuFggHiQoDUmsps61h38j46XaAIg0NY56', NULL, 'yoyo@test.fr', 1, NULL, NULL, 1428849957, 1428849957);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
