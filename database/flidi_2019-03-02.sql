# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: flidi
# Generation Time: 2019-03-02 05:14:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table blogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `blog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` float DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `blog_location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;

INSERT INTO `blogs` (`blog_id`, `blog_title`, `description`, `image`, `detail`, `rating`, `user_id`, `location_id`, `status`, `created_at`, `updated_at`, `version`)
VALUES
	(12,'Nơi tuyệt vời để du lịch aaa','','[\"blogs\\/February2019\\/c6u82XtMZT9E7fp79Z7F.png\",\"blogs\\/February2019\\/kYqa24k61hYKehgnJh5E.png\"]','Nơi tuyệt vời để du lịchaaaaa',4,1,1,1,'2019-02-17 07:11:38','2019-02-17 14:29:49',0),
	(13,'Nơi tuyệt vời để du lịch','','[\"blogs\\/February2019\\/WuNOab9JXfi6nCJKfgBt.png\",\"blogs\\/February2019\\/QYADC4HweUdMj5OjungB.jpeg\",\"blogs\\/February2019\\/78nDpjpHbkNv35PqYBwh.jpg\"]','Nơi tuyệt vời để du lịch',NULL,2,1,1,'2019-02-17 07:11:38','2019-02-17 07:11:38',0),
	(14,'safafa','','[\"blogs\\/February2019\\/lZZGQDQjGBoZ110u6wND.jpg\"]','fasgasgasga',3.5,1,1,1,'2019-02-17 14:53:09','2019-02-17 14:53:09',0);

/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `media_id` int(10) unsigned DEFAULT NULL,
  `blog_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `media_id` (`media_id`),
  KEY `user_id` (`user_id`),
  KEY `comment_blog_fk` (`blog_id`),
  CONSTRAINT `comment_blog_fk` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_media_fk` FOREIGN KEY (`media_id`) REFERENCES `media_gallery` (`media_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table districts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `district_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`district_id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `district_province_fk` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `galleries`;

CREATE TABLE `galleries` (
  `gallery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`gallery_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `gallery_location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;

INSERT INTO `galleries` (`gallery_id`, `location_id`, `title`, `created_at`, `updated_at`, `version`)
VALUES
	(1,1,'Nh? th? c?','2018-12-14 15:58:01','2018-12-14 15:58:01',0);

/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `blog_id` int(10) unsigned DEFAULT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `like_blog_fk` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `like_media_fk` FOREIGN KEY (`media_id`) REFERENCES `media_gallery` (`media_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `like_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table media_gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_gallery`;

CREATE TABLE `media_gallery` (
  `media_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `media_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `imgurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`media_id`) USING BTREE,
  UNIQUE KEY `unique_media_name` (`media_name`),
  KEY `user_id` (`user_id`),
  KEY `gallery_id` (`gallery_id`),
  CONSTRAINT `media_gallery_fk` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`gallery_id`),
  CONSTRAINT `media_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `media_gallery` WRITE;
/*!40000 ALTER TABLE `media_gallery` DISABLE KEYS */;

INSERT INTO `media_gallery` (`media_id`, `gallery_id`, `media_name`, `description`, `imgurl`, `user_id`, `created_at`, `updated_at`, `version`)
VALUES
	(4,1,'photo-1497963756182-9baea17a369e.jpeg','blalalaa','http://localhost:8080/api/medias/photo-1497963756182-9baea17a369e.jpeg',1,'2018-12-14 16:11:28','2018-12-15 01:40:26',0),
	(5,1,'photo-1516692935701-4f35bff8b9f6.jpeg','blalalaa','http://localhost:8080/api/medias/photo-1516692935701-4f35bff8b9f6.jpeg',1,'2018-12-14 16:11:28','2018-12-15 01:40:37',0);

/*!40000 ALTER TABLE `media_gallery` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table provinces
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `province_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `popular` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` smallint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`province_id`),
  UNIQUE KEY `province_name` (`province_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;

INSERT INTO `provinces` (`province_id`, `province_name`, `popular`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`, `version`)
VALUES
	(1,'H? Ch? Minh',1,10.769444,106.681944,0,'2018-08-22 03:14:16','2018-12-15 05:07:29',0),
	(2,'H? N?i',1,21.028333,105.854167,0,'2018-12-15 04:52:54','2018-12-15 04:54:55',0),
	(3,'?? L?t',1,11.940381,108.436866,0,'2018-12-15 04:57:01','2018-12-15 04:57:30',0),
	(4,'Nha Trang',1,12.256111,109.196389,0,'2018-12-15 04:59:51','2018-12-15 04:59:51',0),
	(5,'Ninh Thu?n',1,11.565556,108.990278,0,'2018-12-15 05:00:36','2018-12-15 05:01:15',0),
	(6,'B?nh Thu?n',1,11.100252,108.141174,0,'2018-12-15 05:02:02','2018-12-15 05:04:36',0),
	(7,'Sa Pa',1,22.3475,103.8175,0,'2018-12-15 05:02:56','2018-12-15 05:02:56',0),
	(8,'Hu?',1,16.462622,107.585217,0,'2018-12-15 05:03:32','2018-12-15 05:04:43',0),
	(9,'?? N?ng',1,16.031944,108.220556,0,'2018-12-15 05:04:09','2018-12-15 05:04:52',0),
	(10,'Ph? Qu?c',1,10.222699,103.962659,0,'2018-12-15 05:05:36','2018-12-15 05:06:26',0),
	(11,'C?n Th?',1,10.032415,105.784092,0,'2018-12-15 05:06:13','2018-12-15 05:06:33',0);

/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ratings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `point` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `location_id` (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rating_location_fk` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON UPDATE CASCADE,
  CONSTRAINT `rating_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;

INSERT INTO `ratings` (`rate_id`, `location_id`, `user_id`, `point`, `created_at`, `updated_at`, `version`)
VALUES
	(1,2,1,3.5,'2018-12-15 10:25:13','2018-12-15 10:25:13',0),
	(2,1,1,4.5,'2018-12-15 10:25:28','2018-12-15 10:25:28',0);

/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_meta`;

CREATE TABLE `user_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `hobby` text COLLATE utf8_unicode_ci,
  `favorite_quote` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `university` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_meta_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_roles_fk` (`role_id`),
  CONSTRAINT `user_roles_roles_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_roles_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;

INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(1,2);

/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wards`;

CREATE TABLE `wards` (
  `ward_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ward_id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `ward_district_fk` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
