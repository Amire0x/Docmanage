-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.12 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 docmanage.approve_log 结构

-- 正在导出表  docmanage.approve_log 的数据：11 rows
/*!40000 ALTER TABLE `approve_log` DISABLE KEYS */;

INSERT INTO `approve_log` (`id`, `fileno`, `filename`, `owner`, `add_time`, `isapprove`, `approve_time`, `approve_person`) VALUES
	(1, '20220410212017717', '测试文档一.docx', 'AMIRE0X', '2022-04-10 13:20:17.717517', '1', '2022-04-11 09:02:12.215187', NULL),
	(2, '20220410221330563', '2.txt', 'AMIRE0X', '2022-04-10 14:13:30.563310', '1', '2022-04-11 09:05:53.784129', NULL),
	(3, '20220410221330563', '2.txt', 'AMIRE0X', '2022-04-10 14:13:30.563310', '0', '2022-04-11 09:14:25.544214', NULL),
	(4, '20220410221330563', '2.txt', 'AMIRE0X', '2022-04-10 14:13:30.563310', '1', '2022-04-11 09:17:33.558128', NULL),
	(5, '20220410220623034', '1.txt', 'AMIRE0X', '2022-04-10 14:06:23.034830', '2', '2022-04-11 09:17:43.774900', NULL),
	(6, '20220412202910521', 'test.txt', 'ZHANGSAN', '2022-04-12 12:29:10.521513', '1', '2022-04-12 12:33:57.507437', NULL),
	(7, '20220412153741838', '3.txt', 'AMIRE0X', '2022-04-12 07:37:41.838393', '2', '2022-04-12 13:05:09.851389', NULL),
	(8, '20220412131646607', '2.txt', 'AMIRE0X', '2022-04-12 05:16:46.607495', '2', '2022-04-12 13:07:37.848570', NULL),
	(9, '20220413111130687', 'test5.txt', 'ZHANGSAN', '2022-04-13 03:11:30.687967', '1', '2022-04-13 03:15:30.057513', NULL),
	(10, '20220413185710597', '3.txt', 'ZHANGSAN', '2022-04-13 10:57:10.597410', '1', '2022-04-13 10:59:29.484159', NULL),
	(11, '20220413185710597', '3.txt', 'ZHANGSAN', '2022-04-13 10:57:10.597410', '2', '2022-04-13 10:59:36.070164', NULL),
	(12, '20220412153757693', '5.txt', 'AMIRE0X', '2022-04-12 07:37:57.693739', '0', '2022-04-30 03:32:26.860207', 'Amire0x'),
	(13, '20220412210415149', 'test3.txt', 'LISI', '2022-04-12 13:04:15.149879', '1', '2022-04-30 03:32:44.385404', 'Amire0x');
/*!40000 ALTER TABLE `approve_log` ENABLE KEYS */;

-- 导出  表 docmanage.auth_group 结构

-- 正在导出表  docmanage.auth_group 的数据：0 rows
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- 导出  表 docmanage.auth_group_permissions 结构


