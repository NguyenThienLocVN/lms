-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 21, 2023 at 09:24 AM
-- Server version: 8.0.28
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog-tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `binshops_categories`
--

CREATE TABLE `binshops_categories` (
  `id` int UNSIGNED NOT NULL,
  `created_by` int UNSIGNED DEFAULT NULL COMMENT 'user id',
  `parent_id` int DEFAULT NULL,
  `lft` int DEFAULT NULL,
  `rgt` int DEFAULT NULL,
  `depth` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_category_translations`
--

CREATE TABLE `binshops_category_translations` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` mediumtext COLLATE utf8mb4_unicode_ci,
  `lang_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_comments`
--

CREATE TABLE `binshops_comments` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL COMMENT 'if user was logged in',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if enabled in the config file',
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if not logged in',
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'the comment body',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `author_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_configurations`
--

CREATE TABLE `binshops_configurations` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binshops_configurations`
--

INSERT INTO `binshops_configurations` (`key`, `value`, `created_at`, `updated_at`) VALUES
('DEFAULT_LANGUAGE_LOCALE', 'en', '2023-09-21 02:05:08', '2023-09-21 02:05:08'),
('INITIAL_SETUP', '1', '2023-09-21 02:05:08', '2023-09-21 02:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `binshops_languages`
--

CREATE TABLE `binshops_languages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `binshops_languages`
--

INSERT INTO `binshops_languages` (`id`, `name`, `locale`, `iso_code`, `date_format`, `active`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en', 'YYYY/MM/DD', 1, 0, '2023-09-21 02:05:08', '2023-09-21 02:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `binshops_posts`
--

CREATE TABLE `binshops_posts` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `posted_at` datetime DEFAULT NULL COMMENT 'Public posted at time, if this is in future then it wont appear yet',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_post_categories`
--

CREATE TABLE `binshops_post_categories` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_post_translations`
--

CREATE TABLE `binshops_post_translations` (
  `id` int UNSIGNED NOT NULL,
  `post_id` int UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'New blog post',
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `meta_desc` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_body` mediumtext COLLATE utf8mb4_unicode_ci,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `use_view_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'should refer to a blade file in /views/',
  `image_large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `binshops_uploaded_photos`
--

CREATE TABLE `binshops_uploaded_photos` (
  `id` int UNSIGNED NOT NULL,
  `uploaded_images` text COLLATE utf8mb4_unicode_ci,
  `image_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknown',
  `uploader_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel_fulltext`
--

CREATE TABLE `laravel_fulltext` (
  `id` int UNSIGNED NOT NULL,
  `indexable_id` int NOT NULL,
  `indexable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indexed_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `indexed_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_11_04_152913_create_laravel_fulltext_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_16_004241_create_binshops_languages_table', 1),
(7, '2020_10_16_005400_create_binshops_categories_table', 1),
(8, '2020_10_16_005425_create_binshops_category_translations_table', 1),
(9, '2020_10_16_010039_create_binshops_posts_table', 1),
(10, '2020_10_16_010049_create_binshops_post_translations_table', 1),
(11, '2020_10_16_121230_create_binshops_comments_table', 1),
(12, '2020_10_16_121728_create_binshops_uploaded_photos_table', 1),
(13, '2020_10_22_132005_create_binshops_configurations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$sOAp6yyfDY6AuVWEcYez3eCd6/aHPneoMYdr3JiPJIrlIUtuNV3ji', NULL, '2023-09-21 02:04:57', '2023-09-21 02:04:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binshops_categories`
--
ALTER TABLE `binshops_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_categories_created_by_index` (`created_by`);

--
-- Indexes for table `binshops_category_translations`
--
ALTER TABLE `binshops_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `binshops_category_translations_slug_unique` (`slug`),
  ADD KEY `binshops_category_translations_lang_id_index` (`lang_id`);

--
-- Indexes for table `binshops_comments`
--
ALTER TABLE `binshops_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_comments_post_id_index` (`post_id`),
  ADD KEY `binshops_comments_user_id_index` (`user_id`);

--
-- Indexes for table `binshops_configurations`
--
ALTER TABLE `binshops_configurations`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `binshops_languages`
--
ALTER TABLE `binshops_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `binshops_languages_name_unique` (`name`),
  ADD UNIQUE KEY `binshops_languages_locale_unique` (`locale`),
  ADD UNIQUE KEY `binshops_languages_iso_code_unique` (`iso_code`);

--
-- Indexes for table `binshops_posts`
--
ALTER TABLE `binshops_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_posts_user_id_index` (`user_id`),
  ADD KEY `binshops_posts_posted_at_index` (`posted_at`);

--
-- Indexes for table `binshops_post_categories`
--
ALTER TABLE `binshops_post_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_post_categories_post_id_index` (`post_id`),
  ADD KEY `binshops_post_categories_category_id_index` (`category_id`);

--
-- Indexes for table `binshops_post_translations`
--
ALTER TABLE `binshops_post_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_post_translations_lang_id_index` (`lang_id`);

--
-- Indexes for table `binshops_uploaded_photos`
--
ALTER TABLE `binshops_uploaded_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `binshops_uploaded_photos_uploader_id_index` (`uploader_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `laravel_fulltext`
--
ALTER TABLE `laravel_fulltext`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laravel_fulltext_indexable_type_indexable_id_unique` (`indexable_type`,`indexable_id`);
ALTER TABLE `laravel_fulltext` ADD FULLTEXT KEY `fulltext_title` (`indexed_title`);
ALTER TABLE `laravel_fulltext` ADD FULLTEXT KEY `fulltext_title_content` (`indexed_title`,`indexed_content`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binshops_categories`
--
ALTER TABLE `binshops_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_category_translations`
--
ALTER TABLE `binshops_category_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_comments`
--
ALTER TABLE `binshops_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_languages`
--
ALTER TABLE `binshops_languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `binshops_posts`
--
ALTER TABLE `binshops_posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_post_categories`
--
ALTER TABLE `binshops_post_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_post_translations`
--
ALTER TABLE `binshops_post_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `binshops_uploaded_photos`
--
ALTER TABLE `binshops_uploaded_photos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laravel_fulltext`
--
ALTER TABLE `laravel_fulltext`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binshops_category_translations`
--
ALTER TABLE `binshops_category_translations`
  ADD CONSTRAINT `binshops_category_translations_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `binshops_languages` (`id`);

--
-- Constraints for table `binshops_post_categories`
--
ALTER TABLE `binshops_post_categories`
  ADD CONSTRAINT `binshops_post_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `binshops_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `binshops_post_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `binshops_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `binshops_post_translations`
--
ALTER TABLE `binshops_post_translations`
  ADD CONSTRAINT `binshops_post_translations_lang_id_foreign` FOREIGN KEY (`lang_id`) REFERENCES `binshops_languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
