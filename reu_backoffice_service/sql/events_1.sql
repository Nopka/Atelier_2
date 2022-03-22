-- Adminer 4.8.1 MySQL 5.5.5-10.6.5-MariaDB-1:10.6.5+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` varchar(100) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `dateEvent` datetime NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `idCreateur` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `events` (`id`, `titre`, `description`, `dateEvent`, `lieu`, `idCreateur`, `token`, `created_at`, `updated_at`) VALUES
('b003100b-1d95-4734-8982-b40f498c4e68',	'soir&eacute;e chez alice',	'soiree monopoly chez alice',	'2021-03-06 23:00:00',	'2Ter Bd Charlemagne, 54000 Nancy',	'a95144d2-1a31-458f-8665-35f571105665',	'3cbfc34b314b9342068010e5049877bd7de5d228910816e32e5a239e25bd3886',	'2022-03-21 14:24:03',	'2022-03-21 14:24:03');

-- 2022-03-21 14:44:31
