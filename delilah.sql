-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.6053
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for delilah
DROP DATABASE IF EXISTS `delilah`;
CREATE DATABASE IF NOT EXISTS `delilah` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `delilah`;

-- Dumping structure for table delilah.dishes
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.dishes: ~0 rows (approximately)
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;

-- Dumping structure for table delilah.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_status` int(11) NOT NULL,
  `hour` time NOT NULL DEFAULT curtime(),
  `id_user` int(11) NOT NULL,
  `id_paymethod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_paymethod` (`id_paymethod`),
  KEY `code_status` (`code_status`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_paymethod`) REFERENCES `pay_methods` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`code_status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table delilah.orders_description
DROP TABLE IF EXISTS `orders_description`;
CREATE TABLE IF NOT EXISTS `orders_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_dishes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `orders_description_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.orders_description: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_description` ENABLE KEYS */;

-- Dumping structure for table delilah.pay_methods
DROP TABLE IF EXISTS `pay_methods`;
CREATE TABLE IF NOT EXISTS `pay_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.pay_methods: ~4 rows (approximately)
/*!40000 ALTER TABLE `pay_methods` DISABLE KEYS */;
INSERT INTO `pay_methods` (`id`, `method`) VALUES
	(1, 'Credit'),
	(2, 'Debit'),
	(3, 'Cash'),
	(4, 'PSE');
/*!40000 ALTER TABLE `pay_methods` ENABLE KEYS */;

-- Dumping structure for table delilah.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.roles: ~2 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `rol`) VALUES
	(1, 'client'),
	(2, 'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table delilah.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.status: ~6 rows (approximately)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `state`) VALUES
	(1, 'nuevo'),
	(2, 'confirmado'),
	(3, 'preparando'),
	(4, 'enviando'),
	(5, 'cancelado'),
	(6, 'entregado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Dumping structure for table delilah.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `phone` varchar(60) NOT NULL,
  `password` char(30) NOT NULL,
  `address` varchar(60) NOT NULL,
  `code_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code_rol` (`code_rol`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`code_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table delilah.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `name`, `phone`, `password`, `address`, `code_rol`) VALUES
	(1, 'juanr', 'juanprmendoza96@gmail.com', 'Juan Romero', '3004936806', '028696113', 'CIR 77 48 68', 2),
	(2, 'juanprm', 'juanprmendoza96@hotmail.com', 'Pablo Mendoza', '3023184360', '028696112', 'CIR 77 38 58', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
