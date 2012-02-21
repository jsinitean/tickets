DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_admin_users_on_username` (`username`)
);
INSERT INTO `admin_users` VALUES (1,'Kevin','Skoglund','kevin@nowhere.com','0b2113e8bb7d94ac9a2c63918d1cb85d0d9e4ba8','2010-09-26 13:56:25','2010-10-04 16:50:59','kskoglund','347dbace3a94ce62d9e8d1bfc5168bec9feeecb8');

DROP TABLE IF EXISTS `admin_users_pages`;
CREATE TABLE `admin_users_pages` (
  `admin_user_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  KEY `index_admin_users_pages_on_admin_user_id_and_page_id` (`admin_user_id`,`page_id`)
);
INSERT INTO `admin_users_pages` VALUES (1,2);

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_on_subject_id` (`subject_id`),
  KEY `index_pages_on_permalink` (`permalink`)
);
INSERT INTO `pages` VALUES (2,1,'First Page','first',1,1,'2010-10-06 18:25:08','2010-10-04 21:18:05'),(3,NULL,'Second Page','second',2,0,'2010-10-06 18:26:09','2010-10-02 17:16:18'),(5,2,'Revised First Page','rfirst',1,1,'2010-10-04 19:29:53','2010-10-04 19:29:53'),(6,1,'Second page','second_page',2,1,'2010-10-04 20:05:53','2010-10-04 20:06:05');

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
);
INSERT INTO `schema_migrations` VALUES ('20100423211100'),('20100423211421'),('20100423214919'),('20100423232138'),('20100423232147'),('20100423232154'),('20100426135018'),('20100426145232');

DROP TABLE IF EXISTS `section_edits`;
CREATE TABLE `section_edits` (
  `id` int(11) NOT NULL,
  `admin_user_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_section_edits_on_admin_user_id_and_section_id` (`admin_user_id`,`section_id`)
);
INSERT INTO `section_edits` VALUES (1,1,1,'Test edit','2010-09-26 14:58:42','2010-09-26 14:59:09'),(2,1,1,'Ch-ch-ch-changes','2010-09-26 15:01:31','2010-09-26 15:01:31');

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `content_type` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sections_on_page_id` (`page_id`)
);
INSERT INTO `sections` VALUES (1,2,'Section One',1,1,'text','This is sample content.','2010-09-26 14:57:35','2010-10-02 17:16:36'),(2,2,'Section Two',2,1,'text','Another section of text.','2010-10-04 20:07:15','2010-10-04 20:07:15');

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `subjects` VALUES (1,'Initial Subject',2,1,'2010-09-29 20:51:00','2010-10-04 19:59:09'),(2,'Revised Subject',1,1,'2010-09-29 20:54:16','2010-10-04 19:59:09'),(4,'Third Subject',3,0,'2010-09-30 14:31:00','2010-10-04 19:05:54');
