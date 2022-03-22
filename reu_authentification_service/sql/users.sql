-- Adminer 4.8.1 MySQL 5.5.5-10.6.5-MariaDB-1:10.6.5+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `refresh_token` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `last_connected` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `users` (`id`, `username`, `email`, `password`, `refresh_token`, `description`, `created_at`, `updated_at`, `last_connected`) VALUES
('test',	'test',	'test@gmail.com',	'$2y$10$oyu11.ClEKuWXAgTB8af0.sFsvCMyerQKvUPDW5ZMhcoTmcs6WEWC',	'efec171ab7097818c1da2d919599feeb37b338aff53d18c5c4b16a7541a3bd10',	'blupblup',	'2022-03-21 16:54:51',	'2022-03-21 16:54:51',	'0000-00-00 00:00:00'),
('31fd9fac19b0e13c01528246f92d4a9aa18869bbe5aa5581035be9ea3421ac9b0e5ce1d8',	'yannou',	'yannou@gmail.com',	'$2y$10$K4ofWwT9ufjaSv2.IbD0reJuIwtLfDa2e8JDr7WI0aKSsynt5/1fm',	'f7cff98a453043f17a6d00d9b1175bb8e50427804ae88547da24c95f928802dd',	'Miam le kabab',	'2022-03-22 10:45:49',	'2022-03-22 10:45:49',	'2022-03-22 10:45:49');

-- 2022-03-22 11:06:24
