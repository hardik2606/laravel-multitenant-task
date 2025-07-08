-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 08, 2025 at 10:13 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multitenant-task`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(1, NULL, 'login_success', 'Login success for devanshi@gmail.com', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 01:38:36', '2025-07-08 01:38:36'),
(2, 7, 'login_success', 'Login success for devanshi@gmail.com', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 01:39:43', '2025-07-08 01:39:43'),
(3, 2, 'login_success', 'Login success for user hdpatel1990@gmail.com', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 01:42:08', '2025-07-08 01:42:08'),
(4, 1, 'login_success', 'Login success for user admin@gmail.com', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 01:49:13', '2025-07-08 01:49:13'),
(5, 2, 'task_updated', 'Task \'Crud opearation 123\' updated.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 02:01:40', '2025-07-08 02:01:40'),
(6, 1, 'task_updated', 'Task \'Crud opearation 123\' updated.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 02:02:48', '2025-07-08 02:02:48'),
(7, 2, 'task_updated', 'Task updated by Kiran Patel', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:03:58', '2025-07-08 03:03:58'),
(8, 1, 'task_updated', 'Task created by Hardik Patel', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:05:13', '2025-07-08 03:05:13'),
(9, NULL, 'role_assigned', 'Assigned role Manager to vinay@gmail.com.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:09:39', '2025-07-08 03:09:39'),
(10, NULL, 'role_assigned', 'Assigned role Manager to rakesh@gmail.com.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:11:02', '2025-07-08 03:11:02'),
(11, NULL, 'login_success', 'Login success for user admin@gmail.com.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:12:31', '2025-07-08 03:12:31'),
(12, NULL, 'login_fail', 'Login fail for user admin@gmail.com.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:22:20', '2025-07-08 03:22:20'),
(13, NULL, 'login_success', 'Login success for user admin@gmail.com.', '127.0.0.1', 'PostmanRuntime/7.39.1', '2025-07-08 03:31:09', '2025-07-08 03:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_07_083749_create_tenants_table', 1),
(5, '2025_07_07_083803_create_projects_table', 1),
(9, '2025_07_07_083813_create_tasks_table', 2),
(7, '2025_07_07_090359_create_personal_access_tokens_table', 1),
(8, '2025_07_07_091407_create_permission_tables', 1),
(10, '2025_07_08_064802_create_activity_logs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'api-token', 'fdb819d7e95670ff311aeee465fe516d6a87ad891b41e5c1a74cde829c705857', '[\"*\"]', NULL, NULL, '2025-07-07 05:17:06', '2025-07-07 05:17:06'),
(2, 'App\\Models\\User', 2, 'api-token', '559ee07f258441c57232a0807e017c400857d0fa2ab7fd8850820a394f546848', '[\"*\"]', NULL, NULL, '2025-07-07 05:23:48', '2025-07-07 05:23:48'),
(3, 'App\\Models\\User', 3, 'api-token', '2f8943642c0d55147d4a3592526b2ddb9d07cf3e90d5db7b2e8c4043b7b15a92', '[\"*\"]', NULL, NULL, '2025-07-07 05:55:25', '2025-07-07 05:55:25'),
(4, 'App\\Models\\User', 4, 'api-token', 'cd43d2aba22e700ccdb31820b42e335715aa2a649a08a956ca416404e4e468e1', '[\"*\"]', NULL, NULL, '2025-07-07 05:59:14', '2025-07-07 05:59:14'),
(5, 'App\\Models\\User', 2, 'api-token', 'b1094d10eae83bf24c0dd464521c6a3393d36f27ec68de894cb836f6b5a604c1', '[\"*\"]', '2025-07-07 07:04:40', NULL, '2025-07-07 07:02:25', '2025-07-07 07:04:40'),
(6, 'App\\Models\\User', 2, 'api-token', 'd7e8ac26ffa3d6cd834534022a5ca2f4b245f5903b2dd5091c07d03814a72536', '[\"*\"]', '2025-07-07 22:33:03', NULL, '2025-07-07 22:25:52', '2025-07-07 22:33:03'),
(7, 'App\\Models\\User', 2, 'api-token', '3536d3b3b1cc58da191a6d110dae83bcff54d3234791490e0e364a780abf5bcb', '[\"*\"]', NULL, NULL, '2025-07-07 22:33:58', '2025-07-07 22:33:58'),
(8, 'App\\Models\\User', 5, 'api-token', '8f4aee2434b9c909f320ac985a35813bd8eac29b9b5e5a58044ac094c71bf2c1', '[\"*\"]', NULL, NULL, '2025-07-07 22:34:22', '2025-07-07 22:34:22'),
(9, 'App\\Models\\User', 6, 'api-token', '3fd3e44161a3abeb93970e8b92d84dce974a1309943cc556a70e56d693de9e6d', '[\"*\"]', NULL, NULL, '2025-07-07 22:36:30', '2025-07-07 22:36:30'),
(10, 'App\\Models\\User', 2, 'api-token', 'b74c3a212baf89dde9a9809ff723ba4cbb655ac30774f619ad85687f8a76c714', '[\"*\"]', NULL, NULL, '2025-07-07 22:36:49', '2025-07-07 22:36:49'),
(11, 'App\\Models\\User', 2, 'api-token', 'fc6669158193899b454f9f853c2b871c1cc6ecd01da86c1d8aea5a268d32e6f4', '[\"*\"]', NULL, NULL, '2025-07-07 22:38:19', '2025-07-07 22:38:19'),
(12, 'App\\Models\\User', 2, 'api-token', 'ce20a9895a53e59a75da7eb61611386a035770f411c37cd46d89a5ebd5627ff8', '[\"*\"]', '2025-07-08 03:03:58', NULL, '2025-07-07 22:39:14', '2025-07-08 03:03:58'),
(13, 'App\\Models\\User', 7, 'api-token', '6f442419028287fe6dbe6aab2f01221defd9b9b266cc8eebdbd2241eec798cda', '[\"*\"]', NULL, NULL, '2025-07-08 00:54:56', '2025-07-08 00:54:56'),
(14, 'App\\Models\\User', 2, 'api-token', 'e9e4c0f93c3f5ff24bd1a0bc6d28db2c46350ebc1f4715ffa001d3b0150365f5', '[\"*\"]', NULL, NULL, '2025-07-08 00:57:32', '2025-07-08 00:57:32'),
(15, 'App\\Models\\User', 7, 'api-token', '529dc6bed015dfc38c9f5ef94a4de1d1fba3f0427f5dcc7fc46e82ac0c168d6f', '[\"*\"]', '2025-07-08 01:42:13', NULL, '2025-07-08 00:57:53', '2025-07-08 01:42:13'),
(16, 'App\\Models\\User', 7, 'api-token', '6a4f2f44adb14d635bca8b8d96160ecc6e950dacebcc042848e848e6ae5628b0', '[\"*\"]', NULL, NULL, '2025-07-08 01:38:36', '2025-07-08 01:38:36'),
(17, 'App\\Models\\User', 7, 'api-token', '8050e837dc5861db56ceff312c1284aedcea45893c12949c90e1a6af9c24bfcf', '[\"*\"]', '2025-07-08 01:42:44', NULL, '2025-07-08 01:39:43', '2025-07-08 01:42:44'),
(18, 'App\\Models\\User', 2, 'api-token', 'd471b0aaa3677c8977bd6cf7290b0f36650c63964cb8b2b2f6c35df1294a5696', '[\"*\"]', NULL, NULL, '2025-07-08 01:42:08', '2025-07-08 01:42:08'),
(19, 'App\\Models\\User', 1, 'api-token', '5628743f0c5ce5c148d99216c31fe10139b4d0cf92364758a10bfcbc0b0863f6', '[\"*\"]', NULL, NULL, '2025-07-08 01:44:48', '2025-07-08 01:44:48'),
(20, 'App\\Models\\User', 2, 'api-token', 'b5ab6cbdb5a6874868680e7f2cb06375a2a1cdfbc0b84a4425420c4e74ff7410', '[\"*\"]', '2025-07-08 02:01:39', NULL, '2025-07-08 01:47:51', '2025-07-08 02:01:39'),
(21, 'App\\Models\\User', 3, 'api-token', '21c533aea5dcd5f21dbc28e644c2225f80a8be283777b4df4543ac7bee7fb8ee', '[\"*\"]', NULL, NULL, '2025-07-08 01:48:22', '2025-07-08 01:48:22'),
(22, 'App\\Models\\User', 1, 'api-token', 'e47e09c9061ca532f18573a04aefb046f1ba1a60a74d234eff23986cbfcaef56', '[\"*\"]', '2025-07-08 03:05:12', NULL, '2025-07-08 01:49:13', '2025-07-08 03:05:12'),
(23, 'App\\Models\\User', 5, 'api-token', '89ebf911aae396f2b1b2f4d20fec22b13af42185832f34de0c59fa57a1ab3ff8', '[\"*\"]', NULL, NULL, '2025-07-08 03:09:39', '2025-07-08 03:09:39'),
(24, 'App\\Models\\User', 6, 'api-token', '70c015460709a36dedd353e0807eb3ee8102f5321098ec764f43a31929f40562', '[\"*\"]', NULL, NULL, '2025-07-08 03:11:02', '2025-07-08 03:11:02'),
(25, 'App\\Models\\User', 1, 'api-token', '40091bde71ffbd1de50cea14561622605188a7e4352c5351bd4772837fe2e898', '[\"*\"]', NULL, NULL, '2025-07-08 03:12:31', '2025-07-08 03:12:31'),
(26, 'App\\Models\\User', 1, 'api-token', 'f3e9b0acf80dbe88d96d28e8d8959536a541fd5a4f5172530f52883773ddef82', '[\"*\"]', NULL, NULL, '2025-07-08 03:31:09', '2025-07-08 03:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_tenant_id_foreign` (`tenant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `tenant_id`, `created_at`, `updated_at`) VALUES
(1, 'Project 1', 1, '2025-07-08 01:50:32', '2025-07-08 01:51:56'),
(2, 'Project 2', 1, '2025-07-08 01:50:42', '2025-07-08 01:50:42'),
(3, 'Project 3', 1, '2025-07-08 01:50:46', '2025-07-08 01:50:46'),
(4, 'Project 4', 1, '2025-07-08 01:50:50', '2025-07-08 01:50:50'),
(5, 'Project 5', 1, '2025-07-08 01:50:58', '2025-07-08 01:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'api', '2025-07-07 05:16:57', '2025-07-07 05:16:57'),
(2, 'Manager', 'api', '2025-07-07 05:16:57', '2025-07-07 05:16:57'),
(3, 'Member', 'api', '2025-07-07 05:16:57', '2025-07-07 05:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0: open, 1: in progress, 2: closed',
  `deadline` date NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL,
  `assigned_user_id` bigint UNSIGNED DEFAULT NULL,
  `tenant_id` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_assigned_user_id_foreign` (`assigned_user_id`),
  KEY `tasks_tenant_id_foreign` (`tenant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `deadline`, `project_id`, `assigned_user_id`, `tenant_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Task 1', NULL, 0, '2025-07-09', 1, 2, 1, NULL, '2025-07-08 01:52:58', '2025-07-08 01:52:58'),
(2, 'Crud opearation 123', NULL, 0, '2025-07-09', 1, 2, 1, NULL, '2025-07-08 01:53:13', '2025-07-08 01:56:26'),
(7, 'Task 7', NULL, 0, '2025-07-10', 1, 3, 1, NULL, '2025-07-08 03:05:13', '2025-07-08 03:05:13'),
(4, 'Task 4', 'Task 4', 0, '2025-07-10', 1, 3, 1, NULL, '2025-07-08 01:54:32', '2025-07-08 01:54:32'),
(5, 'Task 4', 'Task 5', 0, '2025-07-10', 1, 3, 1, NULL, '2025-07-08 01:54:44', '2025-07-08 01:54:44'),
(6, 'Task 6', NULL, 0, '2025-07-10', 1, 3, 1, NULL, '2025-07-08 01:55:04', '2025-07-08 01:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
CREATE TABLE IF NOT EXISTS `tenants` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tenants_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Konopelski-King', 'konopelski-king', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(2, 'Wuckert LLC', 'wuckert-llc', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(3, 'Heller-Steuber', 'heller-steuber', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(4, 'Lockman-Strosin', 'lockman-strosin', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(5, 'Bergstrom, Rempel and Rolfson', 'bergstrom-rempel-and-rolfson', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(6, 'Moen, Powlowski and Howe', 'moen-powlowski-and-howe', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(7, 'Ward Ltd', 'ward-ltd', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(8, 'Kertzmann and Sons', 'kertzmann-and-sons', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(9, 'Gulgowski-Jakubowski', 'gulgowski-jakubowski', '2025-07-07 22:20:22', '2025-07-07 22:20:22'),
(10, 'Spinka-Pfeffer', 'spinka-pfeffer', '2025-07-07 22:20:22', '2025-07-07 22:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tenant_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_tenant_id_index` (`tenant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `tenant_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hardik Patel', 'admin@gmail.com', NULL, '$2y$12$1F2rE6QJvQ/UDzXQ5N6LKe0Tw0p3T/8YT/hj5hPT8kMALZga07dTe', 1, NULL, '2025-07-08 01:44:48', '2025-07-08 01:44:48'),
(2, 'Kiran Patel', 'kiran@gmail.com', NULL, '$2y$12$gox1KsRiw/b9uf8AJ1JJFuRHhEV2Vh4P5KWuoJHhzuTuWQbLaMjja', 1, NULL, '2025-07-08 01:47:51', '2025-07-08 01:47:51'),
(3, 'Devanshi Patel', 'devanshi@gmail.com', NULL, '$2y$12$9.zw9twUvU17vdZUYKF.jOR6AlayDhnvxyisB9MQfwlNAU9BrHky.', 1, NULL, '2025-07-08 01:48:22', '2025-07-08 01:48:22'),
(4, 'Kamlesh Patel', 'kamlesh@gmail.com', NULL, '$2y$12$dkPduwVC0naaeCcouXEIsev1Ul7JPk3Df.4tFpR8s0SX2qkvDOJu2', 1, NULL, '2025-07-08 03:08:36', '2025-07-08 03:08:36'),
(5, 'Vinay Patel', 'vinay@gmail.com', NULL, '$2y$12$/K8WachUbqvypDrZPIVNMeihq1RxdPjIb0F59.ZarIbLKOoU/wL86', 1, NULL, '2025-07-08 03:09:39', '2025-07-08 03:09:39'),
(6, 'Rakesh Patel', 'rakesh@gmail.com', NULL, '$2y$12$Eyk0b62XzbPXP6fOOmbiFuk6F4lOQHzQgQZ018fePssRg99OzW0Ym', 2, NULL, '2025-07-08 03:11:02', '2025-07-08 03:11:02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
