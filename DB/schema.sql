CREATE DATABASE `webinspired` /*!40100 COLLATE 'utf8_general_ci' */;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'наименование',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'позиция при сортировке',
  `parent_id` int(11) DEFAULT NULL COMMENT 'ссылка на родительскую кат. (Adjacency List)',
  PRIMARY KEY (`id`),
  KEY `FK_parent` (`parent_id`),
  CONSTRAINT `FK_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории товаров';

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL COMMENT 'категория',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'наименование',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'цена',
  `description` text COMMENT 'описание',
  `spec` text COMMENT 'спецификации',
  `qty` int(11) DEFAULT NULL COMMENT 'остаток на складе',
  PRIMARY KEY (`id`),
  KEY `FK_category` (`category_id`),
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Справочник товаров';

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'кому принадлежит заказ',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'момент создания заказа',
  `total` decimal(10,2) DEFAULT '0.00' COMMENT 'итоговая сумма заказа',
  `comment` text COMMENT 'коментарий к заказу',
  PRIMARY KEY (`id`),
  KEY `FK_user` (`user_id`),
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Заказы';

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT 'какому заказу принадлежит',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT 'какому товару принадлежит',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT 'количество',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'цена',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'сумма',
  PRIMARY KEY (`id`),
  KEY `FK_order` (`order_id`),
  KEY `FK_item` (`item_id`),
  CONSTRAINT `FK_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержимое заказа';

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT 'email-адрес пользователя',
  `fullname` varchar(255) NOT NULL DEFAULT '' COMMENT 'ФИО',
  `password` text NOT NULL COMMENT 'хеш пароля',
  `salt` char(8) NOT NULL COMMENT 'соль хеша пароля',
  `address` text COMMENT 'куда отправлять товар',
  `phone` varchar(15) DEFAULT NULL COMMENT 'телефон для связи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
