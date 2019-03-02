# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: flidi
# Generation Time: 2019-03-02 06:40:32 +0000
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



# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `rate_total` float NOT NULL DEFAULT '0',
  `rating` float DEFAULT '0',
  `total_user` int(11) DEFAULT '0',
  `total_blog` int(11) DEFAULT NULL,
  `rate_count` int(10) unsigned NOT NULL DEFAULT '0',
  `status` smallint(1) DEFAULT '1',
  `search_pid` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`location_id`),
  KEY `province_id` (`province_id`),
  KEY `hack_province_id` (`search_pid`),
  CONSTRAINT `location_province_fk` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`location_id`, `location_name`, `description`, `address`, `province_id`, `image`, `detail`, `longitude`, `latitude`, `rate_total`, `rating`, `total_user`, `total_blog`, `rate_count`, `status`, `search_pid`, `created_at`, `updated_at`, `version`)
VALUES
	(1,'Nhà thờ Đức Bà','Tourist travel across the world for mainly for three reasons - To Know history, to discover new places and lastly for Spiritual reason. While travelling to Vietnam and you wish to visit a cathedral then Duc Ba Church in the Ho Chi Minh City is the best option for you where you need to be in a boat to visit the church. It is really a good place for just experiencing a spiritual site, along with finding eternal peace here by praying for some time. Its official name is Saigon Notre-Dame Cathedral Basilica which is lengthy to Pronounce.','01 Công xã Paris, phường Bến Nghé, quận 1',1,'[\"locations\\/February2019\\/Sr2W5ue7bzwsthCiM9ry.jpeg\",\"locations\\/February2019\\/nwzKuv3zaKsSh3KZLtbP.jpg\",\"locations\\/February2019\\/xYkwdiroMMFTiLTJgoSM.png\",\"locations\\/February2019\\/IwYEzHmmJBbyEHEfTycU.jpg\",\"locations\\/February2019\\/p3Wp0sJ7XsPJfFqsPm1j.png\"]','Tourist travel across the world for mainly for three reasons - To Know history, to discover new places and lastly for Spiritual reason. While travelling to Vietnam and you wish to visit a cathedral then Duc Ba Church in the Ho Chi Minh City is the best option for you where you need to be in a boat to visit the church. It is really a good place for just experiencing a spiritual site, along with finding eternal peace here by praying for some time. Its official name is Saigon Notre-Dame Cathedral Basilica which is lengthy to Pronounce.',106.69916534423828,10.779855728149414,4.5,1.75,2,3,1,1,1,'2018-08-22 03:14:00','2019-02-17 14:53:09',1),
	(2,'Bitexco','Bitexco Financial Tower (Vietnamese: Tháp Tài chính Bitexco) is a skyscraper in Ho Chi Minh City, Vietnam. At its completion in 2010, it became the tallest building in Vietnam and kept this status until January 2011, when it was surpassed by Keangnam Hanoi Landmark Tower. With 68 floors above ground and three basements, the building has a height of 262.5 metres (861 ft), making it the second tallest building in the city, fifth tallest in Vietnam, and the 263rd tallest in the world, as of the beginning of 2018.','02 Hải Triều, Quận 1',1,'[\"locations\\/February2019\\/Sr2W5ue7bzwsthCiM9ry.jpeg\",\"locations\\/February2019\\/nwzKuv3zaKsSh3KZLtbP.jpg\",\"locations\\/February2019\\/xYkwdiroMMFTiLTJgoSM.png\"]','Bitexco Financial Tower (Vietnamese: Tháp Tài chính Bitexco) is a skyscraper in Ho Chi Minh City, Vietnam. At its completion in 2010, it became the tallest building in Vietnam and kept this status until January 2011, when it was surpassed by Keangnam Hanoi Landmark Tower. With 68 floors above ground and three basements, the building has a height of 262.5 metres (861 ft), making it the second tallest building in the city, fifth tallest in Vietnam, and the 263rd tallest in the world, as of the beginning of 2018.[3]\n\nThe tower is owned by Bitexco Group, a Vietnamese multi-industry corporation, with a focus on real estate development. The building also houses the Ho Chi Minh City office of Bitexco Group, while its headquarters are in Hanoi.[4]\n\nThe tower was designed by Carlos Zapata, Design Principal and Founder of Carlos Zapata Studio, with French company AREP as architect of record. Designer Zapata, who was born in Venezuela but is based in New York City, drew inspiration for this skyscraper\'s unique shape from Vietnam\'s national flower, the Lotus.[5]\n\nThe tower was officially inaugurated on October 31, 2010. In 2013, CNN.com named the Bitexco Financial Tower one of the 25 Great Skyscraper Icons of Construction.[6] And in 2015, Thrillist.com named the Bitexco Financial Tower the #2 Coolest Skyscraper in the World.',106.704545,10.771845,3.5,NULL,NULL,NULL,1,1,1,'2018-12-15 08:57:30','2019-02-14 19:42:43',1),
	(3,'Bưu điện trung tâm Sài Gòn','The Ho Chi Minh City Post Office, or the Saigon Central Post Office (Vietnamese: Bưu điện Trung tâm Sài Gòn, French: Poste centrale de Saïgon) is a post office in the downtown Ho Chi Minh City, near Saigon Notre-Dame Basilica, the city\'s cathedral. The building was constructed when Vietnam was part of French Indochina in the late 19th century. It counts with Gothic, Renaissance and French influences. It was constructed between 1886-1891 and is now a tourist attraction.[1]\nSaigon Central Post Office in 1895','Số 125 Công xã Paris, Bến Nghé, Quận 1',1,'[\"locations\\/February2019\\/Sr2W5ue7bzwsthCiM9ry.jpeg\",\"locations\\/February2019\\/nwzKuv3zaKsSh3KZLtbP.jpg\",\"locations\\/February2019\\/xYkwdiroMMFTiLTJgoSM.png\"]','The Ho Chi Minh City Post Office, or the Saigon Central Post Office (Vietnamese: Bưu điện Trung tâm Sài Gòn, French: Poste centrale de Saïgon) is a post office in the downtown Ho Chi Minh City, near Saigon Notre-Dame Basilica, the city\'s cathedral. The building was constructed when Vietnam was part of French Indochina in the late 19th century. It counts with Gothic, Renaissance and French influences. It was constructed between 1886-1891 and is now a tourist attraction.[1]\nSaigon Central Post Office in 1895\n\nIt was designed by Alfred Foulhoux,[2] but is often erroneously credited as being the work of Gustave Eiffel or a collaboration between Foulhoux and Hanoi-based Auguste Henri Vildieu. As translated by the historian Tim Doling, the journal Architecte constructeur: Revue du monde architectural et artistique of 15 September 1891 commented: “The inauguration the new Saigon Post Office, which was held on July 14, had been postponed until the return of the Governor General. This monument, adorned with a most artistic façade, is particularly well laid out and well equipped for the different services to which it is intended; it does the greatest honour to the skill and talent of the distinguished Chief Architect of the Colony, M. Foulhoux.”[3]\n\nInside the Saigon Central Post office of special note are two painted maps that were created just after the post office was built, the first one located on the left side of the building is a map of Southern Vietnam and Cambodia titled Lignes telegraphiques du Sud Vietnam et Cambodge 1892 which translates to \"Telegraphic lines of Southern Vietnam and Cambodia 1892\". The second map of greater Saigon is titled Saigon et ses environs 1892 that translates as \"Saigon and its surroundings 1892\".',106.70098,10.77653,0,NULL,NULL,NULL,0,1,1,'2018-12-16 06:53:16','2019-02-14 19:42:42',0),
	(4,'Dinh Độc Lập','Independence Palace (Dinh Độc Lập), also known as Reunification Palace (Vietnamese: Dinh Thống Nhất), built on the site of the former Norodom Palace, is a landmark in Ho Chi Minh City, Vietnam. It was designed by architect Ngô Viết Thụ and was the home and workplace of the President of South Vietnam during the Vietnam War. It was the site of the end of the Vietnam War during the Fall of Saigon on 30 April 1975, when a North Vietnamese Army tank crashed through its gates.','135 Nam Kỳ Khởi Nghĩa, phường Bến Nghé, quận 1',1,'[\"locations\\/February2019\\/Sr2W5ue7bzwsthCiM9ry.jpeg\",\"locations\\/February2019\\/nwzKuv3zaKsSh3KZLtbP.jpg\",\"locations\\/February2019\\/xYkwdiroMMFTiLTJgoSM.png\"]','In 1858, France launched an attack on Đà Nẵng, starting its invasion of Vietnam. In 1867, France completed its conquest of southern Vietnam (Cochinchina), comprising the provinces of Biên Hòa, Gia Định, Định Tường, Vĩnh Long, An Giang, and Hà Tiên. To consolidate the newly established colony, on 23 February 1868, Pierre-Paul de La Grandière, Governor of Cochinchina, held a ceremony to lay the foundation stone of a new palace to replace the old wooden palace built in 1863. The new Governor\'s Palace was designed by Achille-Antoine Hermitte, who was also the architect of the Hong Kong City Hall. The first cubic stone, measuring 50 cm along each edge, with indentations containing French gold and silver coins bearing Napoleon III\'s effigy, came from Biên Hòa.The complex covered an area of 12 hectares, including a palace with an 80-meter-wide façade, a guest-chamber capable of accommodating 800 people, with spacious gardens covered by green trees and a lawn. Most of the building materials were imported from France. Owing to the Franco-Prussian War of 1870, construction fell behind schedule and was not completed until 1873. The palace was named Norodom Palace after the then king of Cambodia, Norodom (1834–1904). The avenue in front of the palace bore the same name. From 1871 to 1887, the palace was used by the French Governor of Cochinchina (Gouverneur de la Cochinchine); therefore, it was referred to as the Governor’s Palace. From 1887 to 1945, all Governors-General of French Indochina used the palace as their residence and office. The office of the Cochinchinese Governors was relocated to a nearby villa.',106.696105,10.777749,0,NULL,NULL,NULL,0,1,1,'2018-12-16 06:55:00','2019-02-14 12:40:54',0);

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


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


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UKname` (`name`) USING BTREE,
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`role_id`, `name`)
VALUES
	(2,'ROLE_ADMIN'),
	(1,'ROLE_USER');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(6) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKusername` (`username`) USING BTREE,
  UNIQUE KEY `UKemail` (`email`) USING BTREE,
  UNIQUE KEY `UK_sx468g52bpetvlad2j9y0lptc` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `group_id`, `username`, `password`, `email`, `first_name`, `last_name`, `avatar`, `active`, `last_login`, `created_at`, `updated_at`, `version`)
