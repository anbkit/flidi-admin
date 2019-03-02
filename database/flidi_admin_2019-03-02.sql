# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: flidi_admin
# Generation Time: 2019-03-02 05:10:46 +0000
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
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
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
  CONSTRAINT `blog_user_fk` FOREIGN KEY (`user_id`) REFERENCES `web_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table data_rows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_rows`;

CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`)
VALUES
	(1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),
	(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),
	(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),
	(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),
	(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),
	(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),
	(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),
	(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),
	(11,1,'locale','text','Locale',0,1,1,1,1,0,NULL,12),
	(12,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),
	(13,2,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(14,2,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(15,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
	(16,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
	(17,3,'id','number','ID',1,0,0,0,0,0,NULL,1),
	(18,3,'name','text','Name',1,1,1,1,1,1,NULL,2),
	(19,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),
	(20,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),
	(21,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),
	(22,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),
	(23,5,'ward_id','text','Ward Id',1,0,0,0,0,0,'{}',1),
	(24,5,'name','text','Name',1,1,1,1,1,1,'{}',3),
	(25,5,'type','text','Type',1,1,1,1,1,1,'{}',4),
	(26,5,'location','text','Location',1,1,1,1,1,1,'{}',5),
	(27,5,'district_id','text','District Id',1,1,1,1,1,1,'{}',2),
	(28,5,'created_at','timestamp','Created At',1,1,1,1,0,1,'{}',6),
	(29,5,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',7),
	(30,6,'district_id','text','District Id',1,0,0,0,0,0,'{}',1),
	(31,6,'name','text','Name',1,1,1,1,1,1,'{}',3),
	(32,6,'type','text','Type',1,1,1,1,1,1,'{}',4),
	(33,6,'location','text','Location',1,1,1,1,1,1,'{}',5),
	(34,6,'province_id','text','Province Id',1,1,1,1,1,1,'{}',2),
	(35,6,'created_at','timestamp','Created At',1,1,1,1,0,1,'{}',6),
	(36,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',7),
	(37,7,'province_id','text','Province Id',1,0,0,0,0,0,'{}',1),
	(38,7,'province_name','text','Province Name',1,1,1,1,1,1,'{}',2),
	(39,7,'popular','text','Popular',1,1,1,1,1,1,'{}',3),
	(40,7,'latitude','text','Latitude',0,1,1,1,1,1,'{}',4),
	(41,7,'longitude','text','Longitude',0,1,1,1,1,1,'{}',5),
	(42,7,'status','text','Status',0,1,1,1,1,1,'{}',6),
	(43,7,'created_at','timestamp','Created At',1,1,1,1,0,1,'{}',7),
	(44,7,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',8),
	(45,7,'version','text','Version',0,1,1,1,1,1,'{}',9),
	(46,9,'location_id','text','Location Id',1,0,0,0,0,0,'{}',1),
	(47,9,'location_name','text','Location Name',1,1,1,1,1,1,'{}',3),
	(48,9,'description','text','Description',0,0,1,1,1,1,'{}',4),
	(49,9,'address','text','Address',1,0,1,1,1,1,'{}',5),
	(50,9,'province_id','text','Province Id',1,1,1,1,1,1,'{}',2),
	(51,9,'image','multiple_images','Image',1,0,1,1,1,1,'{}',6),
	(52,9,'detail','text','Detail',1,0,1,1,1,1,'{}',7),
	(53,9,'longitude','text','Longitude',1,0,1,1,1,1,'{}',8),
	(54,9,'latitude','text','Latitude',1,0,1,1,1,1,'{}',9),
	(55,9,'rate_total','text','Rate Total',1,0,1,1,1,1,'{}',10),
	(56,9,'rate_count','text','Rate Count',1,1,1,1,1,1,'{}',11),
	(57,9,'status','text','Status',0,0,1,1,1,1,'{}',12),
	(58,9,'search_pid','text','Search Pid',1,0,1,1,1,1,'{}',13),
	(59,9,'created_at','timestamp','Created At',1,0,1,1,0,1,'{}',14),
	(60,9,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',15),
	(61,9,'version','text','Version',0,0,1,1,1,1,'{}',16),
	(62,14,'user_id','text','User Id',1,0,0,0,0,0,'{}',1),
	(63,14,'group_id','text','Group Id',0,1,1,1,1,1,'{}',2),
	(64,14,'username','text','Username',1,1,1,1,1,1,'{}',3),
	(65,14,'password','text','Password',1,1,1,1,1,1,'{}',4),
	(66,14,'email','text','Email',1,1,1,1,1,1,'{}',5),
	(67,14,'first_name','text','First Name',0,1,1,1,1,1,'{}',6),
	(68,14,'last_name','text','Last Name',0,1,1,1,1,1,'{}',7),
	(69,14,'avatar','text','Avatar',0,1,1,1,1,1,'{}',8),
	(70,14,'active','text','Active',0,1,1,1,1,1,'{}',9),
	(71,14,'last_login','text','Last Login',0,1,1,1,1,1,'{}',10),
	(72,14,'created_at','timestamp','Created At',1,1,1,1,0,1,'{}',11),
	(73,14,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',12),
	(74,14,'version','text','Version',0,1,1,1,1,1,'{}',13);

/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data_types`;

CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`)
VALUES
	(1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(5,'wards','wards','Ward','Wards',NULL,'App\\Models\\Ward',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(6,'districts','districts','District','Districts',NULL,'App\\Models\\District',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(7,'provinces','provinces','Province','Provinces',NULL,'App\\Models\\Province',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(9,'locations','locations','Location','Locations',NULL,'App\\Models\\Location',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-25 06:42:22','2019-02-14 12:57:18'),
	(14,'web_users','web-users','User','Users',NULL,'App\\Models\\WebUser',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-28 08:13:47','2018-12-28 08:14:07');

/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;


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



# Dump of table menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_items`;

CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`)
VALUES
	(1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.dashboard',NULL),
	(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.media.index',NULL),
	(3,1,'Admins','','_self','voyager-person','#000000',NULL,3,'2018-12-22 07:26:20','2018-12-28 08:10:18','voyager.users.index','null'),
	(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.roles.index',NULL),
	(5,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2018-12-22 07:26:20','2018-12-22 07:26:20',NULL,NULL),
	(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.menus.index',NULL),
	(7,1,'Database','','_self','voyager-data',NULL,5,11,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.database.index',NULL),
	(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.compass.index',NULL),
	(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.bread.index',NULL),
	(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.settings.index',NULL),
	(11,1,'Hooks','','_self','voyager-hook',NULL,5,13,'2018-12-22 07:26:20','2018-12-22 07:26:20','voyager.hooks',NULL),
	(12,1,'Wards','','_self',NULL,NULL,NULL,15,'2018-12-22 07:52:39','2018-12-22 07:52:39','voyager.wards.index',NULL),
	(13,1,'Districts','','_self',NULL,NULL,NULL,16,'2018-12-22 08:05:13','2018-12-22 08:05:13','voyager.districts.index',NULL),
	(14,1,'Provinces','','_self',NULL,NULL,NULL,17,'2018-12-22 08:09:07','2018-12-22 08:09:07','voyager.provinces.index',NULL),
	(15,1,'Locations','','_self','voyager-location','#000000',NULL,18,'2018-12-25 06:42:22','2018-12-28 08:14:50','voyager.locations.index','null'),
	(16,1,'Users','','_self','voyager-people','#000000',NULL,19,'2018-12-28 08:13:47','2018-12-28 08:14:30','voyager.web-users.index','null');

/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
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



# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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



# Dump of table web_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `web_users`;

CREATE TABLE `web_users` (
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




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
