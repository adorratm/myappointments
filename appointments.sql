-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2023 at 04:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT 0,
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `is_unavailable`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`) VALUES
(1, '2023-05-05 14:41:51', '2023-05-05 16:30:00', '2023-05-05 17:30:00', NULL, '', 'f7TnKiV3l9rN', 0, 2, 4, 3, NULL),
(2, '2023-05-05 14:53:05', '2023-05-06 09:00:00', '2023-05-06 10:00:00', NULL, '', 'jlRYwEczIF9y', 0, 2, 4, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

CREATE TABLE `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT 1,
  `id_service_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `location`, `availabilities_type`, `attendants_number`, `id_service_categories`) VALUES
(3, 'Kıl Tüy', 60, 500.00, 'TRY', '', '', 'flexible', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}'),
(2, 'book_advance_timeout', '30'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'DMY'),
(6, 'require_captcha', '0'),
(7, 'time_format', 'military'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'first_weekday', 'monday'),
(15, 'require_phone_number', '1'),
(16, 'api_token', ''),
(17, 'display_any_provider', '1'),
(18, 'company_name', 'Mutfak Yapım'),
(19, 'company_email', 'iletisim@mutfakyapim.com'),
(20, 'company_link', 'Mutfak Yapım');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `id_roles`) VALUES
(1, 'EMRE', 'KILIÇ', 'emrekilic19983@gmail.com', '', '05494410120', '', '', '', '', '', 'Europe/Istanbul', 'english', 1),
(2, 'EMRE', 'KILIÇ', 'emrekilic19983@gmail.com', '05494410120', '05494410120', 'Alsancak, Alsancak Mh. 1440 sk. No: 13 D:1, 35220 Konak/İzmir', 'Konak', 'İzmir', '10117', '', 'Europe/Istanbul', 'english', 2),
(4, 'EMRE', 'KILIÇ', 'emrekilic19983@gmail.com', NULL, '05494410120', 'Alsancak, Alsancak Mh. 1440 sk. No: 13 D:1, 35220 Konak/İzmir', 'Konak', NULL, '', NULL, 'Europe/Istanbul', 'turkish', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text DEFAULT NULL,
  `working_plan_exceptions` text DEFAULT NULL,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text DEFAULT NULL,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT 30,
  `sync_future_days` int(11) DEFAULT 90,
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'admin', 'efbed19263de9cdaef933dd82f52d929c15128eed5b69219e91c4581579eb0ff', 'b41c6de01f8acd9dec899d2dda9bda3c5a2e76afdfb343f64c303622a0196cb9', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(2, 'emrekilic', '832a6a510a9879ffbee020e748e3bd89e00eed72572d8e9c98f4faf96d164075', '33d057c918900dbf5fe930944e9e5e9c4f44a765f3e675fcd1fdb30ae534d2b6', '{\"monday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]},\"sunday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[{\"start\":\"14:30\",\"end\":\"15:00\"}]}}', '[]', 1, 0, NULL, NULL, 30, 90, 'default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