VALUES
	(1,NULL,'daitran','$2a$10$aMhopqMrvBzvJDY4y/z5M.ULYcW.1OkF4XmNtCnrwJRAJ9IqqA.26','daitq@gmail.com','David','Tran','',1,'2018-08-21 15:08:07','2018-08-21 08:08:08','2018-12-14 15:03:35',3),
	(2,NULL,'quocdaitran','$2a$10$2EKkMppq.pCxLN46/9xqceb5iCVrNUiX8YBKpXU39jZj..xk.Zj4K','daitran@gmail.com','Dai','Tran',NULL,1,'2018-12-08 14:25:29','2018-12-08 07:25:29','2018-12-08 07:29:00',0),
	(3,NULL,'quocdaitran1','$2a$10$HP9aorCUNCGrRBk6XDMJK.aKGWIYAWiupX9W6jul2lGXtz0I4fONW','daitran1@gmail.com','Dai','Tran',NULL,1,'2018-12-08 14:29:26','2018-12-08 07:29:26','2018-12-08 07:29:26',0),
	(4,NULL,'quocdaitran2','$2a$10$TCQHWYKzIlxvStxG1X6AxOoGPBUMutNtC0iU3pxBISsLkgjoViGQ.','daitran2@gmail.com','Dai','Tran',NULL,0,'2018-12-08 14:30:19','2018-12-08 07:30:19','2018-12-08 07:30:19',0),
	(5,NULL,'quocdaitran294','$2a$10$paj.o.f1otC9k6aGZ94PBODh1c90QAziSqmDTtWqghaSO6nkS7ow2','daitran693@gmail.com','Dai','Tran',NULL,1,'2018-12-08 14:34:19','2018-12-08 07:34:19','2018-12-08 07:34:19',0),
	(6,NULL,'quocdaitran107','$2a$10$COdNi6ktQnPE6tYaddIJues3tQpwArHUowj0qpj08D1FM8qGwzzty','daitran710@gmail.com','Dai','Tran',NULL,1,'2018-12-16 14:18:03','2018-12-16 07:18:03','2018-12-16 07:18:03',0),
	(7,NULL,'quocdaitran867','$2a$10$.NBo2XQy7TcXunhnD4eENec5OMAPMmoEw9SUgGmWoRVzY3HMTBIQm','daitran762@gmail.com','Dai','Tran',NULL,1,'2018-12-16 14:48:25','2018-12-16 07:48:25','2018-12-16 07:48:25',0),
	(8,NULL,'annguyen','$2a$10$wLSRXYLtq/bDxy.uvbvs2uDLaTqjGpniHVvid584plGiHmjJT2sx2','tronganbk@gmail.com','nguyen ','van a','',1,'2018-12-16 14:52:36','2018-12-16 07:52:36','2018-12-16 07:52:36',0),
	(9,NULL,'annguyen1','$2a$10$E1SC6U4QTNWx2iOdFmxpCuMN59WQXVkU6C5hoal865n5kZOqihwgu','trongan@outlook.com','An Nguyen','Nguyen','',1,'2018-12-16 14:53:34','2018-12-16 07:53:34','2018-12-16 07:53:34',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
