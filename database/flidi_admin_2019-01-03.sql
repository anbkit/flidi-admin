# ************************************************************
# Sequel Pro SQL dump
# Version 5224
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: flidi_admin
# Generation Time: 2019-01-03 15:16:47 +0000
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
	(48,9,'description','text','Description',0,1,1,1,1,1,'{}',4),
	(49,9,'address','text','Address',1,1,1,1,1,1,'{}',5),
	(50,9,'province_id','text','Province Id',1,1,1,1,1,1,'{}',2),
	(51,9,'image','multiple_images','Image',1,1,1,1,1,1,'{}',6),
	(52,9,'detail','text','Detail',1,1,1,1,1,1,'{}',7),
	(53,9,'longitude','text','Longitude',1,1,1,1,1,1,'{}',8),
	(54,9,'latitude','text','Latitude',1,1,1,1,1,1,'{}',9),
	(55,9,'rate_total','text','Rate Total',1,1,1,1,1,1,'{}',10),
	(56,9,'rate_count','text','Rate Count',1,1,1,1,1,1,'{}',11),
	(57,9,'status','text','Status',0,1,1,1,1,1,'{}',12),
	(58,9,'search_pid','text','Search Pid',1,1,1,1,1,1,'{}',13),
	(59,9,'created_at','timestamp','Created At',1,1,1,1,0,1,'{}',14),
	(60,9,'updated_at','timestamp','Updated At',1,0,0,0,0,0,'{}',15),
	(61,9,'version','text','Version',0,1,1,1,1,1,'{}',16),
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
	(9,'locations','locations','Location','Locations',NULL,'App\\Models\\Location',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null}','2018-12-25 06:42:22','2018-12-30 05:56:30'),
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



# Dump of table locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `rate_total` float NOT NULL DEFAULT '0',
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


# Dump of table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','2018-12-22 07:26:20','2018-12-22 07:26:20');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_01_000000_add_voyager_user_fields',1),
	(4,'2016_01_01_000000_create_data_types_table',1),
	(5,'2016_05_19_173453_create_menu_table',1),
	(6,'2016_10_21_190000_create_roles_table',1),
	(7,'2016_10_21_190000_create_settings_table',1),
	(8,'2016_11_30_135954_create_permission_table',1),
	(9,'2016_11_30_141208_create_permission_role_table',1),
	(10,'2016_12_26_201236_data_types__add__server_side',1),
	(11,'2017_01_13_000000_add_route_to_menu_items_table',1),
	(12,'2017_01_14_005015_create_translations_table',1),
	(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),
	(14,'2017_03_06_000000_add_controller_to_data_types_table',1),
	(15,'2017_04_21_000000_add_order_to_data_rows_table',1),
	(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),
	(17,'2017_08_05_000000_add_group_to_settings_table',1),
	(18,'2017_11_26_013050_add_user_role_relationship',1),
	(19,'2017_11_26_015000_create_user_roles_table',1),
	(20,'2018_03_11_000000_add_user_settings',1),
	(21,'2018_03_14_000000_add_details_to_data_types_table',1),
	(22,'2018_03_16_000000_make_settings_value_nullable',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission_role`;

CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;

INSERT INTO `permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1);

/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`)
VALUES
	(1,'browse_admin',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(2,'browse_bread',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(3,'browse_database',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(4,'browse_media',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(5,'browse_compass',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(6,'browse_menus','menus','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(7,'read_menus','menus','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(8,'edit_menus','menus','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(9,'add_menus','menus','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(10,'delete_menus','menus','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(11,'browse_roles','roles','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(12,'read_roles','roles','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(13,'edit_roles','roles','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(14,'add_roles','roles','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(15,'delete_roles','roles','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(16,'browse_users','users','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(17,'read_users','users','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(18,'edit_users','users','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(19,'add_users','users','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(20,'delete_users','users','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(21,'browse_settings','settings','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(22,'read_settings','settings','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(23,'edit_settings','settings','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(24,'add_settings','settings','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(25,'delete_settings','settings','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(26,'browse_hooks',NULL,'2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(27,'browse_wards','wards','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(28,'read_wards','wards','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(29,'edit_wards','wards','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(30,'add_wards','wards','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(31,'delete_wards','wards','2018-12-22 07:52:39','2018-12-22 07:52:39'),
	(32,'browse_districts','districts','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(33,'read_districts','districts','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(34,'edit_districts','districts','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(35,'add_districts','districts','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(36,'delete_districts','districts','2018-12-22 08:05:13','2018-12-22 08:05:13'),
	(37,'browse_provinces','provinces','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(38,'read_provinces','provinces','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(39,'edit_provinces','provinces','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(40,'add_provinces','provinces','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(41,'delete_provinces','provinces','2018-12-22 08:09:07','2018-12-22 08:09:07'),
	(42,'browse_locations','locations','2018-12-25 06:42:22','2018-12-25 06:42:22'),
	(43,'read_locations','locations','2018-12-25 06:42:22','2018-12-25 06:42:22'),
	(44,'edit_locations','locations','2018-12-25 06:42:22','2018-12-25 06:42:22'),
	(45,'add_locations','locations','2018-12-25 06:42:22','2018-12-25 06:42:22'),
	(46,'delete_locations','locations','2018-12-25 06:42:22','2018-12-25 06:42:22'),
	(47,'browse_web_users','web_users','2018-12-28 08:13:47','2018-12-28 08:13:47'),
	(48,'read_web_users','web_users','2018-12-28 08:13:47','2018-12-28 08:13:47'),
	(49,'edit_web_users','web_users','2018-12-28 08:13:47','2018-12-28 08:13:47'),
	(50,'add_web_users','web_users','2018-12-28 08:13:47','2018-12-28 08:13:47'),
	(51,'delete_web_users','web_users','2018-12-28 08:13:47','2018-12-28 08:13:47');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`)
VALUES
	(1,'admin','Administrator','2018-12-22 07:26:20','2018-12-22 07:26:20'),
	(2,'user','Normal User','2018-12-22 07:26:20','2018-12-22 07:26:20');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`)
VALUES
	(1,'site.title','Site Title','CMS Flidi','','text',1,'Site'),
	(2,'site.description','Site Description','CMS Flidi','','text',2,'Site'),
	(3,'site.logo','Site Logo','','','image',3,'Site'),
	(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),
	(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),
	(6,'admin.title','Admin Title','Flidi','','text',1,'Admin'),
	(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),
	(8,'admin.loader','Admin Loader','','','image',3,'Admin'),
	(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),
	(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `translations`;

CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`)
VALUES
	(1,1,'Flidi Admin','admin@flidi.com','users/default.png',NULL,'$2y$10$CV5wh8lqGVN2HOUeCG3ZruJ0wz79KFKueyDnMBnucZp5Rxszoz5ma',NULL,NULL,'2018-12-22 07:27:46','2018-12-22 07:27:46');

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
