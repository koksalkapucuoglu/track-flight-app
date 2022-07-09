-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2022 at 08:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackingflightdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`id`, `code`, `name`) VALUES
(1, 'TZX', 'Trabzon Airport'),
(2, 'IST', 'Istanbul Airport'),
(4, 'ADA', 'Adana Airport'),
(5, 'ADB', 'İzmir Adnan Mendere Airport');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add airport', 1, 'add_airport'),
(2, 'Can change airport', 1, 'change_airport'),
(3, 'Can delete airport', 1, 'delete_airport'),
(4, 'Can view airport', 1, 'view_airport'),
(5, 'Can add flight', 2, 'add_flight'),
(6, 'Can change flight', 2, 'change_flight'),
(7, 'Can delete flight', 2, 'delete_flight'),
(8, 'Can view flight', 2, 'view_flight'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$mexijFZnYTtq5Wcm6VXB6a$wxupBZs/70828wDHoVZI/+Ba9IKTC5fNTNPp3nt5rCk=', '2022-07-08 16:52:08.013346', 1, 'koksal', '', '', 'koksalkapucuoglu@gmail.com', 1, 1, '2022-07-08 16:47:58.248727');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-07-08 16:52:34.079304', '1', 'Airport object (1)', 1, '[{\"added\": {}}]', 1, 1),
(2, '2022-07-08 16:52:48.956594', '2', 'Airport object (2)', 1, '[{\"added\": {}}]', 1, 1),
(3, '2022-07-08 16:53:54.073673', '1', 'Flight object (1)', 1, '[{\"added\": {}}]', 2, 1),
(4, '2022-07-08 16:54:47.999748', '2', 'Flight object (2)', 1, '[{\"added\": {}}]', 2, 1),
(5, '2022-07-08 16:57:45.913092', '2', 'TK-6161', 2, '[{\"changed\": {\"fields\": [\"Flight number\"]}}]', 2, 1),
(6, '2022-07-08 16:57:52.839412', '1', 'TK-2453', 2, '[{\"changed\": {\"fields\": [\"Flight number\"]}}]', 2, 1),
(7, '2022-07-08 16:58:43.604347', '3', 'TK-6161', 1, '[{\"added\": {}}]', 2, 1),
(8, '2022-07-08 16:58:53.674560', '2', 'TK-6161', 2, '[]', 2, 1),
(9, '2022-07-08 16:59:30.945387', '1', 'Trabzon Airport', 2, '[]', 1, 1),
(10, '2022-07-08 18:08:11.512212', '5', 'TK-2453', 1, '[{\"added\": {}}]', 2, 1),
(11, '2022-07-08 18:08:32.542061', '6', 'TK-2453', 1, '[{\"added\": {}}]', 2, 1),
(12, '2022-07-08 18:08:54.479758', '7', 'TK-2453', 1, '[{\"added\": {}}]', 2, 1),
(13, '2022-07-08 18:09:14.597089', '8', 'TK-2453', 1, '[{\"added\": {}}]', 2, 1),
(14, '2022-07-08 18:09:38.195656', '9', 'TK-6161', 1, '[{\"added\": {}}]', 2, 1),
(15, '2022-07-08 18:11:02.243281', '10', 'TK-0106', 1, '[{\"added\": {}}]', 2, 1),
(16, '2022-07-08 18:11:31.115939', '11', 'TK-0106', 1, '[{\"added\": {}}]', 2, 1),
(17, '2022-07-08 18:11:47.355920', '12', 'TK-0106', 1, '[{\"added\": {}}]', 2, 1),
(18, '2022-07-08 18:12:25.894765', '13', 'TK-0601', 1, '[{\"added\": {}}]', 2, 1),
(19, '2022-07-08 18:13:21.903832', '14', 'TK-2406', 1, '[{\"added\": {}}]', 2, 1),
(20, '2022-07-08 18:13:45.610845', '15', 'TK-5306', 1, '[{\"added\": {}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(8, 'sessions', 'session'),
(1, 'trackflight', 'airport'),
(2, 'trackflight', 'flight');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-08 16:39:31.724749'),
(2, 'auth', '0001_initial', '2022-07-08 16:39:32.422750'),
(3, 'admin', '0001_initial', '2022-07-08 16:39:32.601747'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-08 16:39:32.618747'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-08 16:39:32.635748'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-07-08 16:39:32.737750'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-07-08 16:39:32.850749'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-07-08 16:39:32.883751'),
(9, 'auth', '0004_alter_user_username_opts', '2022-07-08 16:39:32.899749'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-07-08 16:39:32.979748'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-07-08 16:39:32.985751'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-07-08 16:39:33.000749'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-07-08 16:39:33.029747'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-07-08 16:39:33.061749'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-07-08 16:39:33.097755'),
(16, 'auth', '0011_update_proxy_permissions', '2022-07-08 16:39:33.114748'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-07-08 16:39:33.142748'),
(18, 'sessions', '0001_initial', '2022-07-08 16:39:33.196749'),
(19, 'trackflight', '0001_initial', '2022-07-08 16:39:33.379747');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('m8ji6gm9b6lo6ogg0ke3aast6lv7xjra', '.eJxVjEEOwiAQAP_C2RAq7cJ69O4byC5LpWogKe3J-HdD0oNeZybzVoH2LYe9pTUsoi5qUKdfxhSfqXQhDyr3qmMt27qw7ok-bNO3Kul1Pdq_QaaW-9Y7a4TOTOIRowcrIzifGOzs0kxiPAx-TIbATQTAMBnHiEhoyCGrzxfcIzeU:1o9rD6:ChyOBOoMowJW2debwcD1L_GXcMvLqysil5DVQLtTd30', '2022-07-22 16:52:08.016325');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `id` int(11) NOT NULL,
  `flight_number` varchar(255) DEFAULT NULL,
  `take_off` datetime(6) NOT NULL,
  `landing` datetime(6) NOT NULL,
  `from_airport_id` int(11) NOT NULL,
  `to_airport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`id`, `flight_number`, `take_off`, `landing`, `from_airport_id`, `to_airport_id`) VALUES
(1, 'TK-2453', '2022-01-01 16:53:24.000000', '2022-01-01 19:53:24.000000', 2, 1),
(2, 'TK-6161', '2022-01-01 17:54:20.000000', '2022-01-01 20:54:20.000000', 1, 2),
(3, 'TK-6161', '2022-07-08 16:58:25.000000', '2022-07-08 19:58:28.000000', 1, 2),
(4, 'TK-2453', '2022-07-08 18:02:43.557000', '2022-07-08 17:02:43.557000', 2, 1),
(5, 'TK-2453', '2022-07-08 10:07:35.000000', '2022-07-08 13:07:47.000000', 2, 1),
(6, 'TK-2453', '2022-07-08 11:08:16.000000', '2022-07-08 14:08:17.000000', 2, 1),
(7, 'TK-2453', '2022-07-08 12:08:40.000000', '2022-07-08 15:08:45.000000', 2, 1),
(8, 'TK-2453', '2022-07-08 13:08:59.000000', '2022-07-08 16:09:01.000000', 2, 1),
(9, 'TK-6161', '2022-07-08 13:09:25.000000', '2022-07-08 16:09:29.000000', 1, 2),
(10, 'TK-0106', '2022-07-08 11:10:09.000000', '2022-07-08 12:10:11.000000', 5, 4),
(11, 'TK-0106', '2022-07-08 12:11:10.000000', '2022-07-08 13:11:12.000000', 5, 4),
(12, 'TK-0106', '2022-07-08 15:11:36.000000', '2022-07-08 16:11:37.000000', 5, 4),
(13, 'TK-0601', '2022-07-08 15:11:56.000000', '2022-07-08 16:11:58.000000', 4, 5),
(14, 'TK-2406', '2022-07-08 19:12:46.000000', '2022-07-08 23:12:48.000000', 5, 1),
(15, 'TK-5306', '2022-07-08 18:13:35.000000', '2022-07-08 20:13:36.000000', 5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flight_from_airport_id_6b8cdc5b_fk_airport_id` (`from_airport_id`),
  ADD KEY `flight_to_airport_id_61786703_fk_airport_id` (`to_airport_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airport`
--
ALTER TABLE `airport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_from_airport_id_6b8cdc5b_fk_airport_id` FOREIGN KEY (`from_airport_id`) REFERENCES `airport` (`id`),
  ADD CONSTRAINT `flight_to_airport_id_61786703_fk_airport_id` FOREIGN KEY (`to_airport_id`) REFERENCES `airport` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