-- 正在导出表  docmanage.auth_group_permissions 的数据：0 rows
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- 导出  表 docmanage.auth_permission 结构
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.auth_permission 的数据：40 rows
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add user', 7, 'add_user'),
	(26, 'Can change user', 7, 'change_user'),
	(27, 'Can delete user', 7, 'delete_user'),
	(28, 'Can view user', 7, 'view_user'),
	(29, 'Can add user operate log', 8, 'add_useroperatelog'),
	(30, 'Can change user operate log', 8, 'change_useroperatelog'),
	(31, 'Can delete user operate log', 8, 'delete_useroperatelog'),
	(32, 'Can view user operate log', 8, 'view_useroperatelog'),
	(33, 'Can add approve_log', 9, 'add_approvelog'),
	(34, 'Can change approve_log', 9, 'change_approvelog'),
	(35, 'Can delete approve_log', 9, 'delete_approvelog'),
	(36, 'Can view approve_log', 9, 'view_approvelog'),
	(37, 'Can add file', 10, 'add_file'),
	(38, 'Can change file', 10, 'change_file'),
	(39, 'Can delete file', 10, 'delete_file'),
	(40, 'Can view file', 10, 'view_file');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- 导出  表 docmanage.auth_user 结构
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.auth_user 的数据：0 rows
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- 导出  表 docmanage.auth_user_groups 结构
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.auth_user_groups 的数据：0 rows
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- 导出  表 docmanage.auth_user_user_permissions 结构
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.auth_user_user_permissions 的数据：0 rows
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- 导出  表 docmanage.django_admin_log 结构
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.django_admin_log 的数据：0 rows
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- 导出  表 docmanage.django_content_type 结构
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.django_content_type 的数据：10 rows
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'permission'),
	(3, 'auth', 'group'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'admin_manage', 'user'),
	(8, 'admin_manage', 'useroperatelog'),
	(9, 'file_manage', 'approvelog'),
	(10, 'file_manage', 'file');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- 导出  表 docmanage.django_migrations 结构
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.django_migrations 的数据：19 rows
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-04-09 10:22:04.305840'),
	(2, 'auth', '0001_initial', '2022-04-09 10:22:04.861398'),
	(3, 'admin', '0001_initial', '2022-04-09 10:22:10.389746'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-09 10:22:11.420975'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-09 10:22:11.470805'),
	(6, 'admin_manage', '0001_initial', '2022-04-09 10:22:11.646728'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2022-04-09 10:22:12.124448'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2022-04-09 10:22:12.371143'),
	(9, 'auth', '0003_alter_user_email_max_length', '2022-04-09 10:22:12.710774'),
	(10, 'auth', '0004_alter_user_username_opts', '2022-04-09 10:22:12.758151'),
	(11, 'auth', '0005_alter_user_last_login_null', '2022-04-09 10:22:13.057563'),
	(12, 'auth', '0006_require_contenttypes_0002', '2022-04-09 10:22:13.085002'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2022-04-09 10:22:13.131068'),
	(14, 'auth', '0008_alter_user_username_max_length', '2022-04-09 10:22:13.360010'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2022-04-09 10:22:13.667824'),
	(16, 'auth', '0010_alter_group_name_max_length', '2022-04-09 10:22:14.800913'),
	(17, 'auth', '0011_update_proxy_permissions', '2022-04-09 10:22:14.859231'),
	(18, 'sessions', '0001_initial', '2022-04-09 10:22:15.049600'),
	(20, 'file_manage', '0001_initial', '2022-04-09 15:41:55.419450');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- 导出  表 docmanage.django_session 结构
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.django_session 的数据：7 rows
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('9etneej9an19ypmczitbj53ggp0pxf7j', 'MmY3N2E3NmQ2MmM1M2Y3YjcxYWZkNDJjNGJhNGY0YTgxNDY1ZjdhNDp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMDQ6NTQ6MTAifX0=', '2022-04-23 10:40:39.179531'),
	('tvv6t61ro8gfbpchuq4ezpdypkmzw76o', 'ZjQyZWIxMGUwZjBmODliOGIwMWM1NTQ3ZGY4Y2ZhNWI2NmNjZGY5YTp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjEsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-04-23 15:10:19.656652'),
	('vzxnrqqkrvzhs3vrwbrk9dku831ctdcv', 'YmE4YmY1MDA1MzUyMTIzYTliN2E4MTgyYzg2N2NlYmQ5ZmQ2ODg4Yzp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-04-24 02:53:46.556176'),
	('vhg03j1188uggh2si9lrjco74wpd0w2i', 'YmE4YmY1MDA1MzUyMTIzYTliN2E4MTgyYzg2N2NlYmQ5ZmQ2ODg4Yzp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-04-24 03:05:55.901493'),
	('8cqg4kbivl9qmll92nijy3eqkv8joopi', 'YmE4YmY1MDA1MzUyMTIzYTliN2E4MTgyYzg2N2NlYmQ5ZmQ2ODg4Yzp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-04-24 03:10:44.408431'),
	('ou48zi4z2wsifhhrdkxt1xifzy0q9z1u', 'YmE4YmY1MDA1MzUyMTIzYTliN2E4MTgyYzg2N2NlYmQ5ZmQ2ODg4Yzp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-04-24 03:32:02.784434'),
	('64gatimwxlawnbsjsz1gdivlipnqgkct', 'YmE4YmY1MDA1MzUyMTIzYTliN2E4MTgyYzg2N2NlYmQ5ZmQ2ODg4Yzp7ImFkbWludXNlciI6eyJpZCI6MTUsInVzZXJuYW1lIjoiQW1pcmUweCIsIm5pY2tuYW1lIjoiXHU1ZTA1XHU1ZTA1IiwicGFzc3dvcmRfaGFzaCI6Ijc5ZjI3ZDRhMGI5MjI3ZDc4MGM1YmMzM2MwYjcyNzRlIiwicGFzc3dvcmRfc2FsdCI6IjM3NDA4OCIsImRlcGFydG1lbnQiOjMsInN0YXR1cyI6MSwiY3JlYXRlX2F0IjoiMjAyMi0wNC0wOSAwMzoyMzoxMSIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMDkgMTQ6NDg6MzEifX0=', '2022-05-14 03:27:32.081045');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- 导出  表 docmanage.file 结构
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileno` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `filepath` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `file_hash` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isapprove` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.file 的数据：12 rows
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`id`, `fileno`, `filename`, `filepath`, `owner`, `add_time`, `file_hash`, `isapprove`, `status`) VALUES
	(20, '20220412210346717', 'test.txt', 'static/uploads\\LISI\\2022\\4\\12', 'LISI', '2022-04-12 13:03:46.717194', '2cd83291533322c969cc9336a4c52ca8', '1', 0),
	(12, '20220412153757693', '5.txt', 'static/uploads\\AMIRE0X\\2022\\4\\12', 'AMIRE0X', '2022-04-12 07:37:57.693739', '5018fd2e2e4acd71024e1bef581a1417', '0', 1),
	(11, '20220412153752918', '4.txt', 'static/uploads\\AMIRE0X\\2022\\4\\12', 'AMIRE0X', '2022-04-12 07:37:52.918851', '99a7e182cc3f7ebbb9b173a47daaabb4', '0', 0),
	(10, '20220412153741838', '3.txt', 'static/uploads\\AMIRE0X\\2022\\4\\12', 'AMIRE0X', '2022-04-12 07:37:41.838393', '2cd83291533322c969cc9336a4c52ca8', '2', 0),
	(9, '20220412131646607', '2.txt', 'static/uploads\\AMIRE0X\\2022\\4\\12', 'AMIRE0X', '2022-04-12 05:16:46.607495', 'e1de2e27f90ffda6aa064b3ec54bd0ac', '2', 0),
	(8, '20220412110002460', '1.txt', 'static/uploads\\AMIRE0X\\2022\\4\\12', 'AMIRE0X', '2022-04-12 03:00:02.460425', 'e5c6c220e39b7a70a0c77b7a48c6bbf1', '0', 0),
	(19, '20220412210330738', '3.txt', 'static/uploads\\LISI\\2022\\4\\12', 'LISI', '2022-04-12 13:03:30.738410', '2cd83291533322c969cc9336a4c52ca8', '0', 1),
	(21, '20220412210415149', 'test3.txt', 'static/uploads\\LISI\\2022\\4\\12', 'LISI', '2022-04-12 13:04:15.149879', '3251e42693d689c095fd407eabe73f6f', '1', 0),
	(22, '20220413111130687', 'test5.txt', 'static/uploads\\ZHANGSAN\\2022\\4\\13', 'ZHANGSAN', '2022-04-13 03:11:30.687967', 'f1afd0cd695b1be740d5d3d431e58791', '1', 1),
	(23, '20220413185710597', '3.txt', 'static/uploads\\ZHANGSAN\\2022\\4\\13', 'ZHANGSAN', '2022-04-13 10:57:10.597410', '2cd83291533322c969cc9336a4c52ca8', '2', 1),
	(41, '20220416190320271', '1.txt', 'static/uploads\\AMIRE0X\\2022\\4\\16', 'AMIRE0X', '2022-04-16 11:03:20.271858', 'b1c35479d51fa672b4c503b8c73b8174', '0', 0),
	(40, '20220416162225976', '1.docx', 'static/uploads\\AMIRE0X\\2022\\4\\16', 'AMIRE0X', '2022-04-16 08:22:25.976067', '7aea287ce6dddac7952cd690e0977542', '0', 0);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;

-- 导出  表 docmanage.operate_log 结构
CREATE TABLE IF NOT EXISTS `operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `do_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(11) NOT NULL,
  `fileno` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.operate_log 的数据：9 rows
/*!40000 ALTER TABLE `operate_log` DISABLE KEYS */;
INSERT INTO `operate_log` (`id`, `username`, `nickname`, `do_type`, `department`, `fileno`, `filename`, `modify_time`) VALUES
	(132, 'Amire0x', '帅帅', '下载', 3, '20220416161549381', '1.txt', '2022-04-16 10:37:14.502716'),
	(133, 'Amire0x', '帅帅', '下载', 3, '20220416161549381', '1.txt', '2022-04-16 10:41:52.343219'),
	(134, 'Amire0x', '帅帅', '下载', 3, '20220416161549381', '1.txt', '2022-04-16 10:47:39.540215'),
	(135, 'Amire0x', '帅帅', '下载', 3, '20220416161549381', '1.txt', '2022-04-16 10:50:54.931778'),
	(136, 'Amire0x', '帅帅', '下载', 3, '20220416161549381', '1.txt', '2022-04-16 10:52:15.236946'),
	(137, 'AMIRE0X', '帅帅', '上传', 3, '20220416190320271', '1.txt', '2022-04-16 11:03:20.318587'),
	(138, 'Amire0x', '帅帅', '下载', 3, '20220416190320271', '1.txt', '2022-04-16 11:03:38.848690'),
	(139, 'Amire0x', '帅帅', '下载', 3, '20220416190320271', '1.txt', '2022-04-16 11:05:47.504843'),
	(140, 'Amire0x', '帅帅', '下载', 3, '20220416162225976', '1.docx', '2022-04-16 11:09:27.209483');
/*!40000 ALTER TABLE `operate_log` ENABLE KEYS */;

-- 导出  表 docmanage.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `department` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在导出表  docmanage.user 的数据：6 rows
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `nickname`, `password_hash`, `password_salt`, `department`, `status`, `create_at`, `update_at`) VALUES
	(1, 'zhangsan', '张三', '1e191d851b3b49a248f4ea62f6b06410', '123456', 1, 1, '2020-07-08 18:18:18.000000', '2022-04-10 02:39:24.000000'),
	(17, 'zhaomin', '赵敏', '83846ac2e355d485f1eb25e288756c92', '567846', 1, 2, '2022-04-12 13:18:23.000000', '2022-04-12 13:22:42.000000'),
	(16, 'lisi', '李四', '449679502e467826daf3cc3cabcfb822', '259785', 2, 1, '2022-04-12 07:20:01.000000', '2022-04-12 07:20:10.000000'),
	(4, 'zhangwuji', '张无忌', 'cbb748964d243e38f032b78886db824c', '437809', 1, 9, '2020-02-18 09:06:54.000000', '2020-01-14 03:36:25.000000'),
	(18, 'zhaowu', '赵武', '1aa651e30d975752f8c4746c57fa94c6', '332515', 1, 9, '2022-04-13 10:56:04.000000', '2022-04-13 10:56:27.000000'),
	(15, 'Amire0x', '帅帅', '79f27d4a0b9227d780c5bc33c0b7274e', '374088', 3, 1, '2022-04-09 03:23:11.000000', '2022-04-09 14:48:31.000000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
