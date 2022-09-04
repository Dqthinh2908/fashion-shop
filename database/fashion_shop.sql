-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2022 at 07:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Aristino', 'Banner 1', '/storage/photos/1/Banner/banner 3.png', 'Ngày hội khuyến mãi 8.8', 'active', '2022-08-08 01:50:23', '2022-08-09 02:39:03'),
(4, 'Thời trang Aristino', 'Banner 2', '/storage/photos/1/Banner/banner 2.png', 'Không gì là không thể!', 'active', '2022-08-07 20:46:59', '2022-08-09 02:31:04'),
(5, 'Aristino', 'Banner 3', '/storage/photos/1/Banner/banner 1.png', '<p>Thế giới phong cách của bạn!</p>', 'active', '2022-08-07 17:45:17', '2022-08-09 02:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Aristino Shirt', 'aristino-shirt', 'active', '2022-08-08 18:48:50', '2022-08-08 18:48:50'),
(8, 'Aristino Jeans', 'aristino-jeans', 'active', '2022-08-08 18:49:04', '2022-08-08 18:49:04'),
(9, 'Aristino Accessory', 'aristino-accessory', 'active', '2022-08-08 18:49:21', '2022-08-08 18:49:21'),
(10, 'Thời trang nam aristino 123', 'thoi-trang-nam-aristino', 'active', '2022-08-12 07:09:48', '2022-08-12 07:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(12, 21, 6, 30, '680000.00', 'new', 1, '850000.00', '2022-08-10 05:13:18', '2022-08-10 05:27:52'),
(13, 22, 7, 30, '577600.00', 'new', 1, '577600.00', '2022-08-12 06:50:43', '2022-08-17 23:24:41'),
(14, 21, 7, 30, '680000.00', 'new', 1, '680000.00', '2022-08-12 06:50:57', '2022-08-17 23:24:41'),
(15, 21, NULL, 1, '680000.00', 'new', 6, '4080000', '2022-08-12 07:32:56', '2022-08-17 23:22:50'),
(16, 21, 8, 30, '680000', 'new', 4, '2720000', '2022-08-21 02:52:52', '2022-08-22 06:57:34'),
(17, 19, 8, 30, '187200', 'new', 2, '374400', '2022-08-22 06:54:15', '2022-08-22 06:57:34'),
(18, 17, 8, 30, '499500', 'new', 2, '999000', '2022-08-22 06:54:22', '2022-08-22 06:57:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Áo', 'Áo', '<p>Áo</p>', '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2022-08-08 04:26:15', '2022-08-09 02:17:29'),
(2, 'Phụ kiện', 'Phụ kiện', '<p>Phụ kiện<br></p>', '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2022-08-08 04:26:40', '2022-08-08 17:46:55'),
(3, 'Quần', 'Quần', '<p>Quần<br></p>', '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2022-08-08 04:27:10', '2022-08-09 02:17:53'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2022-08-08 04:32:14', '2022-08-09 04:32:14'),
(5, 'Jeans pants', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2022-08-08 04:32:49', '2022-08-09 04:32:49'),
(6, 'Sweater & Jackets', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2022-08-08 04:33:37', '2022-08-09 04:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'DEMOVOUCHER', 'fixed', '10000.00', 'active', '2022-08-08 18:12:33', '2022-08-08 18:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'Minhest Dev', 'Test function chatting', 'devnguyen@gmail.com', NULL, '0983103123', 'Xin chào, mình là Admin trang web này đây. Chúc bạn một ngày mới tốt lành!', '2022-08-08 18:54:18', '2022-08-08 18:51:44', '2022-08-08 18:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('17ad418c-0630-4ef5-be70-f4738d83e024', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', '2022-08-10 05:28:55', '2022-08-10 05:27:52', '2022-08-10 05:28:55'),
('5199ca59-92a4-47ab-8b5e-bab10c0acaec', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', '2022-08-17 23:24:53', '2022-08-17 23:24:41', '2022-08-17 23:24:53'),
('955911a8-5bcc-4261-b95a-4475e43b3fbb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t b\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o!\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/ao-cat-xe-vay-cho-dan-ong-len-ngoi-o-xuan-he-2022\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-08 18:54:10', '2022-08-08 18:54:10'),
('96b1298f-c64d-46f5-a342-4680cb63458d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t b\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o!\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/chien-thuat-cua-nga-lam-tan-ra-doi-hinh-10000-quan-cua-ukraine\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-12 07:13:38', '2022-08-12 07:13:38'),
('b138799f-e4d1-4377-8aa0-06b0051716ea', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u01a1n h\\u00e0ng m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o\",\"actionURL\":\"http:\\/\\/localhost\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-22 06:57:33', '2022-08-22 06:57:33'),
('c497685d-29cf-472a-81d6-d10a509dd919', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"\\u0110\\u00e1nh gi\\u00e1 s\\u1ea3n ph\\u1ea9m m\\u1edbi!\",\"actionURL\":\"http:\\/\\/localhost\\/product-detail\\/quan-au-nam-aristino-atr00201\",\"fas\":\"fa-star\"}', '2022-08-09 02:44:15', '2022-08-09 02:40:55', '2022-08-09 02:44:15'),
('e07e24e9-b997-4845-9661-eaa4989c63d8', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"M\\u1ed9t b\\u00ecnh lu\\u1eadn m\\u1edbi \\u0111\\u01b0\\u1ee3c t\\u1ea1o!\",\"actionURL\":\"http:\\/\\/localhost\\/blog-detail\\/chien-thuat-cua-nga-lam-tan-ra-doi-hinh-10000-quan-cua-ukraine\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-12 07:13:52', '2022-08-12 07:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(6, 'ORD-4TQV6DI48Z', 30, '850000.00', 4, NULL, '875000.00', 1, 'cod', 'Chưa thanh toán', 'delivered', 'Minh', 'Anh', 'minhanh.nvd@gmail.com', '0983103177', 'VN', '100000', 'Hà Nội', 'Hà Nội', '2022-08-10 05:27:51', '2022-08-10 05:29:16'),
(7, 'ORD-130066PRHB', 30, '1257600', 4, NULL, '1282600', 2, 'cod', 'Chưa thanh toán', 'delivered', 'dev', 'nguyen', 'minhanh.nvd@gmail.com', '0983103187', 'VN', '10000', 'Hà Nội', 'Hà Nội', '2022-08-17 23:24:40', '2022-08-17 23:25:03'),
(8, 'ORD-KEUNG5L2ZS', 30, '4093400', NULL, NULL, '4093400', 8, 'cod', 'Chưa thanh toán', 'new', 'Dang', 'Quang Thinh', 'quangthinh13@gmail.com', '0257498749', 'VN', NULL, 'Ha Noi', NULL, '2022-08-22 06:57:32', '2022-08-22 06:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Thương hiệu Aristino khai trương chuỗi cửa hàng mới', 'thuong-hieu-aristino-khai-truong-chuoi-cua-hang-moi', '<p><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Thương hiệu thời trang nam Aristino khai trương ba cửa hàng mới, chạm mốc 65 cơ sở trên toàn quốc từ ngày 9/4.</span><br></p>', '<div id=\"divfirst\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\">Ba cửa hàng mới nằm tại 568 Lũy Bán Bích, quận Tân Phú, 663 Lê Trọng Tấn, quận Bình Tân và 645A Quang Trung, quận Gò Vấp. Buổi lễ khai trương có sự góp mặt của một số nghệ sĩ, người mẫu nổi tiếng như diễn viên Hứa Vĩ Văn, MC Lâm Trí Thuận, người mẫu Nguyễn Quang Thuận... cùng hàng trăm khách hàng yêu thích phong cách của Aristino.</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left;\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 445.812px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; -webkit-box-pack: center; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i5LxhKLfkN5zvNBYL1mFTQ 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=cFSNX2w9Oqip40pRjQQ3uA 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=UznzAW6Mgg4QtDhob_J4WA 2x\" srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i5LxhKLfkN5zvNBYL1mFTQ 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=cFSNX2w9Oqip40pRjQQ3uA 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=UznzAW6Mgg4QtDhob_J4WA 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Buổi lễ khai trương tại chuỗi cửa hàng mới của Aristino. Ảnh: Aristino\" class=\"lazy lazied\" src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i5LxhKLfkN5zvNBYL1mFTQ\" data-src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image001-3337-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=i5LxhKLfkN5zvNBYL1mFTQ\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Buổi lễ khai trương tại chuỗi cửa hàng mới của Aristino. Ảnh:&nbsp;<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">Aristino</em></p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\">Không gian mua sắm tại showroom được thiết kế theo tiêu chí sang trọng và hiện đại. Hệ thống quầy kệ sắp xếp khoa học nhằm giúp khách hàng dễ dàng tiếp cận sản phẩm, dịch vụ.</p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\">Tại ba cửa hàng mới, tín đồ thời trang có thể trải nghiệm các sản phẩm suit, sơ mi, áo polo, quần âu... trong bộ sưu tập \"Man in Innovation\". Đại diện thương hiệu cho biết, các thiết kế này có sự giao hòa giữa thời trang và công nghệ với sợi vải ViroBlock của công ty HeiQ (Thụy Sỹ), giúp diệt tới 99.99% virus nCoV trong 30 phút.</p></div><div id=\"admbackground\" data-set=\"dfp\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"></div><div id=\"divend\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\"><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left;\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 446.237px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; -webkit-box-pack: center; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Eb2Qbmr4vNKem5lGrnVnTA 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=63i6QjD1jSUx2M_NCgzYcQ 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=hn_LNItP-G7ziYjMuc3_ww 2x\" srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Eb2Qbmr4vNKem5lGrnVnTA 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=63i6QjD1jSUx2M_NCgzYcQ 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=hn_LNItP-G7ziYjMuc3_ww 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Hứa Vĩ Văn tại sự kiện khai trương cửa hàng Aristino. Ảnh: Aristino\" class=\"lazy lazied\" src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Eb2Qbmr4vNKem5lGrnVnTA\" data-src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image003-1387-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Eb2Qbmr4vNKem5lGrnVnTA\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Hứa Vĩ Văn tại sự kiện khai trương cửa hàng Aristino. Ảnh:&nbsp;<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">Aristino</em></p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\">Bên cạnh đó, Aristino còn mang đến nhiều phần quà, bao gồm: voucher 500.000 đồng, 300.000 đồng cho đơn hàng từ 1,2 triệu đồng đến 1,5 triệu đồng; áo sơ mi trị giá tới 1 triệu đồng với hóa đơn từ 5 triệu đồng; áo polo trị giá 650.000 đồng áp dụng cho đơn hàng từ 4 triệu đồng...</p><figure data-size=\"true\" itemprop=\"associatedMedia image\" itemscope=\"\" itemtype=\"http://schema.org/ImageObject\" class=\"tplCaption action_thumb_added\" style=\"margin-right: auto; margin-bottom: 15px; margin-left: auto; padding: 0px; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; text-align: center; width: 670px; float: left;\"><div class=\"fig-picture\" style=\"margin: 0px; padding: 0px 0px 445.812px; text-rendering: optimizelegibility; width: 670px; float: left; display: table; -webkit-box-pack: center; justify-content: center; background: rgb(240, 238, 234); position: relative;\"><picture style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><source data-srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=wQ1n6irHr_ZaNkOjcazWjg 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=SUPqXbsQjEvJIYy4pFxdeA 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=OkyxTtT1hK3Rb6qa6_rRVA 2x\" srcset=\"https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=wQ1n6irHr_ZaNkOjcazWjg 1x, https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=SUPqXbsQjEvJIYy4pFxdeA 1.5x, https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=OkyxTtT1hK3Rb6qa6_rRVA 2x\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\"><img itemprop=\"contentUrl\" loading=\"lazy\" intrinsicsize=\"680x0\" alt=\"Khách hàng trải nghiệm sản phẩm trong ngày khai trương. Ảnh: Aristino\" class=\"lazy lazied\" src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=wQ1n6irHr_ZaNkOjcazWjg\" data-src=\"https://i1-giaitri.vnecdn.net/2022/04/14/image005-4081-1649911534.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=wQ1n6irHr_ZaNkOjcazWjg\" data-ll-status=\"loaded\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; position: absolute; top: 0px; left: 0px; max-height: 700px; width: 670px;\"></picture></div><figcaption itemprop=\"description\" style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; float: left; text-align: left;\"><p class=\"Image\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 10px 0px 0px; text-rendering: optimizespeed; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22.4px;\">Khách hàng trải nghiệm sản phẩm trong ngày khai trương. Ảnh:&nbsp;<em style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">Aristino</em></p></figcaption></figure><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><br></p><p class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\">Aristino là thương hiệu thời trang nam cao cấp thuộc Công ty Cổ phần Đầu tư K&amp;G Việt Nam, ra đời từ năm 2013. Sau 9 năm hình thành và phát triển, thương hiệu Aristino đã trở thành địa chỉ quen thuộc của nhiều khách hàng Việt và sở hữu hệ thống rộng khắp.<br></p><p align=\"right\" class=\"Normal\" style=\"margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; text-rendering: optimizespeed; line-height: 28.8px;\"><strong style=\"margin: 0px; padding: 0px; text-rendering: optimizelegibility;\">Thiên Minh</strong></p></div>', '<p><br></p>', '/storage/photos/1/Blog/image003-1649911507-9829-1649911534.jpg', 'Hot Trend 2022', 3, NULL, 1, 'active', '2022-08-08 18:27:10', '2022-08-08 18:29:06');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(8, 'Áo cắt xẻ, váy cho đàn ông lên ngôi ở Xuân Hè 2022', 'ao-cat-xe-vay-cho-dan-ong-len-ngoi-o-xuan-he-2022', '<p><span style=\"color: rgb(34, 34, 34); font-family: arial; font-size: 18px; background-color: rgb(252, 250, 246);\">Váy, trang phục cut-out vào nhóm xu hướng nổi bật dành cho nam giới nửa đầu năm nay.</span><br></p>', '<figure class=\"image align-center\" contenteditable=\"false\" style=\"margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 2\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vayanhgq-1642146272843.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 2\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vayanhgq-1642146272843.jpg\" data-photo-id=\"1790133\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790133\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Loewe, Rick Owens, Burberry, Prada, Fendi, GMBH... tung ra nhiều mẫu váy lạ mắt dành cho đàn ông trong mùa xuân hè 2022 với tuyên ngôn: Vì sao đàn ông không thể khoe chân trần. Một loạt các thương hiệu đã bắt kịp xu hướng cho mùa xuân/hè 2022 bằng các mẫu váy ngắn dài khác nhau, đa dạng, bắt mắt (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 3\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay2anhgq-1642146931771.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 3\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay2anhgq-1642146931771.jpg\" data-photo-id=\"1790178\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790178\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Nếu tiết trời mùa đông không quá lạnh, thay cho những kiểu áo phao quá khổ, các anh chàng có thể thử những chiếc áo khoác cardigan hay còn được gọi là áo len dệt kim dày. Những chiếc áo cardigan kết hợp với áo sơ mi hoặc mặc không đều cho người mặc cảm giác rất dễ chịu và trẻ trung (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 4\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay3anhgq-1642147220208.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 4\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay3anhgq-1642147220208.jpg\" data-photo-id=\"1790199\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790199\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">Trang phục vest không theo kiểu dáng truyền thống được nhiều thương hiệu như Hermès, Louis Vuitton, Lanvin, Wales Bonner, Giorgio Armani, Dries van Noten, Dunhill, Ermenegildo Zegna, Fendi, Homme Plissé Issey Miyake, Paul Smith, Wooyoungmi lăng xê. Nếu nhiều người luôn cho rằng mặc vest sẽ bị già hoặc cứng nhắc thì có thể họ sẽ thay đổi quan điểm khi ngắm các mẫu veston mới nhất dành cho mùa xuân hè 2022 (Ảnh: GQ).</p></figcaption></figure><figure class=\"video\" contenteditable=\"false\" style=\"margin-top: 28px; margin-bottom: 28px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px;\"><div data-module=\"video-article-player\" poster=\"https://icdn.dantri.com.vn/2022/01/14/maxresdefault-1642147203336.jpg\" width=\"640\" height=\"360\" data-src=\"2022/01/14/etro-spring-summer-2022-mens-fashion-show-Z7vD-_cnEjo-1642146515497.mp4\" data-video-key=\"02f5c6f7f950d4904972a7819927de78\" data-video-id=\"148544\" style=\"min-height: 383px;\"><div id=\"video-wrap-vjbm-148544\" class=\"\"><div class=\"video-js vjs-theme-dantri vjs-fluid vjbm-148544-dimensions vjs-controls-enabled vjs-workinghover vjs-v7 vjs-has-started vjs-paused vjs-user-inactive\" id=\"vjbm-148544\" tabindex=\"-1\" role=\"region\" lang=\"vi\" aria-label=\"Trình phát Video\" style=\"width: 680px; height: 0px; padding: 382.5px 0px 0px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255); font-family: Arial, Helvetica, sans-serif; font-size: 10px; line-height: 1; position: relative; vertical-align: top; word-break: normal; outline: none; max-width: 100%;\"><div class=\"vjs-text-track-display\" aria-live=\"off\" aria-atomic=\"true\" style=\"box-sizing: inherit; inset: 0px 0px 3em; pointer-events: none; position: absolute;\"><div style=\"box-sizing: inherit; position: absolute; inset: 0px; margin: 10.2px;\"></div></div><div class=\"vjs-control-bar\" dir=\"ltr\" style=\"box-sizing: inherit; background: none; bottom: 0px; display: flex; height: 3.6em; left: 0px; position: absolute; right: 0px; width: 680px; opacity: 1; transition: visibility 0.1s ease 0s, opacity 0.1s ease 0s; visibility: visible; overflow: visible; text-shadow: rgba(0, 0, 0, 0.5) 0px 0px 2px;\"><div class=\"vjs-gradient vjs-bottom-gradient\" style=\"box-sizing: inherit; height: 10em; left: 0px; pointer-events: none; position: absolute; right: 0px; background: linear-gradient(0deg, rgba(0, 0, 0, 0.667) 0px, rgba(0, 0, 0, 0.49) 19%, rgba(0, 0, 0, 0.36) 34%, rgba(0, 0, 0, 0.255) 47%, rgba(0, 0, 0, 0.184) 56.5%, rgba(0, 0, 0, 0.13) 65%, rgba(0, 0, 0, 0.082) 73%, rgba(0, 0, 0, 0.05) 80.2%, rgba(0, 0, 0, 0.027) 86.1%, rgba(0, 0, 0, 0.016) 91%, rgba(0, 0, 0, 0.004) 95.2%, rgba(0, 0, 0, 0) 98.2%, transparent); bottom: 0px;\"></div><button class=\"vjs-play-control vjs-control vjs-button vjs-paused\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; margin-left: 1em; appearance: none; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; transition: none 0s ease 0s; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; padding: 0px; position: relative; text-align: left; width: 4.4em; -webkit-box-ordinal-group: 1; order: 0; z-index: 2;\"><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Phát</span><div class=\"vjs-button-icon\" style=\"box-sizing: content-box; display: inline-block; height: 1.6em; margin: auto; padding: 0px; position: absolute; width: 1.2em; opacity: 0.9; inset: 0px;\"></div></button><div class=\"vjs-volume-panel vjs-control vjs-volume-panel-horizontal\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px 1em 0px 0px; padding: 0px; position: relative; width: 3.6em; transition: width 1s ease 0s; display: flex; cursor: default; overflow: visible; z-index: 2;\"><button class=\"vjs-mute-control vjs-control vjs-button vjs-vol-0\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; appearance: none; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; transition: none 0s ease 0s; height: 36px; width: 4em; -webkit-box-flex: 0; flex: 0 0 auto; padding: 0px; position: relative; text-align: left;\"><div class=\"vjs-button-icon\" style=\"box-sizing: content-box; display: inline-block; height: 36px; margin: 0px; padding: 0px; position: relative; width: 3.6em; cursor: pointer; opacity: 0.9; background-position: 50% center; background-repeat: no-repeat; background-size: 55%; transition: opacity 0.2s ease 0s;\"><svg height=\"100%\" width=\"100%\" viewBox=\"0 0 36 36\"><defs><clipPath id=\"vjs-volume-mask1_vjbm-148544\"><path d=\"m 14.35,-0.14 -5.86,5.86 20.73,20.78 5.86,-5.91 z\"></path><path d=\"M 7.07,6.87 -1.11,15.33 19.61,36.11 27.80,27.60 z\"></path><path class=\"vjs-volume-mask\" d=\"M 9.09,5.20 6.47,7.88 26.82,28.77 29.66,25.99 z\" transform=\"translate(20,20)\"></path></clipPath><clipPath id=\"vjs-volume-mask2_vjbm-148544\"><path class=\"vjs-volume-mask\" d=\"m -11.45,-15.55 -4.44,4.51 20.45,20.94 4.55,-4.66 z\" transform=\"translate(20,20)\"></path></clipPath></defs><g clip-path=\"url(#vjs-volume-mask1_vjbm-148544)\"><path d=\"M8,21 L12,21 L17,26 L17,10 L12,15 L8,15 L8,21 Z M19,14 L19,22 C20.48,21.32 21.5,19.77 21.5,18 C21.5,16.26 20.48,14.74 19,14 Z\"></path><path class=\"volume-level-2\" d=\"M19,11.29 C21.89,12.15 24,14.83 24,18 C24,21.17 21.89,23.85 19,24.71 L19,26.77 C23.01,25.86 26,22.28 26,18 C26,13.72 23.01,10.14 19,9.23 L19,11.29 Z\"></path></g><path clip-path=\"url(#vjs-volume-mask2_vjbm-148544)\" d=\"M 9.25,9 7.98,10.27 24.71,27 l 1.27,-1.27 Z\"></path></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Bật âm thanh</span></button><div class=\"vjs-volume-control vjs-control vjs-volume-horizontal\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 1px; margin: 0px; padding: 0px; position: relative; width: 1px; cursor: pointer; display: flex; opacity: 0; visibility: visible; transition: visibility 1s ease 0s, opacity 1s ease 0s, height 1s ease 1s, width 1s ease 0s, left 1s ease 1s, top 1s ease 1s;\"><div tabindex=\"0\" class=\"vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-horizontal\" role=\"slider\" aria-valuenow=\"0\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-label=\"Mức âm lượng\" aria-live=\"polite\" aria-valuetext=\"0%\" style=\"box-sizing: inherit; background: transparent; cursor: pointer; margin: 1.1em 0.6em; padding: 0.7em 0px; position: relative; user-select: none; height: 0.5em; width: 5em;\"><div class=\"vjs-volume-level\" style=\"box-sizing: inherit; font-family: VideoJS; background-color: rgb(255, 255, 255); bottom: 0px; left: 0px; position: absolute; height: 0.3em; width: 0px; margin-top: -0.15em; top: 7px; overflow: visible;\"><span class=\"vjs-control-text\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></div></div></div></div><div class=\"vjs-current-time vjs-time-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px; position: relative; width: auto; font-size: 1.3em; line-height: 2.8em; min-width: 0px; display: inline-block; z-index: 2; color: rgb(238, 238, 238);\"><span class=\"vjs-control-text\" role=\"presentation\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Thời gian hiện tại&nbsp;</span><span class=\"vjs-current-time-display\" aria-live=\"off\" role=\"presentation\" style=\"box-sizing: inherit;\">0:02</span></div><div class=\"vjs-time-control vjs-time-divider\" aria-hidden=\"true\" style=\"box-sizing: inherit; display: inline-block; line-height: 2.8em; -webkit-box-flex: 0; flex: 0 0 auto; font-size: 1.3em; min-width: 0px; padding: 0px; width: auto; margin-top: 0px; z-index: 2; color: rgb(238, 238, 238);\"><div style=\"box-sizing: inherit;\"><span style=\"box-sizing: inherit;\">/</span></div></div><div class=\"vjs-duration vjs-time-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px 1em 0px 0px; position: relative; width: auto; font-size: 1.3em; line-height: 2.8em; min-width: 0px; display: inline-block; z-index: 2; color: rgb(238, 238, 238);\"><span class=\"vjs-control-text\" role=\"presentation\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Độ dài&nbsp;</span><span class=\"vjs-duration-display\" aria-live=\"off\" role=\"presentation\" style=\"box-sizing: inherit;\">8:23</span></div><div class=\"vjs-progress-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 1; flex: 1 1 auto; height: auto; margin: 0px; padding: 0px; position: absolute; width: auto; -webkit-box-align: end; align-items: flex-end; cursor: pointer; display: flex; min-width: 4em; touch-action: none; bottom: 36px; left: 0px; overflow: visible; right: 0px; z-index: 2;\"><div tabindex=\"0\" class=\"vjs-progress-holder vjs-slider vjs-slider-horizontal\" role=\"slider\" aria-valuenow=\"0.51\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-label=\"Thanh tiến trình\" aria-valuetext=\"0:02 của 8:23\" style=\"box-sizing: inherit; -webkit-box-flex: 1; flex: 1 1 auto; height: 3px; transition: height 0.1s ease 0s, margin 0.1s ease 0s; background-color: rgba(115, 133, 159, 0.5); cursor: pointer; margin: 0px 1em; padding: 0px; position: relative; user-select: none; overflow: visible;\"><div class=\"vjs-load-progress\" style=\"box-sizing: inherit; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 47.05px;\"><span class=\"vjs-control-text\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"><span style=\"box-sizing: inherit;\">Đã tải</span>:<span>&nbsp;</span><span class=\"vjs-control-text-loaded-percentage\" style=\"box-sizing: inherit;\">7.13%</span></span><div data-start=\"0\" data-end=\"35.925333\" style=\"box-sizing: inherit; background: rgba(115, 133, 159, 0.75); display: block; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 47.05px; left: 0px;\"></div></div><div class=\"vjs-play-progress vjs-slider-bar\" aria-hidden=\"true\" style=\"box-sizing: inherit; font-family: Roboto, Arial, Helvetica, sans-serif; font-style: normal; font-weight: 400; background: rgb(26, 121, 0); display: block; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 3.3625px; overflow: visible;\"><div class=\"vjs-time-tooltip\" aria-hidden=\"true\" style=\"box-sizing: inherit; background-color: rgba(28, 28, 28, 0.9); border-radius: 0.2em; color: rgb(238, 238, 238); float: right; font-family: Roboto, Arial, Helvetica, sans-serif; font-size: 1.3em; padding: 0.35em 0.7em; pointer-events: none; position: absolute; top: -2.5em; visibility: hidden; z-index: 1; clip: auto; font-weight: 500; line-height: 1.2em; text-align: center; text-shadow: none; right: -30px;\"></div></div></div></div><div class=\"vjs-custom-control-spacer vjs-spacer \" style=\"box-sizing: inherit; display: block; z-index: 2; -webkit-box-flex: 1; flex-grow: 1;\">&nbsp;</div><button class=\"vjs-fullscreen-control vjs-control vjs-button\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px 1em 0px 0px; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; padding: 0px; position: relative; text-align: left; width: auto; -webkit-box-ordinal-group: 21; order: 20; z-index: 2;\"><div class=\"vjs-button-icon vjs-fullscreen-icon\" style=\"box-sizing: content-box; display: inline-block; height: 36px; margin: 0px; padding: 0px; position: relative; width: 3.6em; fill: rgb(255, 255, 255); opacity: 0.9;\"><svg height=\"100%\" width=\"100%\" viewBox=\"0 0 36 36\"><g><path d=\"m 10,16 2,0 0,-4 4,0 0,-2 L 10,10 l 0,6 0,0 z\"></path></g><g><path d=\"m 20,10 0,2 4,0 0,4 2,0 L 26,10 l -6,0 0,0 z\"></path></g><g><path d=\"m 24,24 -4,0 0,2 L 26,26 l 0,-6 -2,0 0,4 0,0 z\"></path></g><g><path d=\"M 12,20 10,20 10,26 l 6,0 0,-2 -4,0 0,-4 0,0 z\"></path></g></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Toàn màn hình</span></button><div class=\"vjs-settings-control vjs-menu-button vjs-menu-button-popup vjs-control vjs-button  \" aria-expanded=\"false\" style=\"box-sizing: inherit; cursor: pointer; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px; position: relative; text-align: left; width: 4em; z-index: 2;\"><button class=\"vjs-settings-button vjs-menu-button vjs-menu-button-popup vjs-button\" type=\"button\" aria-disabled=\"false\" aria-haspopup=\"true\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; height: 36px; width: 3.6em; -webkit-box-ordinal-group: 20; order: 19; padding: 0px;\"><div class=\"vjs-button-icon\" style=\"box-sizing: inherit; height: 36px; opacity: 0.9; padding: 0px; transition: opacity 0.2s ease 0s; width: 3.6em;\"><svg viewBox=\"0 0 36 36\"><path d=\"m 23.94,18.78 c .03,-0.25 .05,-0.51 .05,-0.78 0, -0.27 -0.02,-0.52 -0.05,-0.78 l 1.68,-1.32 c .15,-0.12 .19,-0.33 .09, -0.51 l -1.6,-2.76 c -0.09,-0.17 -0.31,-0.24 -0.48,-0.17 l -1.99,.8 c  -0.41,-0.32 -0.86,-0.58 -1.35,-0.78 l -0.30,-2.12 c -0.02,-0.19 -0.19, -0.33 -0.39,-0.33 l -3.2,0 c -0.2,0 -0.36,.14 -0.39,.33 l -0.30,2.12 c  -0.48,.2 -0.93,.47 -1.35,.78 l -1.99,-0.8 c -0.18,-0.07 -0.39,0 -0.48, .17 l -1.6,2.76 c -0.10,.17 -0.05,.39 .09,.51 l 1.68,1.32 c -0.03,.25  -0.05,.52 -0.05,.78 0,.26 .02,.52 .05,.78 l -1.68,1.32 c -0.15,.12  -0.19,.33 -0.09,.51 l 1.6,2.76 c .09,.17 .31,.24 .48,.17 l 1.99,-0.8 c  .41,.32 .86,.58 1.35,.78 l .30,2.12 c .02,.19 .19,.33 .39,.33 l 3.2,0 c  .2,0 .36,-0.14 .39,-0.33 l .30,-2.12 c .48,-0.2 .93,-0.47 1.35,-0.78 l  1.99,.8 c .18,.07 .39,0 .48,-0.17 l 1.6,-2.76 c .09,-0.17 .05,-0.39  -0.09,-0.51 l -1.68,-1.32 0,0 z m -5.94,2.01 c -1.54,0 -2.8,-1.25 -2.8, -2.8 0,-1.54 1.25,-2.8 2.8,-2.8 1.54,0 2.8,1.25 2.8,2.8 0,1.54 -1.25, 2.8 -2.8,2.8 l 0,0 z\"></path></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Cài đặt</span></button></div></div><div class=\"vjs-menu vjs-settings-menu\" role=\"presentation\" style=\"box-sizing: inherit; text-shadow: rgba(0, 0, 0, 0.5) 0px 0px 2px; background-color: rgba(28, 28, 28, 0.9); white-space: nowrap; bottom: 4.8em; opacity: 0; overflow: hidden; position: absolute; right: 0.9em; transition: opacity 0.1s ease 0s; visibility: hidden; width: auto; will-change: width, height; z-index: 4; zoom: 1;\"><div class=\"vjs-menu-content vjs-main-submenu vjs-active-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 18em; position: relative; transition: background 0.2s ease 0s; width: auto;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 0px; border-top: 0px; overflow: auto; padding: 0px; position: relative; max-height: 283px;\"><li class=\"vjs-menu-item vjs-menu-item-next\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 3.6em 0px 1.5em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0IiBmaWxsPSIjRkZGIj48cGF0aCBkPSJtMTIuNTkgMjAuMzQgNC41OC00LjU5LTQuNTgtNC41OUwxNCA5Ljc1bDYgNi02IDZ6Ii8+PC9zdmc+&quot;) right 0.9em center / 3.2em no-repeat transparent;\"><span class=\"vjs-menu-item-content\" style=\"box-sizing: inherit; float: right; font-size: 1.2em; margin-left: 3em;\"><span style=\"box-sizing: inherit;\"></span><span class=\"vjs-minor-label\" style=\"box-sizing: inherit; color: rgb(204, 204, 204); font-size: 0.92em; padding-left: 0.2em;\"></span></span><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item vjs-menu-item-next\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 3.6em 0px 1.5em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0IiBmaWxsPSIjRkZGIj48cGF0aCBkPSJtMTIuNTkgMjAuMzQgNC41OC00LjU5LTQuNTgtNC41OUwxNCA5Ljc1bDYgNi02IDZ6Ii8+PC9zdmc+&quot;) right 0.9em center / 3.2em no-repeat transparent;\"><span class=\"vjs-menu-item-content\" style=\"box-sizing: inherit; float: right; font-size: 1.2em; margin-left: 3em;\"><span style=\"box-sizing: inherit;\"></span><span class=\"vjs-minor-label\" style=\"box-sizing: inherit; color: rgb(204, 204, 204); font-size: 0.92em; padding-left: 0.2em;\"></span></span><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul></div><div class=\"vjs-menu-content vjs-speed-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 12em; position: fixed; transition: background 0.2s ease 0s; width: auto; left: 0px; top: 0px; visibility: hidden;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 4em 0px 0px; border-top: 1px solid rgba(255, 255, 255, 0.3); overflow: auto; padding: 0px; position: relative;\"><li class=\"vjs-menu-item vjs-selected\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"true\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; background: url(&quot;data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGIiBoZWlnaHQ9IjI0IiB3aWR0aD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGQ9Ik05IDE2LjIgNC44IDEybC0xLjQgMS40TDkgMTkgMjEgN2wtMS40LTEuNEw5IDE2LjJ6Ii8+PC9zdmc+&quot;) 0.8em center / 1.5em no-repeat transparent; color: rgb(238, 238, 238); clear: both; cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul><li class=\"vjs-menu-item vjs-submenu-title\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: border-box; font-size: 1em; line-height: 4.5em; list-style: none; margin: 0px 0px 0.2em; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 4.5em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiNGRkYiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0Ij48cGF0aCBkPSJtMTkuNDEgMjAuMDktNC41OC00LjU5IDQuNTgtNC41OUwxOCA5LjVsLTYgNiA2IDZ6Ii8+PC9zdmc+&quot;) left 0.3em center / 3.2em no-repeat transparent; position: absolute; top: 0px;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></div><div class=\"vjs-menu-content vjs-quality-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 12em; position: fixed; transition: background 0.2s ease 0s; width: auto; left: 0px; top: 0px; visibility: hidden;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 4em 0px 0px; border-top: 1px solid rgba(255, 255, 255, 0.3); overflow: auto; padding: 0px; position: relative;\"><li class=\"vjs-menu-item\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item vjs-selected\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"true\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; background: url(&quot;data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGIiBoZWlnaHQ9IjI0IiB3aWR0aD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGQ9Ik05IDE2LjIgNC44IDEybC0xLjQgMS40TDkgMTkgMjEgN2wtMS40LTEuNEw5IDE2LjJ6Ii8+PC9zdmc+&quot;) 0.8em center / 1.5em no-repeat transparent; color: rgb(238, 238, 238); clear: both; cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul><li class=\"vjs-menu-item vjs-submenu-title\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: border-box; font-size: 1em; line-height: 4.5em; list-style: none; margin: 0px 0px 0.2em; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 4.5em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiNGRkYiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0Ij48cGF0aCBkPSJtMTkuNDEgMjAuMDktNC41OC00LjU5IDQuNTgtNC41OUwxOCA5LjVsLTYgNiA2IDZ6Ii8+PC9zdmc+&quot;) left 0.3em center / 3.2em no-repeat transparent; position: absolute; top: 0px;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></div></div></div></div></div><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Những thiết kế sắc màu của Etro (Video: Etro).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 5\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay4anhgq-1642147348712.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 5\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay4anhgq-1642147348712.jpg\" data-photo-id=\"1790203\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790203\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Thay vì sử dụng những tông màu trung tính \"truyền thống\", hàng loạt thương hiệu lớn như Canali, Qasimi, Moschino, Etro, Dolce &amp; Gabbana, Casablanca, Fendi, Dries van Noten, Louis Vuitton, Hermès chọn các tông màu điệu đà, bảy sắc cầu vồng cho các mẫu thời trang mới nhất dành cho nam giới. Dolce &amp; Gabbana và Moschino sử dụng những họa tiết sặc sỡ lấy cảm hứng từ mùa hè nước Italia đưa vào những bộ vest trong khi Etro và Hermès đưa các tông màu của hoa quả và những sắc thái ngọt ngào vào những chiếc áo len cực kỳ hấp dẫn (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 6\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay5anhgq-1642147512205.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 6\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay5anhgq-1642147512205.jpg\" data-photo-id=\"1790210\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790210\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Dries van Noten, Lanvin, Giorgio Armani, Ermenegildo Zegna, Fendi, Homme Plissé Issey Miyake, Paul Smith, Wooyoungmi, Casablanca, Dior, Rick Owens, Louis Vuitton, Hermès ra mắt hàng loạt mẫu quần lửng bằng nhiều chất liệu như da bóng, kaki, cotton... dành cho các anh chàng trong mùa xuân hè năm nay. Sự kết hợp của áo vest và quần lửng tạo nên phong cách thú vị, tươi mới cho người mặc. Trang phục này phù hợp với những buổi đi chơi, ra biển, dã ngoại... (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 7\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay6anhgq-1642147723575.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 7\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay6anhgq-1642147723575.jpg\" data-photo-id=\"1790234\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790234\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Nhiều nhà mốt hàng đầu đã chứng minh rằng, trang phục vest màu đen sẽ không bao giờ lỗi thời, được ưa chuộng từ mùa này qua mùa khác. Dunhill, Paul Smith và Dolce &amp; Gabbana đều cho ra mắt những bộ vest đen được cắt may hoàn hảo, đặc biệt là không có bộ nào được mặc với áo sơ mi hoặc kết hợp với cà vạt (Ảnh: GQ).</p></figcaption></figure><figure class=\"video\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div data-module=\"video-article-player\" poster=\"https://icdn.dantri.com.vn/thumb-video/2022/01/14/mens-collection-spring-summer-2022-erdem-VXJyNTuGkdk-1642149618002/0_00_52.jpg\" width=\"1280\" height=\"720\" data-src=\"2022/01/14/mens-collection-spring-summer-2022-erdem-VXJyNTuGkdk-1642149618002.mp4\" data-video-key=\"cbd0a41f0be9bd837d1ba4005792cca0\" data-video-id=\"148548\" style=\"box-sizing: border-box; min-height: 383px;\"><div id=\"video-wrap-vjbm-148548\" class=\"\" style=\"box-sizing: border-box;\"><div class=\"video-js vjs-theme-dantri vjs-fluid vjbm-148548-dimensions vjs-controls-enabled vjs-workinghover vjs-v7 vjs-has-started vjs-paused vjs-user-inactive\" id=\"vjbm-148548\" tabindex=\"-1\" role=\"region\" lang=\"vi\" aria-label=\"Trình phát Video\" style=\"box-sizing: border-box; width: 680px; height: 0px; padding: 382.5px 0px 0px; background-color: rgb(0, 0, 0); color: rgb(255, 255, 255); display: block; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-style: normal; font-weight: 400; line-height: 1; position: relative; vertical-align: top; word-break: normal; outline: none; max-width: 100%;\"><div class=\"vjs-text-track-display\" aria-live=\"off\" aria-atomic=\"true\" style=\"box-sizing: inherit; inset: 0px 0px 3em; pointer-events: none; position: absolute;\"><div style=\"box-sizing: inherit; position: absolute; inset: 0px; margin: 10.2px;\"></div></div><div class=\"vjs-control-bar\" dir=\"ltr\" style=\"box-sizing: inherit; background: none; bottom: 0px; display: flex; height: 3.6em; left: 0px; position: absolute; right: 0px; width: 680px; opacity: 1; transition: visibility 0.1s ease 0s, opacity 0.1s ease 0s; visibility: visible; color: rgb(255, 255, 255); overflow: visible; text-shadow: rgba(0, 0, 0, 0.5) 0px 0px 2px;\"><div class=\"vjs-gradient vjs-bottom-gradient\" style=\"box-sizing: inherit; height: 10em; left: 0px; pointer-events: none; position: absolute; right: 0px; background: linear-gradient(0deg, rgba(0, 0, 0, 0.667) 0px, rgba(0, 0, 0, 0.49) 19%, rgba(0, 0, 0, 0.36) 34%, rgba(0, 0, 0, 0.255) 47%, rgba(0, 0, 0, 0.184) 56.5%, rgba(0, 0, 0, 0.13) 65%, rgba(0, 0, 0, 0.082) 73%, rgba(0, 0, 0, 0.05) 80.2%, rgba(0, 0, 0, 0.027) 86.1%, rgba(0, 0, 0, 0.016) 91%, rgba(0, 0, 0, 0.004) 95.2%, rgba(0, 0, 0, 0) 98.2%, transparent); bottom: 0px;\"></div><button class=\"vjs-play-control vjs-control vjs-button vjs-paused\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px 0px 0px 1em; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; padding: 0px; position: relative; text-align: left; width: 4.4em; -webkit-box-ordinal-group: 1; order: 0; z-index: 2;\"><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Phát</span><div class=\"vjs-button-icon\" style=\"box-sizing: content-box; display: inline-block; height: 1.6em; margin: auto; padding: 0px; position: absolute; width: 1.2em; opacity: 0.9; inset: 0px;\"></div></button><div class=\"vjs-volume-panel vjs-control vjs-volume-panel-horizontal\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px 1em 0px 0px; padding: 0px; position: relative; text-align: left; width: 3.6em; transition: width 1s ease 0s; display: flex; cursor: default; overflow: visible; z-index: 2;\"><button class=\"vjs-mute-control vjs-control vjs-button vjs-vol-0\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; height: 36px; width: 4em; -webkit-box-flex: 0; flex: 0 0 auto; padding: 0px; position: relative; text-align: left;\"><div class=\"vjs-button-icon\" style=\"box-sizing: content-box; display: inline-block; height: 36px; margin: 0px; padding: 0px; position: relative; width: 3.6em; cursor: pointer; opacity: 0.9; background-position: 50% center; background-repeat: no-repeat; background-size: 55%; transition: opacity 0.2s ease 0s;\"><svg height=\"100%\" width=\"100%\" viewBox=\"0 0 36 36\"><defs><clipPath id=\"vjs-volume-mask1_vjbm-148548\"><path d=\"m 14.35,-0.14 -5.86,5.86 20.73,20.78 5.86,-5.91 z\"></path><path d=\"M 7.07,6.87 -1.11,15.33 19.61,36.11 27.80,27.60 z\"></path><path class=\"vjs-volume-mask\" d=\"M 9.09,5.20 6.47,7.88 26.82,28.77 29.66,25.99 z\" transform=\"translate(20,20)\"></path></clipPath><clipPath id=\"vjs-volume-mask2_vjbm-148548\"><path class=\"vjs-volume-mask\" d=\"m -11.45,-15.55 -4.44,4.51 20.45,20.94 4.55,-4.66 z\" transform=\"translate(20,20)\"></path></clipPath></defs><g clip-path=\"url(#vjs-volume-mask1_vjbm-148548)\"><path d=\"M8,21 L12,21 L17,26 L17,10 L12,15 L8,15 L8,21 Z M19,14 L19,22 C20.48,21.32 21.5,19.77 21.5,18 C21.5,16.26 20.48,14.74 19,14 Z\"></path><path class=\"volume-level-2\" d=\"M19,11.29 C21.89,12.15 24,14.83 24,18 C24,21.17 21.89,23.85 19,24.71 L19,26.77 C23.01,25.86 26,22.28 26,18 C26,13.72 23.01,10.14 19,9.23 L19,11.29 Z\"></path></g><path clip-path=\"url(#vjs-volume-mask2_vjbm-148548)\" d=\"M 9.25,9 7.98,10.27 24.71,27 l 1.27,-1.27 Z\"></path></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Bật âm thanh</span></button><div class=\"vjs-volume-control vjs-control vjs-volume-horizontal\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 1px; margin: 0px; padding: 0px; position: relative; text-align: left; width: 1px; cursor: pointer; display: flex; opacity: 0; visibility: visible; transition: visibility 1s ease 0s, opacity 1s ease 0s, height 1s ease 1s, width 1s ease 0s, left 1s ease 1s, top 1s ease 1s;\"><div tabindex=\"0\" class=\"vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-horizontal\" role=\"slider\" aria-valuenow=\"0\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-label=\"Mức âm lượng\" aria-live=\"polite\" aria-valuetext=\"0%\" style=\"box-sizing: inherit; background: transparent; cursor: pointer; margin: 1.1em 0.6em; padding: 0.7em 0px; position: relative; user-select: none; height: 0.5em; width: 5em;\"><div class=\"vjs-volume-level\" style=\"box-sizing: inherit; font-family: VideoJS; font-style: normal; font-weight: 400; background-color: rgb(255, 255, 255); bottom: 0px; left: 0px; position: absolute; height: 0.3em; width: 0px; margin-top: -0.15em; top: 7px; overflow: visible;\"><span class=\"vjs-control-text\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></div></div></div></div><div class=\"vjs-current-time vjs-time-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px; position: relative; text-align: left; width: auto; font-size: 1.3em; line-height: 2.8em; min-width: 0px; display: inline-block; z-index: 2; color: rgb(238, 238, 238);\"><span class=\"vjs-control-text\" role=\"presentation\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Thời gian hiện tại&nbsp;</span><span class=\"vjs-current-time-display\" aria-live=\"off\" role=\"presentation\" style=\"box-sizing: inherit;\">0:00</span></div><div class=\"vjs-time-control vjs-time-divider\" aria-hidden=\"true\" style=\"box-sizing: inherit; display: inline-block; line-height: 2.8em; -webkit-box-flex: 0; flex: 0 0 auto; font-size: 1.3em; min-width: 0px; padding: 0px; width: auto; margin-top: 0px; z-index: 2; color: rgb(238, 238, 238);\"><div style=\"box-sizing: inherit;\"><span style=\"box-sizing: inherit;\">/</span></div></div><div class=\"vjs-duration vjs-time-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px 1em 0px 0px; position: relative; text-align: left; width: auto; font-size: 1.3em; line-height: 2.8em; min-width: 0px; display: inline-block; z-index: 2; color: rgb(238, 238, 238);\"><span class=\"vjs-control-text\" role=\"presentation\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Độ dài&nbsp;</span><span class=\"vjs-duration-display\" aria-live=\"off\" role=\"presentation\" style=\"box-sizing: inherit;\">1:23</span></div><div class=\"vjs-progress-control vjs-control\" style=\"box-sizing: inherit; -webkit-box-flex: 1; flex: 1 1 auto; height: auto; margin: 0px; padding: 0px; position: absolute; text-align: left; width: auto; -webkit-box-align: end; align-items: flex-end; cursor: pointer; display: flex; min-width: 4em; touch-action: none; bottom: 36px; left: 0px; overflow: visible; right: 0px; z-index: 2;\"><div tabindex=\"0\" class=\"vjs-progress-holder vjs-slider vjs-slider-horizontal\" role=\"slider\" aria-valuenow=\"1.10\" aria-valuemin=\"0\" aria-valuemax=\"100\" aria-label=\"Thanh tiến trình\" aria-valuetext=\"0:00 của 1:23\" style=\"box-sizing: inherit; -webkit-box-flex: 1; flex: 1 1 auto; height: 3px; transition: height 0.1s ease 0s, margin 0.1s ease 0s; background-color: rgba(115, 133, 159, 0.5); cursor: pointer; margin: 0px 1em; padding: 0px; position: relative; user-select: none; overflow: visible;\"><div class=\"vjs-load-progress\" style=\"box-sizing: inherit; background: rgba(115, 133, 159, 0.5); display: block; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 285.575px;\"><span class=\"vjs-control-text\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"><span style=\"box-sizing: inherit;\">Đã tải</span>:<span>&nbsp;</span><span class=\"vjs-control-text-loaded-percentage\" style=\"box-sizing: inherit;\">43.27%</span></span><div data-start=\"0\" data-end=\"35.967994\" style=\"box-sizing: inherit; background: rgba(115, 133, 159, 0.75); display: block; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 285.575px; left: 0px;\"></div></div><div class=\"vjs-play-progress vjs-slider-bar\" aria-hidden=\"true\" style=\"box-sizing: inherit; font-family: Roboto, Arial, Helvetica, sans-serif; font-style: normal; font-weight: 400; background: rgb(26, 121, 0); display: block; height: 3px; margin: 0px; padding: 0px; position: absolute; width: 7.25px; overflow: visible;\"><div class=\"vjs-time-tooltip\" aria-hidden=\"true\" style=\"box-sizing: inherit; background-color: rgba(28, 28, 28, 0.9); border-radius: 0.2em; color: rgb(238, 238, 238); float: right; font-family: Roboto, Arial, Helvetica, sans-serif; font-size: 1.3em; padding: 0.35em 0.7em; pointer-events: none; position: absolute; top: -2.5em; visibility: hidden; z-index: 1; clip: auto; font-weight: 500; line-height: 1.2em; text-align: center; text-shadow: none; right: -26px;\"></div></div></div></div><div class=\"vjs-custom-control-spacer vjs-spacer \" style=\"box-sizing: inherit; display: block; z-index: 2; -webkit-box-flex: 1; flex-grow: 1;\">&nbsp;</div><button class=\"vjs-fullscreen-control vjs-control vjs-button\" type=\"button\" aria-disabled=\"false\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px 1em 0px 0px; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; padding: 0px; position: relative; text-align: left; width: auto; -webkit-box-ordinal-group: 21; order: 20; z-index: 2;\"><div class=\"vjs-button-icon vjs-fullscreen-icon\" style=\"box-sizing: content-box; display: inline-block; height: 36px; margin: 0px; padding: 0px; position: relative; width: 3.6em; fill: rgb(255, 255, 255); opacity: 0.9;\"><svg height=\"100%\" width=\"100%\" viewBox=\"0 0 36 36\"><g><path d=\"m 10,16 2,0 0,-4 4,0 0,-2 L 10,10 l 0,6 0,0 z\"></path></g><g><path d=\"m 20,10 0,2 4,0 0,4 2,0 L 26,10 l -6,0 0,0 z\"></path></g><g><path d=\"m 24,24 -4,0 0,2 L 26,26 l 0,-6 -2,0 0,4 0,0 z\"></path></g><g><path d=\"M 12,20 10,20 10,26 l 6,0 0,-2 -4,0 0,-4 0,0 z\"></path></g></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Toàn màn hình</span></button><div class=\"vjs-settings-control vjs-menu-button vjs-menu-button-popup vjs-control vjs-button  \" aria-expanded=\"false\" style=\"box-sizing: inherit; cursor: pointer; -webkit-box-flex: 0; flex: 0 0 auto; height: 36px; margin: 0px; padding: 0px; position: relative; text-align: left; width: 4em; z-index: 2;\"><button class=\"vjs-settings-button vjs-menu-button vjs-menu-button-popup vjs-button\" type=\"button\" aria-disabled=\"false\" aria-haspopup=\"true\" style=\"box-sizing: inherit; cursor: pointer; margin: 0px; font-family: inherit; font-size: inherit; line-height: inherit; appearance: none; background: none; border: none; color: inherit; display: inline-block; text-decoration: none; text-transform: none; transition: none 0s ease 0s; height: 36px; width: 3.6em; -webkit-box-ordinal-group: 20; order: 19; padding: 0px;\"><div class=\"vjs-button-icon\" style=\"box-sizing: inherit; height: 36px; opacity: 0.9; padding: 0px; transition: opacity 0.2s ease 0s; width: 3.6em;\"><svg viewBox=\"0 0 36 36\"><path d=\"m 23.94,18.78 c .03,-0.25 .05,-0.51 .05,-0.78 0, -0.27 -0.02,-0.52 -0.05,-0.78 l 1.68,-1.32 c .15,-0.12 .19,-0.33 .09, -0.51 l -1.6,-2.76 c -0.09,-0.17 -0.31,-0.24 -0.48,-0.17 l -1.99,.8 c  -0.41,-0.32 -0.86,-0.58 -1.35,-0.78 l -0.30,-2.12 c -0.02,-0.19 -0.19, -0.33 -0.39,-0.33 l -3.2,0 c -0.2,0 -0.36,.14 -0.39,.33 l -0.30,2.12 c  -0.48,.2 -0.93,.47 -1.35,.78 l -1.99,-0.8 c -0.18,-0.07 -0.39,0 -0.48, .17 l -1.6,2.76 c -0.10,.17 -0.05,.39 .09,.51 l 1.68,1.32 c -0.03,.25  -0.05,.52 -0.05,.78 0,.26 .02,.52 .05,.78 l -1.68,1.32 c -0.15,.12  -0.19,.33 -0.09,.51 l 1.6,2.76 c .09,.17 .31,.24 .48,.17 l 1.99,-0.8 c  .41,.32 .86,.58 1.35,.78 l .30,2.12 c .02,.19 .19,.33 .39,.33 l 3.2,0 c  .2,0 .36,-0.14 .39,-0.33 l .30,-2.12 c .48,-0.2 .93,-0.47 1.35,-0.78 l  1.99,.8 c .18,.07 .39,0 .48,-0.17 l 1.6,-2.76 c .09,-0.17 .05,-0.39  -0.09,-0.51 l -1.68,-1.32 0,0 z m -5.94,2.01 c -1.54,0 -2.8,-1.25 -2.8, -2.8 0,-1.54 1.25,-2.8 2.8,-2.8 1.54,0 2.8,1.25 2.8,2.8 0,1.54 -1.25, 2.8 -2.8,2.8 l 0,0 z\"></path></svg></div><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\">Cài đặt</span></button></div></div><div class=\"vjs-menu vjs-settings-menu\" role=\"presentation\" style=\"box-sizing: inherit; text-shadow: rgba(0, 0, 0, 0.5) 0px 0px 2px; background-color: rgba(28, 28, 28, 0.9); white-space: nowrap; bottom: 4.8em; opacity: 0; overflow: hidden; position: absolute; right: 0.9em; transition: opacity 0.1s ease 0s; visibility: hidden; width: auto; will-change: width, height; z-index: 4; zoom: 1;\"><div class=\"vjs-menu-content vjs-main-submenu vjs-active-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 18em; position: relative; transition: background 0.2s ease 0s; width: auto;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 0px; border-top: 0px; overflow: auto; padding: 0px; position: relative; max-height: 283px;\"><li class=\"vjs-menu-item vjs-menu-item-next\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 3.6em 0px 1.5em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0IiBmaWxsPSIjRkZGIj48cGF0aCBkPSJtMTIuNTkgMjAuMzQgNC41OC00LjU5LTQuNTgtNC41OUwxNCA5Ljc1bDYgNi02IDZ6Ii8+PC9zdmc+&quot;) right 0.9em center / 3.2em no-repeat transparent;\"><span class=\"vjs-menu-item-content\" style=\"box-sizing: inherit; float: right; font-size: 1.2em; margin-left: 3em;\"><span style=\"box-sizing: inherit;\"></span><span class=\"vjs-minor-label\" style=\"box-sizing: inherit; color: rgb(204, 204, 204); font-size: 0.92em; padding-left: 0.2em;\"></span></span><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item vjs-menu-item-next\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 3.6em 0px 1.5em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0IiBmaWxsPSIjRkZGIj48cGF0aCBkPSJtMTIuNTkgMjAuMzQgNC41OC00LjU5LTQuNTgtNC41OUwxNCA5Ljc1bDYgNi02IDZ6Ii8+PC9zdmc+&quot;) right 0.9em center / 3.2em no-repeat transparent;\"><span class=\"vjs-menu-item-content\" style=\"box-sizing: inherit; float: right; font-size: 1.2em; margin-left: 3em;\"><span style=\"box-sizing: inherit;\"></span><span class=\"vjs-minor-label\" style=\"box-sizing: inherit; color: rgb(204, 204, 204); font-size: 0.92em; padding-left: 0.2em;\"></span></span><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul></div><div class=\"vjs-menu-content vjs-speed-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 12em; position: fixed; transition: background 0.2s ease 0s; width: auto; left: 0px; top: 0px; visibility: hidden;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 4em 0px 0px; border-top: 1px solid rgba(255, 255, 255, 0.3); overflow: auto; padding: 0px; position: relative;\"><li class=\"vjs-menu-item vjs-selected\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"true\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; background: url(&quot;data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGIiBoZWlnaHQ9IjI0IiB3aWR0aD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGQ9Ik05IDE2LjIgNC44IDEybC0xLjQgMS40TDkgMTkgMjEgN2wtMS40LTEuNEw5IDE2LjJ6Ii8+PC9zdmc+&quot;) 0.8em center / 1.5em no-repeat transparent; color: rgb(238, 238, 238); clear: both; cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul><li class=\"vjs-menu-item vjs-submenu-title\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: border-box; font-size: 1em; line-height: 4.5em; list-style: none; margin: 0px 0px 0.2em; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 4.5em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiNGRkYiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0Ij48cGF0aCBkPSJtMTkuNDEgMjAuMDktNC41OC00LjU5IDQuNTgtNC41OUwxOCA5LjVsLTYgNiA2IDZ6Ii8+PC9zdmc+&quot;) left 0.3em center / 3.2em no-repeat transparent; position: absolute; top: 0px;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></div><div class=\"vjs-menu-content vjs-quality-submenu\" role=\"menu\" style=\"box-sizing: inherit; display: block; font-family: Arial, Helvetica, sans-serif; margin: 0px; overflow: hidden; padding: 0.5em 0px; cursor: default; min-width: 12em; position: fixed; transition: background 0.2s ease 0s; width: auto; left: 0px; top: 0px; visibility: hidden;\"><ul class=\"vjs-menu-submenu\" style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; line-height: inherit; list-style-position: outside; margin: 4em 0px 0px; border-top: 1px solid rgba(255, 255, 255, 0.3); overflow: auto; padding: 0px; position: relative;\"><li class=\"vjs-menu-item vjs-quality-hd\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em; position: relative;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"false\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li><li class=\"vjs-menu-item vjs-selected\" tabindex=\"-1\" role=\"menuitemradio\" aria-disabled=\"false\" aria-checked=\"true\" style=\"box-sizing: inherit; font-size: 1em; line-height: 3.3em; list-style: none; margin: 0px; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; background: url(&quot;data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjRkZGIiBoZWlnaHQ9IjI0IiB3aWR0aD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGQ9Ik05IDE2LjIgNC44IDEybC0xLjQgMS40TDkgMTkgMjEgN2wtMS40LTEuNEw5IDE2LjJ6Ii8+PC9zdmc+&quot;) 0.8em center / 1.5em no-repeat transparent; color: rgb(238, 238, 238); clear: both; cursor: pointer; height: 3.3em;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></ul><li class=\"vjs-menu-item vjs-submenu-title\" tabindex=\"-1\" role=\"menuitem\" aria-disabled=\"false\" style=\"box-sizing: border-box; font-size: 1em; line-height: 4.5em; list-style: none; margin: 0px 0px 0.2em; padding: 0px 2.1em 0px 3.6em; text-align: left; text-transform: none; clear: both; color: rgb(238, 238, 238); cursor: pointer; height: 4.5em; background: url(&quot;data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGZpbGw9IiNGRkYiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAzMiAzMiIgd2lkdGg9IjI0Ij48cGF0aCBkPSJtMTkuNDEgMjAuMDktNC41OC00LjU5IDQuNTgtNC41OUwxOCA5LjVsLTYgNiA2IDZ6Ii8+PC9zdmc+&quot;) left 0.3em center / 3.2em no-repeat transparent; position: absolute; top: 0px;\"><span class=\"vjs-menu-item-text\" style=\"box-sizing: inherit; font-size: 1.3em; font-weight: 500;\"></span><span class=\"vjs-control-text\" aria-live=\"polite\" style=\"box-sizing: inherit; clip: rect(0px, 0px, 0px, 0px); border: 0px; height: 1px; overflow: hidden; padding: 0px; position: absolute; width: 1px;\"></span></li></div></div></div></div></div><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Loạt trang phục lạ mắt của Erdem (Video: Erdem).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 8\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay7anhgq-1642147862160.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 8\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay7anhgq-1642147862160.jpg\" data-photo-id=\"1790236\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790236\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Những chiếc áo sơ mi rộng quá khổ như trong ảnh thuộc về các nhà mốt Dior, Wales Bonner, Erdem, Giorgio Armani, Dries van Noten. Ưu điểm của những chiếc áo này là tạo cho người mặc cảm giác dễ chịu, nhẹ nhàng, bồng bềnh. Trong tiết trời mùa hè nóng nực, những chiếc áo rộng rãi, dễ chịu trên chất liệu siêu nhẹ sẽ giúp người mặc cảm thấy mát mẻ hơn (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 9\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay8anhgq-1642148035664.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 9\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay8anhgq-1642148035664.jpg\" data-photo-id=\"1790243\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790243\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Những mẫu áo \"thủng lỗ chỗ\" của Rick Owens, Burberry, Courregés, Y-Project, Loewe là một trong những xu hướng mới nhất trong thời trang nam mùa này. Chọn lựa những bộ đồ ấn tượng là sở thích thường được các anh chàng trẻ tuổi hướng tới (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 10\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay9anhgq-1642148159306.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 10\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay9anhgq-1642148159306.jpg\" data-photo-id=\"1790248\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790248\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Những đôi sandal kiểu dáng thoải mái và thoáng mát, dễ chịu được Tod\'s, JW Anderson, Dior, Qasimi, Dolce &amp; Gabbana, Fendi, Lanvin, Dries van Noten gửi tới phái mạnh trong mùa xuân hè 2022 này. Các thương hiệu cho rằng, các đôi sandal, dép lê sẽ luôn mang lại cảm giác rất thoải mái cho người sử dụng và nó thậm chí có tính ứng dụng cao hơn cả những đôi giày kiểu cách (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 11\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay10anhgq-1642148398040.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 11\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay10anhgq-1642148398040.jpg\" data-photo-id=\"1790256\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790256\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Nhiều nhà thiết kế ở Paris và Milan đã đưa phong cách thể thao vào những chiếc áo khoác kiểu dáng cổ điển trong bộ sưu tập của họ. Louis Vuitton, Dior và Moschino tung ra các mẫu áo khoác mỏng được trang trí bằng các ký tự trên áo tạo cho người mặc cảm giác trẻ trung, năng động (Ảnh: GQ).</p></figcaption></figure><figure class=\"image align-center\" contenteditable=\"false\" style=\"box-sizing: border-box; margin: 28px auto; padding: 0px; float: none; color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><img title=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 12\" src=\"https://icdn.dantri.com.vn/thumb_w/770/2022/01/14/vay11anhgq-1642148580203.jpg\" alt=\"Váy, áo cắt xẻ... tạo thành xu hướng xuân hè cho nam giới - 12\" data-width=\"1600\" data-height=\"900\" data-original=\"https://icdn.dantri.com.vn/2022/01/14/vay11anhgq-1642148580203.jpg\" data-photo-id=\"1790263\" data-track-content=\"\" data-content-name=\"article-content-image\" data-content-piece=\"article-content-image_1790263\" data-content-target=\"/giai-tri/vay-ao-cat-xe-tao-thanh-xu-huong-xuan-he-cho-nam-gioi-20220114145821010.htm\" style=\"box-sizing: border-box; max-width: 100%; height: auto; width: 680px; cursor: zoom-in;\"><figcaption style=\"box-sizing: border-box; margin: 8px 0px 0px; padding: 0px 30px; font-size: 14px; line-height: 22px; font-style: italic; text-align: center; color: rgb(102, 102, 102);\"><p style=\"box-sizing: border-box; margin: 0px;\">Trang phục dạ tiệc bắt mắt của Dolce &amp; Gabbana, Moschino, Etro, Dior với tông màu nổi bật trên nền chất liệu lụa bóng hoặc ánh kim sẽ giúp các anh chàng trở nên rất ấn tượng khi tham dự các sự kiện (Ảnh: GQ).</p></figcaption></figure>', NULL, '/storage/photos/1/Blog/vayaocatxechonam-1642143302-3321-1642143336.jpg', 'Hot Trend 2022', 2, NULL, 1, 'active', '2022-08-08 18:31:56', '2022-08-08 18:31:56');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Đàn ông Italy đọ phong cách ở lễ hội thời trang', 'dan-ong-italy-do-phong-cach-o-le-hoi-thoi-trang', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Noto Serif&quot;, serif; font-size: 17.6px; text-align: center;\">Lễ hội thời trang Pitti Uomo là dịp để giới mộ điệu được chiêm ngưỡng style lịch lãm song cũng rất \"ngầu\" của đàn ông Italy.</span><br></p>', 'Đang cập nhật thêm....<br><div class=\"the-article-body\" style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px 0px 0px -300px; padding: 0px; border: 0px; font-size: 1.1em; vertical-align: baseline; background: transparent; text-size-adjust: 100%; float: left; width: 600px; position: relative; font-family: &quot;Noto Serif&quot;, serif; color: rgb(51, 51, 51); line-height: 28px; clear: both; left: 500px;\"><div class=\"z-photoviewer-wrapper  z-has-caption\" align=\"center\" style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%; position: relative; clear: both;\"><table class=\"picture\" align=\"center\" style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin-top: 80px; margin-right: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 0.9em; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; text-size-adjust: 100%; border-spacing: 0px; font-family: sans-serif; line-height: 1.5; margin-left: -180px !important; width: 960px !important;\"><tbody style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><tr style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><td class=\"pic\" style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%; position: relative; cursor: pointer;\"><br></td></tr><tr style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; background: transparent; text-size-adjust: 100%;\"><td class=\"pCaption caption\" style=\"text-rendering: geometricprecision; outline: 0px; -webkit-font-smoothing: antialiased; margin: 0px; padding: 14px 96px 30px; border: 0px; font-size: 1.2em; vertical-align: baseline; background: transparent; text-size-adjust: 100%; position: relative; line-height: 1.618;\"><br></td></tr></tbody></table></div></div>', NULL, '/storage/photos/1/Blog/Pitti-Uomo-thoi-trang-quy-ong.jpg', 'Phụ kiện', 5, NULL, 1, 'active', '2022-08-08 18:38:47', '2022-08-08 18:43:17'),
(10, 'Chiến thuật của Nga làm tan rã đội hình 10.000 quân của Ukraine', 'chien-thuat-cua-nga-lam-tan-ra-doi-hinh-10000-quan-cua-ukraine', '<h2 class=\"singular-sapo\" style=\"margin: 32px 0px 0px; font-size: 18px; line-height: 30px; color: rgb(51, 51, 51); font-style: italic; font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif;\">&nbsp;Chuyên gia cho rằng, Nga dường như đã sử dụng chiến thuật khiến đội quân 10.000&nbsp;</h2>', '<h2 class=\"singular-sapo\" style=\"margin: 32px 0px 0px; line-height: 30px; font-size: 18px; color: rgb(51, 51, 51); font-style: italic; font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif;\">&nbsp;Chuyên gia cho rằng, Nga dường như đã sử dụng chiến thuật khiến đội quân 10.000 người của Ukraine tan rã ở Zaporozhye, gây ảnh hưởng tới chiến dịch phản công của Kiev tại miền Nam.</h2>', '<h2 class=\"singular-sapo\" style=\"margin: 32px 0px 0px; font-size: 18px; line-height: 30px; color: rgb(51, 51, 51); font-style: italic; font-family: &quot;Noto Serif&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, serif;\">&nbsp;Chuyên gia cho rằng, Nga dường&nbsp;</h2>', '/storage/photos/1/Category/mini-banner2.jpg', 'Quần', 1, NULL, 1, 'inactive', '2022-08-12 07:13:06', '2022-08-12 07:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Thời trang', 'Thời trang', 'active', '2022-08-08 01:51:03', '2022-08-08 18:20:02'),
(2, 'Hot Trend 2022', 'Hot Trend 2022', 'active', '2022-08-08 01:51:22', '2020-08-14 01:52:00'),
(3, 'Aristino', 'Aristino ', 'active', '2022-08-08 01:52:22', '2022-08-08 18:24:08'),
(4, 'Xuân hè 2022', 'Xuân hè 2022', 'active', '2022-08-08 03:16:10', '2022-08-08 18:24:43'),
(5, 'Phong cách thời trang', 'Phong cách thời trang', 'active', '2022-08-08 06:59:04', '2022-08-08 18:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 30, 8, 'Bài viết này rất hữu ích, cảm ơn admin đã chia sẻ!', 'active', NULL, NULL, '2022-08-08 18:52:38', '2022-08-08 18:52:38'),
(9, 30, 8, 'Bài viết này rất hay và thú vị', 'active', NULL, NULL, '2022-08-08 18:54:10', '2022-08-08 18:54:10'),
(10, 30, 10, '123', 'active', NULL, NULL, '2022-08-12 07:13:37', '2022-08-12 07:13:37'),
(11, 30, 10, '456', 'active', NULL, 10, '2022-08-12 07:13:52', '2022-08-12 07:13:52');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Quần', 'quần', 'active', '2022-08-09 01:53:52', '2022-08-09 01:53:52'),
(2, 'Áo', 'Áo', 'active', '2022-08-09 01:54:09', '2022-08-09 01:54:09'),
(3, 'Hot Trend 2022', 'Hot Trend 2022', 'active', '2022-08-09 01:54:33', '2022-08-09 01:54:33'),
(4, 'Phụ kiện', 'Phụ kiện', 'active', '2022-08-09 06:59:31', '2022-08-09 06:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'Áo sơ mi ngắn tay nam Aristino ASS068S2', 'ao-so-mi-ngan-tay-nam-aristino-ass068s2', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Trắng kẻ xanh nâu</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">KIỂU DÁNG:&nbsp;</strong>Perfect Fit</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:&nbsp;</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><br>- Áo sơ mi ngắn tay phom Perfect Fit suông rộng mặc thả ngoài mà vẫn đảm bảo độ lịch sự chỉn chu cho người mặc.<br>- Thiết kế basic với tà bằng thoải mái. Cổ áo đứng lịch sự cùng túi ngực tiện lợi. Họa tiết trắng kẻ xanh nâu lịch lãm, thời thượng tạo nên dấu ấn thanh lịch cho quý ông.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- 50% Bamboo mang đến sự thoáng mát, thấm hút tốt.<br>- 50% Polyspun giúp áo có khả năng đàn hồi tự nhiên và ít nhăn co trong suốt quá trình sử dụng.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:&nbsp;</strong>Trắng kẻ xanh nâu</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:&nbsp;&nbsp;</strong>38 – 39 – 40 – 41 – 42 – 43</p>', '/storage/photos/1/Products/1.jpg', 999, 'S,M,L,XL', 'new', 'active', '750000.00', 2.00, 0, 1, 4, 7, '2022-08-09 01:46:53', '2022-08-09 01:46:53'),
(12, 'Áo sơ mi ngắn tay nam Aristino ASS216S2', 'ao-so-mi-ngan-tay-nam-aristino-ass216s2', '<p><span style=\"color: rgb(72, 74, 74); font-family: SFProText; font-size: 14px;\">Màu:&nbsp;</span><span class=\"current-color\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">Xanh tím than in</span><br></p>', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">KIỂU DÁNG:</span>&nbsp;SLIM FIT</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHI TIẾT:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo sơ mi ngắn tay phom Slim fit ôm vừa vặn cơ thể, tôn dáng người mặc.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo thiết kế tà lượn, không túi, màu xanh tím than nam tính kết hợp cùng họa tiết in tràn thân áo, mang đến diện mạo nổi bật và lịch lãm cho các quý ông.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHẤT LIỆU:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Bamboo từ sợi tre thiên nhiên mang đến sự thoáng mát, thấm hút tốt và tạo cảm giác thoải mái.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Polyester giúp áo bền màu, sắc nét và độ trơn trượt, mỏng nhẹ.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">MÀU SẮC:&nbsp;</span>Xanh tím than in</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">SIZE:&nbsp;</span>38,39,40,41,42,43</p>', '/storage/photos/1/Products/2.jpg', 999, 'S,M,L,XL', 'hot', 'active', '695000.00', 1.00, 0, 1, 4, 7, '2022-08-09 01:50:45', '2022-08-09 01:50:45'),
(13, 'Áo sơ mi ngắn tay nam Aristino ASS367S2', 'ao-so-mi-ngan-tay-nam-aristino-ass367s2', '<p><span style=\"color: rgb(72, 74, 74); font-family: SFProText; font-size: 14px;\">Màu:&nbsp;</span><span class=\"current-color\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">Trắng in họa tiết xanh</span><br></p>', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">KIỂU DÁNG:&nbsp;</span>SLIM FIT</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHI TIẾT:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo sơ mi ngắn tay phom Slim fit ôm vừa vặn cơ thể, tôn dáng người mặc.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Thiết kế đường may tinh tế, màu trắng in họa tiết xanh nổi bật và thời thượng, mang đến diện mạo lịch lãm cho các quý ông.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHẤT LIỆU:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Modal giúp áo mềm mại và thấm hút tốt.<br style=\"box-sizing: inherit;\">- 50% Polyspun mang đến khả năng đàn hồi tự nhiên và ít nhăn co trong suốt quá trình sử dụng.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">MÀU SẮC:</span>&nbsp;Trắng in họa tiết xanh</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">SIZE:</span>&nbsp;38,39,40,41,42,43</p>', '/storage/photos/1/Products/3.jpg', 998, 'S,M,L,XL', 'new', 'active', '795000.00', 4.00, 0, 1, 4, 7, '2022-08-09 01:53:08', '2022-08-09 01:53:08'),
(14, 'Áo sơ mi ngắn tay nam Aristino ASS320S2', 'ao-so-mi-ngan-tay-nam-aristino-ass320s2', '<p><span style=\"color: rgb(72, 74, 74); font-family: SFProText; font-size: 14px;\">Màu:&nbsp;</span><span class=\"current-color\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">Xanh tím than kẻ trắng</span><br></p>', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">KIỂU DÁNG:</span>&nbsp;REGULAR FIT</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHI TIẾT:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo sơ mi ngắn tay phom Regular fit suông nhẹ nhưng vẫn đảm bảo vừa vặn, chỉn chu khi mặc.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Thiết kế tà lượn, có túi ngực, nổi bật với họa tiết kẻ trắng trên nền xanh tím than thanh lịch tạo nên diện mạo vừa trẻ trung vừa cuốn hút cho người mặc.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHẤT LIỆU:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Modal giúp áo mềm mại và thấm hút tốt.<br style=\"box-sizing: inherit;\">- 50% Polyspun mang đến khả năng đàn hồi tự nhiên và ít nhăn co trong suốt quá trình sử dụng.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">MÀU SẮC:&nbsp;</span>Xanh tím than kẻ trắng</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">SIZE:</span>&nbsp;38,39,40,41,42,43</p>', '/storage/photos/1/Products/4.jpg', 888, 'S,M,L,XL', 'new', 'active', '750000.00', 12.00, 0, 1, 4, 7, '2022-08-09 01:55:45', '2022-08-09 01:55:45'),
(15, 'Áo sơ mi ngắn tay nam Aristino ASS216S2', 'ao-so-mi-ngan-tay-nam-aristino-ass216s2-2208090455-721', '<p><span style=\"color: rgb(72, 74, 74); font-family: SFProText; font-size: 14px;\">Màu:&nbsp;</span><span class=\"current-color\" style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-size: 14px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">Xanh tím than in</span><br></p>', '<p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">KIỂU DÁNG:</span>&nbsp;SLIM FIT</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHI TIẾT:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo sơ mi ngắn tay phom Slim fit ôm vừa vặn cơ thể, tôn dáng người mặc.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- Áo thiết kế tà lượn, không túi, màu xanh tím than nam tính kết hợp cùng họa tiết in tràn thân áo, mang đến diện mạo nổi bật và lịch lãm cho các quý ông.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">CHẤT LIỆU:</span></p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Bamboo từ sợi tre thiên nhiên mang đến sự thoáng mát, thấm hút tốt và tạo cảm giác thoải mái.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\">- 50% Polyester giúp áo bền màu, sắc nét và độ trơn trượt, mỏng nhẹ.</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">MÀU SẮC:&nbsp;</span>Xanh tím than in</p><p style=\"box-sizing: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; font-family: SFProText; color: rgb(72, 74, 74);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-weight: 700; vertical-align: baseline; background: 0px 0px;\">SIZE:&nbsp;</span>38,39,40,41,42,43</p>', '/storage/photos/1/Products/5.jpg', 777, 'S,M,L,XL', 'hot', 'active', '695000.00', 3.00, 0, 1, 4, 7, '2022-08-09 02:04:55', '2022-08-09 02:04:55'),
(16, 'Ví da nam Aristino AWE00509', 'vi-da-nam-aristino-awe00509', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Đen</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Ví da ngang thiết kế nhỏ gọn phù hợp để mang theo bên người.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Thiết kế nhiều ngăn được sắp xếp hợp lý, có thể chứa tiền, card và giấy tờ cá nhân.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Bề mặt da bò lớp 1 dập vân đà điểu nổi bật, thiết kế tinh tế. Logo Aristino bằng kim loại bên ngoài kết hợp logo chữ ép nhiệt bên trong tạo điểm nhấn. Màu sắc đa dạng gồm Đen, Nâu Đậm và Xanh Tím Than.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Chất liệu da bò có ưu điểm mềm mại, lạ mắt và thời thượng. Đặc biệt, da có độ bền cao giúp ví luôn bền đẹp.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:&nbsp;</strong>105 x 85 x 15 mm</p>', '/storage/photos/1/Products/11.jpg', 999, '', 'default', 'active', '880000.00', 5.00, 0, 2, NULL, 9, '2022-08-09 02:11:31', '2022-08-09 02:11:31'),
(17, 'Giày da nam Aristino ASH02102', 'giay-da-nam-aristino-ash02102', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Đen</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Giày lười nam thiết kế ôm chân, vừa vặn đem lại cảm giác thoải mái tuyệt đối.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Giày thiết kế thanh lịch, mặt da vân cá sấu nổi bật, đem lại vẻ ngoài ấn tượng. Đế giày đúc họa tiết Aristino ma sát tốt, chống trơn trượt.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Mặt ngoài làm từ 100% da bò, được xử lý để hạn chế thấm nước, tăng độ bền và dễ dàng vệ sinh.<br><br>- Mặt trong làm từ da thật. Chất da mềm mại, thông thoáng, tạo cảm giác êm ái dù đi trên chân suốt cả ngày dài.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:</strong>&nbsp;Đen</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:&nbsp;</strong>39, 40, 41, 42</p>', '/storage/photos/1/Products/33.jpg', 666, '', 'hot', 'active', '555000.00', 10.00, 0, 2, NULL, 9, '2022-08-09 02:13:55', '2022-08-09 02:13:55'),
(18, 'Thắt lưng da nam Aristino', 'that-lung-da-nam-aristino', '<p>Nẫu</p>', '<p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Thắt lưng da cao cấp thiết kế tối giản. Bề mặt da nâu với những đường vân tự nhiên, tinh tế, bản dây rộng vừa phải, phù hợp với nhiều trang phục khác nhau.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Mặt dây lưng mạ vàng không gỉ với thiết kế 3 khối mang đến diện mạo nam tính cho nam giới. Mặt trượt tự động tiện lợi, chốt cài chắc chắn, dễ dàng điều chỉnh linh hoạt với số đo vòng bụng.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Chất liệu da bò cao cấp được nhập khẩu và xử lý tỉ mỉ, hạn chế hiện tượng nổ da. Bề mặt da có độ bóng tự nhiên, thoáng khí, bền chắc và mềm mại hơn sau thời gian dài sử dụng.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:</strong>&nbsp;Nâu</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:&nbsp;</strong>90/105 - 95/110 - 100/115 - 105/120 - 110/125</p>', '/storage/photos/1/Products/22.jpg', 888, '', 'new', 'active', '230000.00', 12.00, 0, 2, NULL, 9, '2022-08-09 02:15:04', '2022-08-09 02:15:04'),
(19, 'Cà vạt nam Aristino ATI01608', 'ca-vat-nam-aristino-ati01608', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Xanh biển kẻ trắng - xanh lớn</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">KIỂU DÁNG:</strong>&nbsp;Bản to</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Cà vạt bản to truyền thống chững chạc và nam tính, phù hợp cho các sự kiện trang trọng.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Màu xanh biển đậm kết hợp đường kẻ chéo trắng và xanh nhạt quen thuộc nhưng vẫn đầy thời thượng.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Chất liệu 100% Polyester mang đến độ bóng sắc nét, không bị bai dão, luôn bền màu. Cà vạt có khả năng chống bám bụi, chống nhăn, hạn chế thấm nước, độ bền cao.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:&nbsp;</strong>Xanh biển kẻ trắng - xanh lớn</p>', '/storage/photos/1/Products/44.jpg', 444, '', 'new', 'active', '195000.00', 4.00, 0, 2, NULL, 9, '2022-08-09 02:15:52', '2022-08-09 02:15:52'),
(20, 'Quần âu nam Aristino ATR03001', 'quan-au-nam-aristino-atr03001', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Xám 32 kẻ</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">KIỂU DÁNG:</strong>&nbsp;SLIM FIT</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Quần âu phom dáng Slim fit ôm vừa vặn với hình thể người mặc, mang lại vẻ trẻ trung, nam tính.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Quần thiết kế họa tiết kẻ tinh tế, đem đến diện mạo chỉn chu, lịch lãm khi mặc. Gam màu xám trung tính, dễ kết hợp với nhiều loại trang phục, nhiều phong cách khác nhau.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- 59% Polyester giúp quần bền màu, sắc nét, mặt vải trơn trượt, mỏng nhẹ.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- 40% Rayon giúp quần có độ mềm mại, mát mẻ và bay rũ tự nhiên.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- 1% Spandex tạo độ co giãn nhẹ.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:</strong>&nbsp;Xám 32 kẻ</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:&nbsp;</strong>29 - 30 - 31 - 32 - 33 - 34 - 35</p>', '/storage/photos/1/Products/111.jpg', 999, 'S,M,L,XL', 'hot', 'active', '750000.00', 17.00, 0, 3, NULL, 8, '2022-08-09 02:21:33', '2022-08-09 02:21:33'),
(21, 'Quần âu nam Aristino ATR02008', 'quan-au-nam-aristino-atr02008', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Xanh tím than 34</span><br></p>', '<p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">KIỂU DÁNG:</strong>&nbsp;SLIM FIT</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Quần âu phom dáng Slim fit ôm vừa phải, tôn dáng người mặc</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Thiết kế chỉn chu với nếp ly vĩnh viễn Supercrease giúp quần luôn đứng dáng, bền vững với giặt ủi, mang đến vẻ lịch lãm. Quần có túi xẻ hai bên, túi khuy cài phía sau tiện lợi. Gấu quần chờ, được may vừa vặn với số đo của từng khách hàng.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Chất liệu Polyester kết hợp Rayon cho quần có độ cứng cáp và đứng dáng vừa đủ, đồng thời vẫn có bề mặt xốp nhẹ, thoáng mát dễ chịu.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\">- Đặc biệt, quần thấm hút tốt và thoát ẩm vượt trội, mang lại cảm giác dễ chịu suốt ngày dài.</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:&nbsp;</strong>Đen 1, Xanh tím than 29, Xanh tím than 34, Xám 55</p><p data-mce-style=\"text-align: justify;\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41); text-align: justify;\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:</strong>&nbsp;29 – 30 – 31 – 32 – 33 – 34 – 35&nbsp;</p>', '/storage/photos/1/Products/222.jpg', 775, 'S,M,L,XL', 'hot', 'active', '850000.00', 20.00, 0, 3, NULL, 8, '2022-08-09 02:22:23', '2022-08-17 23:25:03'),
(22, 'Áo có cổ nam 123', 'quan-au-nam-aristino-atr00201', '<p><span style=\"color: rgb(33, 37, 41); font-family: svgGilroy;\">Xanh tím than 48 kẻ</span><br></p>', '<p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">KIỂU DÁNG:&nbsp;</strong>SLIM FIT</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHI TIẾT:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Quần âu phom dáng Slim fit ôm vừa vặn hình thể người mặc, nhằm tôn lên dáng vẻ nam tính. - Quần được thiết kế cơ bản với túi chéo 2 bên, màu sắc trung tính quen thuộc, dễ dàng phối cùng nhiều loại trang phục khác nhau.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">CHẤT LIỆU:</strong></p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\">- Chất liệu Polyester mang đến độ bóng sắc nét, không bị bai dão, luôn bền màu. Quần còn có khả năng chống bám bụi, chống nhăn, hạn chế thấm nước, độ bền cao. - Kết hợp Rayon giúp quần có độ mềm mại, mát mẻ và bay rũ tự nhiên.</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">MÀU SẮC:&nbsp;</strong>Xám 55 kẻ, Xanh tím than 48 kẻ, Xám 202 kẻ</p><p style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: svgGilroy; margin-right: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(33, 37, 41);\"><strong style=\"font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;\">SIZE:</strong>&nbsp;29-30-31-32-33-34-35</p>', '/storage/photos/1/Products/2.jpg', 887, 'S,M', 'new', 'active', '500000.00', 24.00, 0, 1, 5, 8, '2022-08-09 02:23:18', '2022-08-17 23:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 30, 22, 5, 'Sản phẩm này rất phù hợp với giới trẻ và hợp với túi tiền!', 'active', '2022-08-09 02:40:54', '2022-08-09 02:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo_ar.png', '/storage/photos/1/blog3.jpg', 'Phạm Hùng, Mỹ Đình, Nam Từ Liêm, Hà Nội, Vietnam', '(0123) 456 789', 'aristino.vn@gmail.com', NULL, '2022-08-05 08:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giao hàng tiết kiệm(GHTK)', '50000', 'active', '2022-08-09 04:22:17', '2022-08-08 18:00:53'),
(2, 'Viettel Post', '20000', 'active', '2022-08-09 04:22:41', '2022-08-08 18:02:31'),
(3, 'Giao Hàng Nhanh (GHN)', '33000', 'active', '2022-08-09 06:54:04', '2022-08-08 18:03:02'),
(4, 'VietNam Post', '25000', 'active', '2022-08-08 20:50:48', '2022-08-08 18:03:29'),
(5, 'Bee', '20000', 'active', '2022-08-12 07:08:54', '2022-08-12 07:09:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', 'sB0adXRAKlq2vlb8JrMn4SjkymiQS9vtqCRwtmlptxqXz0ig0WyaUzjHBvqN', NULL, '2022-08-05 06:47:13'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2022-08-05 07:30:07'),
(30, 'DevNguyen', 'devnguyen@gmail.com', NULL, '$2y$10$k8xIcydnJtgdEyYjP2VGdO.qImzJK2.Zt4QpWmwS384Micj1vdUB2', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-08 18:17:13', '2022-08-08 18:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
