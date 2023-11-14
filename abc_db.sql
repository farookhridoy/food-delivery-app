/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - abc_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`abc_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `abc_db`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_11_14_102706_create_riders_table',1),
(6,'2023_11_14_102709_create_restaurants_table',1),
(7,'2023_11_14_103651_create_rider_movements_table',1),
(8,'2023_11_14_105512_add_service_name_in_rider_movements_table',2);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `restaurants` */

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Status 0=Inactive and 1= Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `restaurants` */

insert  into `restaurants`(`id`,`name`,`restaurant_id`,`latitude`,`longitude`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Miss Corene Medhurst I','L9KZebEpqE','30.397477','166.394115',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(2,'Kailyn Heidenreich','Ud335nOoP5','-52.132309','111.311925',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(3,'Elliot Blick','FmLx5GOeFk','60.615619','-37.027661',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(4,'Dr. Jaron Pfeffer','0MDeYNoqr8','17.754119','-170.056402',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(5,'Dr. Colten McGlynn DDS','iXA6bUndpO','7.588867','-89.94616',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(6,'Sonny Balistreri','pD1wrkGVot','-29.010216','-105.629808',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(7,'Theodora Trantow','dv1w5nZbwd','4.121552','-157.710372',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(8,'Mrs. Nayeli Hodkiewicz','Y6FdCTVqjQ','-3.402089','-154.926034',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(9,'Devon Lynch','zinj2wVxOl','-54.046883','-107.936154',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(10,'Garrison Mitchell','tZp4W2sQ0s','73.519','174.249701',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL);

/*Table structure for table `rider_movements` */

DROP TABLE IF EXISTS `rider_movements`;

CREATE TABLE `rider_movements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rider_id` bigint unsigned NOT NULL,
  `service_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movement_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rider_movements_rider_id_foreign` (`rider_id`),
  CONSTRAINT `rider_movements_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `riders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rider_movements` */

insert  into `rider_movements`(`id`,`rider_id`,`service_name`,`latitude`,`longitude`,`movement_time`,`created_at`,`updated_at`) values 
(1,1,'Food delivery','11.389975','107.110639','2023-11-14 17:55:17','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(2,2,'Food delivery','-7.842682','-1.079374','2023-11-14 17:55:21','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(3,3,'Food delivery','57.284379','133.656907','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(4,4,'Food delivery','-59.617205','-109.844832','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(5,5,'Food delivery','-34.111463','126.866873','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(6,6,'Food delivery','-38.513026','9.713433','2023-11-14 17:55:12','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(7,7,'Food delivery','-34.748248','159.577725','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(8,8,'Food delivery','-22.034042','-172.252661','2023-11-14 17:55:14','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(9,9,'Food delivery','62.729103','117.990558','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(10,10,'Food delivery','13.076239','-2.89432','2023-11-14 11:35:00','2023-11-14 11:35:00','2023-11-14 11:35:00'),
(11,1,'Food Delivery','30.397478','166.394115','2023-11-14 17:55:17','2023-11-14 11:55:37','2023-11-14 11:55:37'),
(12,2,'Parcel Delivery','31.397478','169.394115','2023-11-14 17:55:17','2023-11-14 11:56:52','2023-11-14 11:56:52'),
(13,3,'Parcel Delivery','31.397478','169.394115','2023-11-14 17:55:17','2023-11-14 11:57:51','2023-11-14 11:57:51'),
(14,4,'Parcel Delivery','31.397478','169.394115','2023-11-14 17:55:17','2023-11-14 11:58:33','2023-11-14 11:58:33');

/*Table structure for table `riders` */

DROP TABLE IF EXISTS `riders`;

CREATE TABLE `riders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'Status 0=Inactive and 1= Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `riders_rider_id_unique` (`rider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `riders` */

insert  into `riders`(`id`,`name`,`rider_id`,`status`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Kieran Little','cJL4yhpQYl',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(2,'Rhianna Barton','YTedPuzlNw',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(3,'Angelita Herman','aBHN9X8OXm',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(4,'Dr. Juliana Bechtelar','nuNajzGEZ0',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(5,'Ben Jacobi','pWzVewMpNU',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(6,'Jermey Beatty','FMAhEXH78r',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(7,'Conor Littel','pZhYXBfaPE',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(8,'Kade Connelly','5NLlp31gcN',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(9,'Prof. Jennings Howell PhD','X0KOJeguWW',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL),
(10,'Jakob Borer','goGanipfxN',1,'2023-11-14 11:35:00','2023-11-14 11:35:00',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
