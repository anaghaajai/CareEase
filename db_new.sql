/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.32-MariaDB : Database - paliative
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`paliative` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `paliative`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add booking',7,'add_booking'),
(26,'Can change booking',7,'change_booking'),
(27,'Can delete booking',7,'delete_booking'),
(28,'Can view booking',7,'view_booking'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add medicine',9,'add_medicine'),
(34,'Can change medicine',9,'change_medicine'),
(35,'Can delete medicine',9,'delete_medicine'),
(36,'Can view medicine',9,'view_medicine'),
(37,'Can add question_table',10,'add_question_table'),
(38,'Can change question_table',10,'change_question_table'),
(39,'Can delete question_table',10,'delete_question_table'),
(40,'Can view question_table',10,'view_question_table'),
(41,'Can add symptoms',11,'add_symptoms'),
(42,'Can change symptoms',11,'change_symptoms'),
(43,'Can delete symptoms',11,'delete_symptoms'),
(44,'Can view symptoms',11,'view_symptoms'),
(45,'Can add doctor',12,'add_doctor'),
(46,'Can change doctor',12,'change_doctor'),
(47,'Can delete doctor',12,'delete_doctor'),
(48,'Can view doctor',12,'view_doctor'),
(49,'Can add chat',13,'add_chat'),
(50,'Can change chat',13,'change_chat'),
(51,'Can delete chat',13,'delete_chat'),
(52,'Can view chat',13,'view_chat'),
(53,'Can add prescription',14,'add_prescription'),
(54,'Can change prescription',14,'change_prescription'),
(55,'Can delete prescription',14,'delete_prescription'),
(56,'Can view prescription',14,'view_prescription'),
(57,'Can add schedule',15,'add_schedule'),
(58,'Can change schedule',15,'change_schedule'),
(59,'Can delete schedule',15,'delete_schedule'),
(60,'Can view schedule',15,'view_schedule'),
(61,'Can add symptom_option',16,'add_symptom_option'),
(62,'Can change symptom_option',16,'change_symptom_option'),
(63,'Can delete symptom_option',16,'delete_symptom_option'),
(64,'Can view symptom_option',16,'view_symptom_option'),
(65,'Can add user',17,'add_user'),
(66,'Can change user',17,'change_user'),
(67,'Can delete user',17,'delete_user'),
(68,'Can view user',17,'view_user'),
(69,'Can add symptom_logs',18,'add_symptom_logs'),
(70,'Can change symptom_logs',18,'change_symptom_logs'),
(71,'Can delete symptom_logs',18,'delete_symptom_logs'),
(72,'Can view symptom_logs',18,'view_symptom_logs'),
(73,'Can add items',19,'add_items'),
(74,'Can change items',19,'change_items'),
(75,'Can delete items',19,'delete_items'),
(76,'Can view items',19,'view_items'),
(77,'Can add item_request',20,'add_item_request'),
(78,'Can change item_request',20,'change_item_request'),
(79,'Can delete item_request',20,'delete_item_request'),
(80,'Can view item_request',20,'view_item_request'),
(81,'Can add volunteer',21,'add_volunteer'),
(82,'Can change volunteer',21,'change_volunteer'),
(83,'Can delete volunteer',21,'delete_volunteer'),
(84,'Can view volunteer',21,'view_volunteer'),
(85,'Can add volunteer_request',22,'add_volunteer_request'),
(86,'Can change volunteer_request',22,'change_volunteer_request'),
(87,'Can delete volunteer_request',22,'delete_volunteer_request'),
(88,'Can view volunteer_request',22,'view_volunteer_request'),
(89,'Can add request_alloc',23,'add_request_alloc'),
(90,'Can change request_alloc',23,'change_request_alloc'),
(91,'Can delete request_alloc',23,'delete_request_alloc'),
(92,'Can view request_alloc',23,'view_request_alloc'),
(93,'Can add posts',24,'add_posts'),
(94,'Can change posts',24,'change_posts'),
(95,'Can delete posts',24,'delete_posts'),
(96,'Can view posts',24,'view_posts'),
(97,'Can add comments',25,'add_comments'),
(98,'Can change comments',25,'change_comments'),
(99,'Can delete comments',25,'delete_comments'),
(100,'Can view comments',25,'view_comments'),
(101,'Can add suggestions',26,'add_suggestions'),
(102,'Can change suggestions',26,'change_suggestions'),
(103,'Can delete suggestions',26,'delete_suggestions'),
(104,'Can view suggestions',26,'view_suggestions'),
(105,'Can add nutrients_list',27,'add_nutrients_list'),
(106,'Can change nutrients_list',27,'change_nutrients_list'),
(107,'Can delete nutrients_list',27,'delete_nutrients_list'),
(108,'Can view nutrients_list',27,'view_nutrients_list');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'myapp','booking'),
(13,'myapp','chat'),
(25,'myapp','comments'),
(12,'myapp','doctor'),
(19,'myapp','items'),
(20,'myapp','item_request'),
(8,'myapp','login'),
(9,'myapp','medicine'),
(27,'myapp','nutrients_list'),
(24,'myapp','posts'),
(14,'myapp','prescription'),
(10,'myapp','question_table'),
(23,'myapp','request_alloc'),
(15,'myapp','schedule'),
(26,'myapp','suggestions'),
(11,'myapp','symptoms'),
(18,'myapp','symptom_logs'),
(16,'myapp','symptom_option'),
(17,'myapp','user'),
(21,'myapp','volunteer'),
(22,'myapp','volunteer_request'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-11 08:57:44.939409'),
(2,'auth','0001_initial','2024-03-11 08:57:45.242114'),
(3,'admin','0001_initial','2024-03-11 08:57:45.331655'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-11 08:57:45.339164'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-11 08:57:45.346163'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-11 08:57:45.396184'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-11 08:57:45.448310'),
(8,'auth','0003_alter_user_email_max_length','2024-03-11 08:57:45.460312'),
(9,'auth','0004_alter_user_username_opts','2024-03-11 08:57:45.466312'),
(10,'auth','0005_alter_user_last_login_null','2024-03-11 08:57:45.503328'),
(11,'auth','0006_require_contenttypes_0002','2024-03-11 08:57:45.506168'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-11 08:57:45.515038'),
(13,'auth','0008_alter_user_username_max_length','2024-03-11 08:57:45.529777'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-11 08:57:45.543259'),
(15,'auth','0010_alter_group_name_max_length','2024-03-11 08:57:45.557259'),
(16,'auth','0011_update_proxy_permissions','2024-03-11 08:57:45.569258'),
(17,'auth','0012_alter_user_first_name_max_length','2024-03-11 08:57:45.583257'),
(18,'myapp','0001_initial','2024-03-11 08:57:46.400245'),
(19,'sessions','0001_initial','2024-03-11 08:57:46.418246'),
(20,'myapp','0002_alter_question_table_answer_and_more','2024-03-11 09:04:55.951017'),
(21,'myapp','0003_posts_comments','2024-03-13 04:24:31.231006'),
(22,'myapp','0004_alter_comments_date_alter_posts_date','2024-03-13 04:25:17.206473'),
(23,'myapp','0005_alter_schedule_to_time','2024-03-15 06:46:44.667823'),
(24,'myapp','0006_alter_posts_title','2024-03-15 07:25:47.940900'),
(25,'myapp','0007_suggestions','2024-04-11 03:57:28.787450'),
(26,'myapp','0008_booking_token','2024-04-11 10:16:21.429091'),
(27,'myapp','0009_nutrients_list','2024-05-04 05:05:17.324675');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('0aq3gd7q9rzve5ryw1r3i7mwjruh594m','eyJsaWQiOjE0LCJ1bmFtZSI6IlJhamVzaCBSIn0:1s39qE:fRHJMfGQbzZl1WP1Sk-KaavGO5jPDInRHYvGReGadDE','2024-05-18 07:29:54.149753'),
('4imrrv2dusy4r9lrdkyazmaazpzgq4qe','eyJsaWQiOjEsInVuYW1lIjoic29uYSIsImRvY2lkIjoiMyJ9:1s0bBA:qw1URhwu4dmDtjNjr16blUZ86g1ZfNCbcqBu96-TxYY','2024-05-11 06:04:56.317620'),
('4wcylrp0wd2xoe66r4dzggv11qmh3tl0','eyJsaWQiOjExLCJ1bmFtZSI6IlBvb2phIFN1cmVzaCJ9:1rv7iy:8LJ8HDuIOpDuy0NbUDAIZjA5HOdLTpBciJLZDc5dWTA','2024-04-26 03:37:12.583995'),
('68wmp01p1p13hdn5et4r1m1q4twrq1la','eyJsaWQiOjgsInVuYW1lIjoiU29uYSIsImRvY2lkIjoiMiJ9:1rl2d8:JBNQY1V7niGRzj0F3qI07nkaqvqFxFU-0I7EJx7NxYo','2024-03-29 08:09:30.336051'),
('6u8beifbn618tohmmeucgambadjfxr83','eyJsaWQiOjEsInVuYW1lIjoic29uYSJ9:1rv83W:UFoH9fh9LCwsvmK4g-V-JLR6a0simMPznNazje7zrmA','2024-04-26 03:58:26.402100'),
('7cwmccetumu5sq01prxloic9drh8kykw','eyJsaWQiOjEzLCJ1bmFtZSI6Ik5hbmRhbmEgS3Jpc2huYW4ifQ:1rsGBf:XAVzeIZTk0-Okg2ga_2v_YgWFDU0P9KMPywWbCnrD1o','2024-04-18 06:02:59.590566'),
('fr1xribuyecpcdnehc5dsri7myxskmjd','eyJsaWQiOjMsInVuYW1lIjoic2FuYSJ9:1rpQlU:rHY6yf9u1Pk2x_d9hqAFCgBGlkC-QdjQ2mQHu-ZFdtY','2024-04-10 10:44:16.960107'),
('gm0j7scqif5z9vx0dn7bwodb7xvpnd7r','.eJyrVsrJTFGyMjTQUSrNS8xNVbJS8kvMS0nMS1TSUSoCSSmZAFkp-clgtiGQnZSfnw3l1AIASbcR4A:1rl1e3:DdHyU2p2lH_Q8dsmcdXtnwFV_qL6O5VzWfBgUHNJJNY','2024-03-29 07:06:23.577679'),
('hiy2xi74lu90lwnrxz9kpjokc5g1vfr4','eyJsaWQiOjEsInVuYW1lIjoic29uYSIsInJpZCI6IjMifQ:1rqqZR:TWjpuunQeQPWTVmbq_qasd20tlJf7Qg6Igz6rJlaTtQ','2024-04-14 08:29:41.562962'),
('tzjxgstk87sl5evpid459zln590bp785','eyJsaWQiOjEsInVuYW1lIjoic29uYSIsImJvb2tpZCI6IjMiLCJkb2NpZCI6IjMifQ:1rv8zm:UlN_rTvk3qTYgcurBhYPu43mITQKgCLA6zLOZIrvtuA','2024-04-26 04:58:38.057133'),
('vr4p8ldjcrwgzr1blb7zgw4x1stmyrf0','eyJsaWQiOjMsInVuYW1lIjoic2FuYSIsImRvY2lkIjoiMSJ9:1rjsi5:x_Vav0UBd9f1_wc4whA9TMFNA9XdHAyytzK5KdPmMMA','2024-03-26 03:21:49.171396'),
('w9pxrzqs8ft23w2waul15m2nrd4udzv8','eyJsaWQiOjEzLCJ1bmFtZSI6IkthcnRoaWthIn0:1s39Jy:Mw02d67rT-TON_XG4lZWT9qTK_KypZwq-JYqN1OHa9Q','2024-05-18 06:56:34.304496'),
('zbb0b6ghq6zv1vfth8k1tznrk2sbikfp','.eJyrVsrJTFGyMjTUUSrNS8xNVbJScspJLS6uVNJRSslPBskpGQLZSfn52WCOEZBTBGaZKdUCAECmEaU:1rsxWT:DhhZ9u1zw-3Jv9A_B4ajn_zcD2P-qx0R_3-JJ3rZizk','2024-04-20 04:19:21.486910');

/*Table structure for table `myapp_booking` */

DROP TABLE IF EXISTS `myapp_booking`;

CREATE TABLE `myapp_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) NOT NULL,
  `SCHEDULE_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  `token` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_booking_SCHEDULE_id_8020ae27_fk_myapp_schedule_id` (`SCHEDULE_id`),
  KEY `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_booking_SCHEDULE_id_8020ae27_fk_myapp_schedule_id` FOREIGN KEY (`SCHEDULE_id`) REFERENCES `myapp_schedule` (`id`),
  CONSTRAINT `myapp_booking_USER_id_ae15cfb2_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_booking` */

insert  into `myapp_booking`(`id`,`date`,`SCHEDULE_id`,`USER_id`,`token`) values 
(1,'2024-03-15',2,3,1),
(2,'2024-04-04',4,4,1),
(3,'2024-04-06',1,4,1),
(4,'2024-04-12',2,4,2),
(5,'2024-04-12',5,4,1),
(6,'2024-04-12',5,3,2),
(7,'2024-04-12',1,1,2),
(8,'2024-04-27',4,1,2);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(300) NOT NULL,
  `type` varchar(50) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_chat_LOGIN_id_e38b1a93_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_chat_LOGIN_id_e38b1a93_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_chat` */

insert  into `myapp_chat`(`id`,`message`,`type`,`LOGIN_id`) values 
(33,' lifestyle changes can help prevent heart disease?','user',13),
(34,' Lifestyle changes such as adopting a healthy diet low in saturated and trans fats, exercising regularly, maintaining a healthy weight, quitting smoking, limiting alcohol intake, managing stress, and getting regular medical check-ups can help prevent heart disease.','chatbot',13),
(35,'what depression symptoms ?','user',13),
(36,'Symptoms of depression can include persistent sadness, loss of interest or pleasure in activities, changes in appetite or weight, sleep disturbances, fatigue, feelings of worthlessness or guilt, difficulty concentrating, and thoughts of death or suicide.','chatbot',13),
(37,'Is depression genetic ?','user',13),
(38,'Yes, sometimes depression can run in families. But remember, it\'s just one factor among many. Treatment and support are available, and many people find relief with the right help.','chatbot',13),
(39,'Can depression be cured ?','user',13),
(40,'Yes, depression can be treated and managed effectively with therapy, medication, and support. Many people find relief and lead fulfilling lives with the right help. You\'re not alone, and there is hope for feeling better.','chatbot',13),
(41,'Have sleeping problmes','user',13),
(42,'Depression shows signs like persistent sadness, loss of interest, changes in appetite or sleep, fatigue, difficulty concentrating, and thoughts of death. If you\'re feeling this way, it\'s essential to seek support','chatbot',13),
(43,'Have trouble sleeping any advise ?','user',13),
(44,' Stick to a regular sleep schedule.\nCreate a relaxing bedtime routine.\nMake your sleep environment comfortable.\nLimit screen time before bed.\nAvoid caffeine, nicotine, and alcohol before bedtime.','chatbot',13),
(45,'How can I improve my sleep ?','user',13),
(46,'You can improve your sleep by creating a bedtime routine, avoiding screen time before bed and by creating a comfortable sleep environemnt.','chatbot',13),
(47,'How can I improve my sleep ?','user',11),
(48,'You can improve your sleep by creating a bedtime routine, avoiding screen time before bed and by creating a comfortable sleep environemnt.','chatbot',11),
(49,'Medicine for depression ?','user',11),
(50,'Medication for depression, prescribed by a doctor, can help manage symptoms and improve well-being. It\'s important to work closely with a healthcare professional to find the right treatment plan for you.','chatbot',11),
(51,'Depression genetic ?','user',11),
(52,'Yes, sometimes depression can run in families. But remember, it\'s just one factor among many. Treatment and support are available, and many people find relief with the right help.','chatbot',11);

/*Table structure for table `myapp_comments` */

DROP TABLE IF EXISTS `myapp_comments`;

CREATE TABLE `myapp_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `comment` varchar(500) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  `POSTS_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_comments_USER_id_cbafbbed_fk_myapp_user_id` (`USER_id`),
  KEY `myapp_comments_POSTS_id_cce284f8_fk_myapp_posts_id` (`POSTS_id`),
  CONSTRAINT `myapp_comments_POSTS_id_cce284f8_fk_myapp_posts_id` FOREIGN KEY (`POSTS_id`) REFERENCES `myapp_posts` (`id`),
  CONSTRAINT `myapp_comments_USER_id_cbafbbed_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_comments` */

insert  into `myapp_comments`(`id`,`date`,`comment`,`USER_id`,`POSTS_id`) values 
(1,'2024-03-05','Good pic',1,1),
(2,'2024-03-13','too bad',2,1),
(3,'2024-03-15','it was helpful',3,1),
(4,'2024-04-04','Some general signs and symptoms of cancer are fever, fatigue, pain, skin changes, sores that dont heal, unusual bleeding or discharge etc.',4,2);

/*Table structure for table `myapp_doctor` */

DROP TABLE IF EXISTS `myapp_doctor`;

CREATE TABLE `myapp_doctor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `specialization` varchar(200) NOT NULL,
  `experience` varchar(200) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_doctor_LOGIN_id_07e43244_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_doctor_LOGIN_id_07e43244_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_doctor` */

insert  into `myapp_doctor`(`id`,`name`,`email`,`phone`,`specialization`,`experience`,`LOGIN_id`) values 
(1,' Dr Sona','drsona@gmail.com',6675678987,'Cardiology','5 years',9),
(2,'Dr Govind K','drgovind@gmail.com',7755667733,'Cardiology','4',10),
(3,'Dr Sneha Das','sneha@gmail.com',9134975432,'Cardiology','5',12);

/*Table structure for table `myapp_item_request` */

DROP TABLE IF EXISTS `myapp_item_request`;

CREATE TABLE `myapp_item_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `ITEM_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_item_request_ITEM_id_6b3e5742_fk_myapp_items_id` (`ITEM_id`),
  KEY `myapp_item_request_USER_id_a8f2fa4a_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_item_request_ITEM_id_6b3e5742_fk_myapp_items_id` FOREIGN KEY (`ITEM_id`) REFERENCES `myapp_items` (`id`),
  CONSTRAINT `myapp_item_request_USER_id_a8f2fa4a_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_item_request` */

insert  into `myapp_item_request`(`id`,`status`,`ITEM_id`,`USER_id`) values 
(2,'pending',3,2),
(5,'Approved',6,3),
(6,'pending',3,4);

/*Table structure for table `myapp_items` */

DROP TABLE IF EXISTS `myapp_items`;

CREATE TABLE `myapp_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_items_USER_id_53046701_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_items_USER_id_53046701_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_items` */

insert  into `myapp_items`(`id`,`title`,`description`,`image`,`status`,`USER_id`) values 
(3,'wheelchair ','support system for patients ','/media/20240229-212852.png','Available',1),
(6,'Water Bed','ftdfh','/media/20240401-121949.png','Donated',4),
(7,'Batriatric digital scale ','A bariatric digital scale with a digital head rod is a specialized medical device designed to accura','/media/20240412-062634.png','Available',3);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`usertype`) values 
(1,'abc@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(3,'efg@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(9,'drsona@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','doctor'),
(10,'drgovind@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','doctor'),
(11,'Pooja@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(12,'drsneha@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','doctor'),
(13,'karthika@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(14,'admin','admin','admin'),
(15,'anagha100@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','volunteer'),
(16,'sona@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(17,'devika@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','user'),
(18,'rajesh@gmail.com','7l6eSgVPA27ggA==*MNbvHGFv5Myu7rfp2dza9g==*nmERlxxp9++MDrvQIs/WRQ==*Hya0nLnGiCZ03eN2xN3ZbA==','volunteer');

/*Table structure for table `myapp_medicine` */

DROP TABLE IF EXISTS `myapp_medicine`;

CREATE TABLE `myapp_medicine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_medicine` */

insert  into `myapp_medicine`(`id`,`med_name`,`description`) values 
(1,'Paracetamol','Medication used to relieve pain and reduce fever.'),
(2,'Ibuprofen','Used for pain relief and to reduce inflammation'),
(3,'Amoxicillin','Antibiotic used to treat bacterial infections such as respiratory infections, ear infections and urinary tract infections.'),
(4,'Lisinopril','ACE inhibitor used to treat high blood pressure and heart failure.'),
(5,'Simvastatin','A statin medication used to lower cholesterol levels and reduce the risk of heart disease');

/*Table structure for table `myapp_nutrients_list` */

DROP TABLE IF EXISTS `myapp_nutrients_list`;

CREATE TABLE `myapp_nutrients_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nutrient` varchar(100) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_nutrients_list_USER_id_8b9b4126_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_nutrients_list_USER_id_8b9b4126_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_nutrients_list` */

insert  into `myapp_nutrients_list`(`id`,`nutrient`,`USER_id`) values 
(1,'protien',4),
(2,'vitamin_c',4),
(4,'fiber',4);

/*Table structure for table `myapp_posts` */

DROP TABLE IF EXISTS `myapp_posts`;

CREATE TABLE `myapp_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(1000) NOT NULL,
  `image` varchar(200) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_posts_USER_id_cfbedc32_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_posts_USER_id_cfbedc32_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_posts` */

insert  into `myapp_posts`(`id`,`date`,`title`,`image`,`USER_id`) values 
(1,'2024-03-12','My new post','/media/20240228-220021.png',2),
(2,'2024-03-15','Cancer is a group of diseases involving abnormal cell growth with the potential to invade or spread to other parts of the body. These contrast with benign tumors, which do not spread.','pending',3),
(3,'2024-04-05','Health is wealth','/media/20240405_091221.jpg',4),
(4,'2024-04-12','Portion control is key to maintaining a balanced diet without feeling deprived. By simply using smaller plates, filling half with fruits and vegetables, and being mindful of serving sizes for proteins and carbs, you can easily manage your calorie intake. Remember, it\'s not about restriction but about making mindful choices that support your health goals.','pending',3);

/*Table structure for table `myapp_prescription` */

DROP TABLE IF EXISTS `myapp_prescription`;

CREATE TABLE `myapp_prescription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dosage` varchar(100) NOT NULL,
  `BOOKING_id` bigint(20) NOT NULL,
  `MEDICINE_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_prescription_BOOKING_id_94c90559_fk_myapp_booking_id` (`BOOKING_id`),
  KEY `myapp_prescription_MEDICINE_id_89ab2f21_fk_myapp_medicine_id` (`MEDICINE_id`),
  CONSTRAINT `myapp_prescription_BOOKING_id_94c90559_fk_myapp_booking_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `myapp_booking` (`id`),
  CONSTRAINT `myapp_prescription_MEDICINE_id_89ab2f21_fk_myapp_medicine_id` FOREIGN KEY (`MEDICINE_id`) REFERENCES `myapp_medicine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_prescription` */

insert  into `myapp_prescription`(`id`,`dosage`,`BOOKING_id`,`MEDICINE_id`) values 
(3,'1-0-1',1,1),
(4,'1-1-1',2,1),
(5,'1-1-1',1,3),
(6,'1-1-1',4,4),
(7,'1-0-0',3,2);

/*Table structure for table `myapp_question_table` */

DROP TABLE IF EXISTS `myapp_question_table`;

CREATE TABLE `myapp_question_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) NOT NULL,
  `answer` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_question_table` */

insert  into `myapp_question_table`(`id`,`question`,`answer`) values 
(1,'depression genetic?','Yes, sometimes depression can run in families. But remember, it\'s just one factor among many. Treatment and support are available, and many people find relief with the right help.'),
(2,'depression be cured?','Yes, depression can be treated and managed effectively with therapy, medication, and support. Many people find relief and lead fulfilling lives with the right help. You\'re not alone, and there is hope for feeling better.'),
(3,'depression have symptoms?','Depression shows signs like persistent sadness, loss of interest, changes in appetite or sleep, fatigue, difficulty concentrating, and thoughts of death. If you\'re feeling this way, it\'s essential to seek support'),
(4,'medicine for depression?','Medication for depression, prescribed by a doctor, can help manage symptoms and improve well-being. It\'s important to work closely with a healthcare professional to find the right treatment plan for you.'),
(5,'having trouble sleeping any advice ?',' Stick to a regular sleep schedule.\nCreate a relaxing bedtime routine.\nMake your sleep environment comfortable.\nLimit screen time before bed.\nAvoid caffeine, nicotine, and alcohol before bedtime.'),
(6,'Feeling anxious. How can I calm down?','To calm down, try deep breathing exercises, take a short walk, practice mindfulness, or engage in a relaxing activity like listening to music or drawing. Remember to take things one step at a time and focus on what you can control. If feelings of anxiety persist, consider reaching out to a mental health professional for support.'),
(7,'How can I improve my sleep ?','You can improve your sleep by creating a bedtime routine, avoiding screen time before bed and by creating a comfortable sleep environemnt.');

/*Table structure for table `myapp_request_alloc` */

DROP TABLE IF EXISTS `myapp_request_alloc`;

CREATE TABLE `myapp_request_alloc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `VOLUNTEER_id` bigint(20) NOT NULL,
  `REQUEST_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_request_alloc_VOLUNTEER_id_d353a37f_fk_myapp_volunteer_id` (`VOLUNTEER_id`),
  KEY `myapp_request_alloc_REQUEST_id_05f81bd0_fk_myapp_vol` (`REQUEST_id`),
  CONSTRAINT `myapp_request_alloc_REQUEST_id_05f81bd0_fk_myapp_vol` FOREIGN KEY (`REQUEST_id`) REFERENCES `myapp_volunteer_request` (`id`),
  CONSTRAINT `myapp_request_alloc_VOLUNTEER_id_d353a37f_fk_myapp_volunteer_id` FOREIGN KEY (`VOLUNTEER_id`) REFERENCES `myapp_volunteer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_request_alloc` */

insert  into `myapp_request_alloc`(`id`,`status`,`VOLUNTEER_id`,`REQUEST_id`) values 
(1,'Done',6,1),
(2,'completed',7,12);

/*Table structure for table `myapp_schedule` */

DROP TABLE IF EXISTS `myapp_schedule`;

CREATE TABLE `myapp_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) NOT NULL,
  `from_time` varchar(200) NOT NULL,
  `to_time` varchar(200) NOT NULL,
  `DOCTOR_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_schedule_DOCTOR_id_1253d521_fk_myapp_doctor_id` (`DOCTOR_id`),
  CONSTRAINT `myapp_schedule_DOCTOR_id_1253d521_fk_myapp_doctor_id` FOREIGN KEY (`DOCTOR_id`) REFERENCES `myapp_doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_schedule` */

insert  into `myapp_schedule`(`id`,`date`,`from_time`,`to_time`,`DOCTOR_id`) values 
(1,'2024-03-15','13:00','14:00',1),
(2,'2024-03-27','14:00','15:00',2),
(4,'2024-04-05','02:36','03:38',3),
(5,'2024-04-12','06:45','08:47',3);

/*Table structure for table `myapp_suggestions` */

DROP TABLE IF EXISTS `myapp_suggestions`;

CREATE TABLE `myapp_suggestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `suggestion` varchar(500) NOT NULL,
  `type` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_suggestions_LOGIN_id_17e7fd5f_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_suggestions_LOGIN_id_17e7fd5f_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_suggestions` */

insert  into `myapp_suggestions`(`id`,`date`,`suggestion`,`type`,`LOGIN_id`) values 
(2,'2024-04-12','I\'ve been using your health app for a while now, and I find the symptom tracker incredibly helpful for monitoring my health and symptoms. However, I\'ve noticed that one symptom I often experience is not included in the tracker: brain fog.','user',11),
(3,'2024-04-12','Can you please add \"nausea\" to the symptom tracker? It\'s a common and important symptom for many users, including myself.','user',13),
(4,'2024-04-12','I would like to suggest adding \"antihistamines\" to the medication list within the app. Antihistamines are commonly used to treat allergies, itching, and other related symptoms, making them an essential medication for many users managing allergic conditions.','doctor',12),
(5,'2024-04-12','I\'d like to propose the addition of \"Omega-3 fish oil supplements\" to the medication options within the app. Omega-3 fatty acids are widely recognized for their numerous health benefits, including cardiovascular health, brain function, and reducing inflammation.','doctor',10);

/*Table structure for table `myapp_symptom_logs` */

DROP TABLE IF EXISTS `myapp_symptom_logs`;

CREATE TABLE `myapp_symptom_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `SYMPTOM_OPTION_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_symptom_logs_SYMPTOM_OPTION_id_5e52d8f8_fk_myapp_sym` (`SYMPTOM_OPTION_id`),
  KEY `myapp_symptom_logs_USER_id_92f775e7_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_symptom_logs_SYMPTOM_OPTION_id_5e52d8f8_fk_myapp_sym` FOREIGN KEY (`SYMPTOM_OPTION_id`) REFERENCES `myapp_symptom_option` (`id`),
  CONSTRAINT `myapp_symptom_logs_USER_id_92f775e7_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_symptom_logs` */

insert  into `myapp_symptom_logs`(`id`,`date`,`SYMPTOM_OPTION_id`,`USER_id`) values 
(3,'2024-02-29',8,1),
(5,'2024-03-01',17,1),
(6,'2024-03-01',22,1),
(7,'2024-03-01',8,1),
(8,'2024-03-15',12,3),
(10,'2024-03-15',17,3),
(11,'2024-03-15',24,3),
(12,'2024-03-17',10,3),
(13,'2024-03-17',18,3),
(14,'2024-03-17',23,3),
(15,'2024-03-18',11,3),
(16,'2024-03-18',17,3),
(18,'2024-03-18',24,3),
(19,'2024-03-31',11,1),
(20,'2024-03-31',15,1),
(21,'2024-03-31',8,4),
(22,'2024-03-31',16,4),
(23,'2024-04-01',9,4),
(24,'2024-04-01',18,4),
(31,'2024-04-11',8,6),
(32,'2024-04-11',12,6),
(33,'2024-04-11',17,1),
(34,'2024-04-12',24,3),
(35,'2024-04-12',17,3),
(37,'2024-04-12',12,3);

/*Table structure for table `myapp_symptom_option` */

DROP TABLE IF EXISTS `myapp_symptom_option`;

CREATE TABLE `myapp_symptom_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `SYMPTOMS_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_symptom_option_SYMPTOMS_id_f37f9c52_fk_myapp_symptoms_id` (`SYMPTOMS_id`),
  CONSTRAINT `myapp_symptom_option_SYMPTOMS_id_f37f9c52_fk_myapp_symptoms_id` FOREIGN KEY (`SYMPTOMS_id`) REFERENCES `myapp_symptoms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_symptom_option` */

insert  into `myapp_symptom_option`(`id`,`option_name`,`SYMPTOMS_id`) values 
(7,'low',3),
(8,'mild',3),
(9,'high',3),
(10,'low',4),
(11,'mild',4),
(12,'high',4),
(13,'low',5),
(14,'mild',5),
(15,'high',5),
(16,'low',6),
(17,'mild',6),
(18,'high',6),
(19,'low',7),
(20,'mild',7),
(21,'high',7),
(22,'low',8),
(23,'mild',8),
(24,'high',8),
(25,'low',9),
(26,'mild',9),
(27,'high',9);

/*Table structure for table `myapp_symptoms` */

DROP TABLE IF EXISTS `myapp_symptoms`;

CREATE TABLE `myapp_symptoms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symptom_name` varchar(200) NOT NULL,
  `details` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_symptoms` */

insert  into `myapp_symptoms`(`id`,`symptom_name`,`details`) values 
(3,'Fever','Elevated body temperature often indicating infection or inflammation. A fever typically ranges from 100.4°F (38°C) and above.'),
(4,'Cough','A repetitive expulsion of air from the lungs, often associated with respiratory illnesses such as colds, flu, or pneumonia.'),
(5,'Fatigue','Persistent tiredness or lack of energy that can interfere with daily activities and may be a sign of various medical conditions'),
(6,'Headache','Pain or discomfort in the head or neck region, which can vary in intensity and duration and may be accompanied by other symptoms.'),
(7,'Muscle or body aches','Generalized soreness or discomfort in the muscles or body, often associated with viral infections like the flu.'),
(8,'Sore throat','Pain, scratchiness, or irritation of the throat, typically worsened by swallowing and often a symptom of respiratory infections.'),
(9,'Shortness of breath',' Difficulty breathing or feeling like you can\'t get enough air, which can be a sign of various medical emergencies or chronic conditions.');

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `place` varchar(200) NOT NULL,
  `pin` int(11) NOT NULL,
  `post` varchar(200) NOT NULL,
  `certificate` varchar(200) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`user_name`,`email`,`phone`,`place`,`pin`,`post`,`certificate`,`LOGIN_id`) values 
(1,'sona','abc@gmail.com',7755233668,'kannur',657897,'kannur','/media/20240228-213629.png',1),
(2,'sana','efg@gmail.com',7758236985,'knur',678987,'knr','/media/20240228-221452.png',3),
(3,'Pooja Suresh','Pooja@gmail.com',9087654321,'Kannur',670667,'kannur','/media/20240411-204834.png',11),
(4,'Karthika','karthika@gmail.com',9400321863,'Mattannur',670702,'Kolari','/media/20240411-204834.png',13),
(5,'Sona Santhosh','sona@gmail.com',7765444567,'Kannur',677898,'Kannur','/media/20240411-204834.png',16),
(6,'Devika K','devika@gmail.com',7799444567,'Kannur',677887,'Kannur','/media/20240411-210445.png',17);

/*Table structure for table `myapp_volunteer` */

DROP TABLE IF EXISTS `myapp_volunteer`;

CREATE TABLE `myapp_volunteer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `experience` varchar(200) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_volunteer_LOGIN_id_1a16e58d_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_volunteer_LOGIN_id_1a16e58d_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_volunteer` */

insert  into `myapp_volunteer`(`id`,`name`,`email`,`phone`,`experience`,`LOGIN_id`) values 
(6,'Anagha ','anagha100@gmail.com',8876545678,'3@years',15),
(7,'Rajesh R','rajesh@gmail.com',7787654567,'4@years',18);

/*Table structure for table `myapp_volunteer_request` */

DROP TABLE IF EXISTS `myapp_volunteer_request`;

CREATE TABLE `myapp_volunteer_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_volunteer_request_USER_id_dd194583_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_volunteer_request_USER_id_dd194583_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `myapp_volunteer_request` */

insert  into `myapp_volunteer_request`(`id`,`date`,`status`,`USER_id`) values 
(1,'2024-03-15','allocated',4),
(10,'2024-04-11','pending',1),
(11,'2024-04-11','pending',3),
(12,'2024-05-04','allocated',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
