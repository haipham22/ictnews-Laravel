-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 23 Mars 2017 à 11:52
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `duan2_news`
--

-- --------------------------------------------------------

--
-- Structure de la table `ads`
--

CREATE TABLE `ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `piacement` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `ads`
--

INSERT INTO `ads` (`id`, `name`, `code`, `piacement`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Top Banner', '<div style="background-color:#efc4c4; color:#ffffff; height:120px; line-height:120px; text-align:center; width:100%">Quảng c&aacute;o đặt tại đ&acirc;y</div>', 1, 1, '2017-03-22 17:00:00', '2017-03-22 11:46:22'),
(2, 'Sidebar', '<div style="background-color:#efc4c4; color:#ffffff; height:600px; line-height:600px; text-align:center; width:100%">Quảng c&aacute;o đặt tại đ&acirc;y</div>\r\n<br><br>\r\n<div style="background-color:#efc4c4; color:#ffffff; height:600px; line-height:600px; text-align:center; width:100%">Quảng c&aacute;o đặt tại đ&acirc;y</div>', 2, 1, '2017-03-22 17:00:00', '2017-03-22 11:45:02'),
(3, 'Sidebar Small', '<div style="background-color:#efc4c4; color:#ffffff; height:600px; line-height:600px; text-align:center; width:100%">Quảng c&aacute;o</div>', 3, 0, '2017-03-22 17:00:00', '2017-03-22 11:45:09');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_to_menu` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `parent`, `name`, `description`, `slug`, `add_to_menu`, `order`, `status`, `created_at`, `updated_at`) VALUES
(4, 0, 'Xã Hội Số', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'xa-hoi-so', 1, 1, 1, '2017-03-15 12:39:58', '2017-03-18 03:36:28'),
(5, 0, 'Anh Ninh Mạng', 'Tin tức về chủ đề Anh ninh mạng', 'anh-ninh-mang', 1, 2, 1, '2017-03-18 03:44:27', '2017-03-18 03:44:27'),
(6, 0, 'Kinh Doanh', 'Tin tức kinh doanh', 'kinh-doanh', 1, 3, 1, '2017-03-19 05:00:01', '2017-03-19 10:27:33'),
(7, 0, 'Di Động', 'Tin tức về di động', 'di-dong', 1, 5, 1, '2017-03-19 08:18:27', '2017-03-19 10:27:40');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 3),
(4, '2017_03_05_051749_create_categories_table', 2),
(9, '2017_03_05_053156_create_type_ads_table', 2),
(10, '2017_03_05_053313_create_type_comments_table', 2),
(11, '2017_03_05_051452_create_socials_table', 4),
(12, '2017_03_05_052918_create_type_pages_table', 5),
(13, '2017_03_05_052159_create_posts_table', 6),
(18, '2014_02_09_225721_create_visitor_registry', 10),
(20, '2017_03_22_141530_create_tagpost_table', 12),
(21, '2017_03_05_052557_create_tags_table', 13);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `description`, `content`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Phạm Minh Tiến', 'pham-minh-tien', '<p>xxxxxx</p>', '<p>xxxxxxxx</p>', 1, '2017-03-07 05:08:58', '2017-03-07 05:09:10'),
(10, 'Anh Quý', 'anh-quy', '<p>Anh Qu&yacute;Anh Qu&yacute;Anh Qu&yacute;</p>', '<p>Anh Qu&yacute;Anh Qu&yacute;Anh Qu&yacute;Anh Qu&yacute;</p>', 1, '2017-03-15 12:46:01', '2017-03-15 12:46:01');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `cate_id` int(11) NOT NULL,
  `user_created` int(11) NOT NULL,
  `user_update` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `show_home` int(11) DEFAULT NULL,
  `oder` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `posts`
--

INSERT INTO `posts` (`id`, `cate_id`, `user_created`, `user_update`, `title`, `description`, `content`, `slug`, `thumbnail`, `type`, `show_home`, `oder`, `views`, `status`, `created_at`, `updated_at`) VALUES
(5, 5, 1, 1, 'Anh tạm gỡ bỏ quảng cáo trên YouTube vì video cực đoan', '<p><strong>Đại diện Google bị triệu tập bởi c&aacute;c bộ trưởng Anh li&ecirc;n quan đến việc c&aacute;c đoạn quảng c&aacute;o hiển thị k&egrave;m clip cực đoan tr&ecirc;n YouTube.</strong></p>', '<p>H&ocirc;m 16/3, văn ph&ograve;ng Nội c&aacute;c Anh cho biết lệnh cấm quảng c&aacute;o n&agrave;y chỉ l&agrave; tạm thời v&agrave; &quot;đang chờ giải tr&igrave;nh từ ph&iacute;a Google&quot;.</p>\r\n\r\n<p>Ch&iacute;nh phủ Anh đ&atilde; tạm gỡ bỏ quảng c&aacute;o tr&ecirc;n YouTube sau khi ph&aacute;t hiện một số đoạn quảng c&aacute;o c&oacute; thể tạo ra lợi nhuận cho những kẻ cực đoan theo chủ nghĩa h&atilde;m hiếp hoặc những kẻ truyền gi&aacute;o kh&ocirc;ng ch&iacute;nh thống.</p>\r\n\r\n<p>Times tin rằng những kẻ tạo ra video n&agrave;y c&oacute; thể kiến được khoảng 7,6 USD cho 1.000 lượt quảng c&aacute;o được xem.</p>\r\n\r\n<p>Đại diện Google &ndash; chủ sở hữu của YouTube &ndash; bị triệu tập bởi c&aacute;c Bộ trưởng h&ocirc;m 16/3 để giải tr&igrave;nh về việc c&aacute;c đoạn quảng c&aacute;o hiển thị k&egrave;m clip c&oacute; nội dung ti&ecirc;u cực.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/35/63/1635631.jpg?t=1489802363342" /></p>\r\n\r\n<p><em>Ch&iacute;nh phủ Anh tạm dừng quảng c&aacute;o tr&ecirc;n YouTube để chờ giải tr&igrave;nh từ ph&iacute;a Google.</em></p>\r\n\r\n<p>Nhiều c&ocirc;ng ty, tổ chức kh&aacute;c cũng đ&atilde; ngừng quảng c&aacute;o tr&ecirc;n YouTube sau khi vụ việc ph&aacute;t sinh. David Pemsel &ndash; Tổng gi&aacute;m đốc của Guardian - viết cho Google v&agrave; n&oacute;i đ&acirc;y l&agrave; điều &quot;ho&agrave;n to&agrave;n kh&ocirc;ng thể chấp nhận được&quot; khi quảng c&aacute;o của họ bị lạm dụng theo c&aacute;ch n&agrave;y.</p>\r\n\r\n<p>Gi&aacute;m đốc điều h&agrave;nh Google UK Ronan Harris n&oacute;i trong một ph&aacute;t biểu mới đ&acirc;y rằng c&ocirc;ng ty c&oacute; &quot;c&aacute;c quy tắc nghi&ecirc;m ngặt&quot; về vị tr&iacute; quảng c&aacute;o xuất hiện v&agrave; &quot;trong phần lớn trường hợp&quot; c&ocirc;ng ty bảo vệ người d&ugrave;ng v&agrave; nh&agrave; quảng c&aacute;o khỏi nội dung độc hại hoặc kh&ocirc;ng ph&ugrave; hợp</p>\r\n\r\n<p>&Ocirc;ng Harris cho hay năm 2016, Google đ&atilde; x&oacute;a gần 2 tỷ quảng c&aacute;o, cấm hơn 100.000 nh&agrave; ph&aacute;t h&agrave;nh v&agrave; chặn quảng c&aacute;o tr&ecirc;n hơn 300 triệu video YouTube.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, &ocirc;ng Harris cũng thừa nhận số lượng quảng c&aacute;o qu&aacute; lớn m&agrave; Google đảm nhận đồng nghĩa &quot;kh&ocirc;ng phải l&uacute;c n&agrave;o họ cũng l&agrave;m tốt&quot;.</p>\r\n\r\n<p>&quot;<em>Trong tỷ lệ phần trăm rất nhỏ trường hợp, quảng c&aacute;o xuất hiện k&egrave;m video vi phạm nội dung của ch&uacute;ng t&ocirc;i</em>&quot;, &ocirc;ng n&oacute;i v&agrave; cam kết sẽ giải quyết vấn đề.</p>\r\n\r\n<p>Tại Việt Nam, nhiều doanh nghiệp v&agrave; nh&agrave; quảng c&aacute;o cũng gặp t&igrave;nh trạng tương tự khi quảng c&aacute;o của họ bị ch&egrave;n v&agrave;o c&aacute;c clip c&oacute; nội dung xấu độc, vi phạm ph&aacute;p luật Việt Nam.</p>\r\n\r\n<p>Bộ trưởng Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng Trương Minh Tuấn h&ocirc;m 16/3 đ&atilde; chủ tr&igrave; cuộc họp với doanh nghiệp v&agrave; nh&agrave; quảng c&aacute;o li&ecirc;n quan đến vụ việc n&agrave;y. C&aacute;c doanh nghiệp sau đ&oacute; cam kết chung tay, ủng hộ chương tr&igrave;nh h&agrave;nh động của Bộ để x&acirc;y dựng m&ocirc;i trường Internet l&agrave;nh mạnh.</p>\r\n\r\n<p>Ph&iacute;a Google cũng đ&atilde; tiến h&agrave;nh gỡ bỏ c&aacute;c clip c&oacute; nội dung xấu độc tr&ecirc;n YouTube sau khi nhận th&ocirc;ng b&aacute;o từ ph&iacute;a cơ quan chức năng Việt Nam.</p>\r\n\r\n<p><em>Theo Zing News</em></p>', 'anh-tam-go-bo-quang-cao-tren-youtube-vi-video-cuc-doan', '/uploads/images/files/1635631.jpg', 0, NULL, NULL, NULL, 1, '2017-03-18 03:20:17', '2017-03-18 10:17:56'),
(6, 4, 1, 1, 'Thuật toán mới của Google giúp giảm tới 35% dung lượng ảnh JPEG', '<p><strong>Để gi&uacute;p người d&ugrave;ng tiết kiệm dung lượng hơn khi lướt web bằng di động trong tương lai, Google vừa cho giới thiệu một thuật to&aacute;n n&eacute;n h&igrave;nh ảnh mới c&oacute; khả năng giảm tới 35% k&iacute;ch thước ảnh JPEG.</strong></p>', '<p><strong><img alt="" src="http://vnreview.vn/image/16/35/56/1635564.jpg?t=1489777179333" /></strong></p>\r\n\r\n<p>Theo<em>&nbsp;PhoneArena</em>, thuật to&aacute;n mới của Google được gọi với c&aacute;i t&ecirc;n l&agrave; Guetzli (c&oacute; nghĩa l&agrave; b&aacute;nh quy trong tiếng Thụy Sĩ). Đ&acirc;y l&agrave; một thuật to&aacute;n m&atilde; nguồn mở cho ph&eacute;p giảm k&iacute;ch thước của tệp tin ảnh JPEG tới 35% m&agrave; kh&ocirc;ng l&agrave;m giảm chất lượng h&igrave;nh ảnh qu&aacute; nhiều. Ngo&agrave;i ra, h&igrave;nh ảnh sau khi được n&eacute;n đều c&oacute; thể tương th&iacute;ch với mọi tr&igrave;nh duyệt web v&agrave; phần mềm chỉnh sửa ảnh hiện nay.</p>\r\n\r\n<p>Google cho biết th&ecirc;m l&agrave; Guetzli thực hiện việc m&atilde; h&oacute;a h&igrave;nh ảnh JPEG th&ocirc;ng qua một phương thức gọi l&agrave; lượng tử h&oacute;a h&igrave;nh ảnh. Phương thức n&agrave;y cho ph&eacute;p loại bỏ bớt c&aacute;c chi tiết để giảm k&iacute;ch thước của h&igrave;nh ảnh m&agrave; vẫn giữ nguy&ecirc;n được định dạng.</p>\r\n\r\n<p>Ngo&agrave;i ra, Guetzli c&ograve;n &aacute;p dụng &quot;m&ocirc; h&igrave;nh nhận thức thị gi&aacute;c&quot; của Google trong việc n&eacute;n h&igrave;nh ảnh. Điều n&agrave;y cho ph&eacute;p Guetzli c&oacute; khả năng &quot;che giấu trực quan&quot; việc h&igrave;nh ảnh đ&atilde; bị giảm k&iacute;ch thước triệt để hơn c&aacute;c thuật to&aacute;n kh&aacute;c.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/35/56/1635567.jpg?t=1489777308434" /></p>\r\n\r\n<p><em>Từ tr&aacute;i qua phải: h&igrave;nh ảnh nguy&ecirc;n gốc, h&igrave;nh ảnh được n&eacute;n bởi libjeg v&agrave; h&igrave;nh ảnh được n&eacute;n bởi Guetzli.</em></p>\r\n\r\n<p>Với việc giảm được tới 35% k&iacute;ch thước tệp tin ảnh JPEG, Guetzli c&oacute; khả năng n&eacute;n h&igrave;nh ảnh lớn hơn nhiều so với một số thuật to&aacute;n tương tự đang phổ biến hiện nay như libjeg.&nbsp; Tuy nhi&ecirc;n, đ&aacute;nh đổi lại, Gueztli sẽ mất nhiều thời gian hơn một ch&uacute;t để n&eacute;n c&aacute;c h&igrave;nh ảnh.</p>\r\n\r\n<p>Trước đ&oacute;, Google từng ph&aacute;t triển một thuật to&aacute;n n&eacute;n h&igrave;nh ảnh c&oacute; t&ecirc;n l&agrave; WebP v&agrave;o năm 2014. Tuy nhi&ecirc;n, WebP lại kh&ocirc;ng thật sự được c&aacute;c chủ trang web ưa chuộng v&igrave; bắt họ phải thay đổi hỗ trợ định dạng h&igrave;nh ảnh. Do đ&oacute;, Google đ&atilde; giới thiệu Guetzli như l&agrave; một sự thay thế ho&agrave;n hảo hơn cho WebP.</p>\r\n\r\n<p><strong>Theo VNReview</strong></p>', 'thuat-toan-moi-cua-google-giup-giam-toi-35-dung-luong-anh-jpeg', '/uploads/images/files/1635564.jpg', 0, NULL, NULL, NULL, 1, '2017-03-18 03:43:56', '2017-03-18 03:43:56'),
(7, 4, 1, 1, 'Tại sao CIA sử dụng game để đào tạo các sỹ quan tình báo?', '<p><strong>Dungeons and Dragons, Pok&eacute;mon, game bài (card game) kh&ocirc;ng chỉ là đ&ecirc;̉ giải trí &ndash; chúng còn là &quot;c&ocirc;ng cụ&quot; của Cục tình báo trung ương Mỹ, CIA.</strong></p>', '<p><strong><img alt="" src="http://vnreview.vn/image/16/34/75/1634753.jpg?t=1489546422101" /></strong></p>\r\n\r\n<p>David Clopper là m&ocirc;̣t nhà ph&acirc;n tích c&acirc;́p cao đã có 16 năm kinh nghi&ecirc;̣m với CIA, và cũng là nhà sản xu&acirc;́t game cho CIA. Từ card game đ&ecirc;́n board game (tr&ograve; chơi li&ecirc;n quan đến những miếng thẻ hoặc những qu&acirc;n cờ được đặt hoặc di chuyển tr&ecirc;n một mặt phẳng, k&egrave;m theo c&aacute;c luật chơi tương ứng), Clopper đã tạo ra các game đ&ecirc;̉ phục vụ cho đào tạo các đặc vụ CIA, bao g&ocirc;̀m sỹ quan tình báo và nhà ph&acirc;n tích chính trị, v&ecirc;̀ các tình hu&ocirc;́ng trong th&ecirc;́ giới thực.</p>\r\n\r\n<p>&quot;<em>Chơi (game) là m&ocirc;̣t ph&acirc;̀n trong cu&ocirc;̣c s&ocirc;́ng con người. Tại sao kh&ocirc;ng lợi dụng trò chơi đ&ecirc;̉ học?</em>&quot; Clopper nói. Clopper và các sỹ quan CIA khác đã thảo lu&acirc;̣n cách đ&ecirc;̉ CIA có th&ecirc;̉ dùng game đ&ecirc;̉ đào tạo v&ecirc;̀ chi&ecirc;́n lược, tình báo và hợp tác.</p>\r\n\r\n<p>Clopper đã bắt đ&acirc;̀u phát tri&ecirc;̉n các chương trình đào tạo dựa tr&ecirc;n game vào năm 2008. Trong game &quot;Collection&quot;, game CIA đ&acirc;̀u ti&ecirc;n, nhóm các nhà ph&acirc;n tích đã làm vi&ecirc;̣c cùng nhau đ&ecirc;̉ giải quy&ecirc;́t những khủng hoảng qu&ocirc;́c t&ecirc;́. &quot;Collection Deck&quot;, game thứ hai, là m&ocirc;̣t game bài dạng như Pokemon, trong đó m&ocirc;̃i thẻ bài là m&ocirc;̣t chi&ecirc;́n lược thu th&acirc;̣p tình báo hoặc m&ocirc;̣t thử thách như làm m&ocirc;̣t băng đảng hoặc m&ocirc;̣t b&ocirc;̣ máy quan li&ecirc;u.</p>\r\n\r\n<p>Theo đó, người chơi có th&ecirc;̉ rút m&ocirc;̣t thẻ bài đ&ecirc;̉ thu th&acirc;̣p tình báo qua các bức ảnh v&ecirc;̣ tinh, nhưng m&ocirc;̣t th&ecirc;́ lực có th&ecirc;̉ ngăn chặn họ lại bằng cách chơi m&ocirc;̣t thẻ bài đ&ocirc;́i nghịch. Trò chơi bắt chước các tình hu&ocirc;́ng mà các nhà ph&acirc;n tích có th&ecirc;̉ gặp trong c&ocirc;ng vi&ecirc;̣c thực t&ecirc;́ của họ.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/34/68/1634683.jpg?t=1489546338372" /></p>\r\n\r\n<p>Ngoài Clopper, Volko Ruhnke cũng là m&ocirc;̣t chuy&ecirc;n gia đào tạo tình báo của CIA và là m&ocirc;̣t nhà thi&ecirc;́t k&ecirc;́ game tự do. Ruhnke nói &ocirc;ng đặc bi&ecirc;̣t thích thú với m&ocirc;̣t th&ecirc;̉ loại game: trò chơi m&ocirc; phỏng đ&ecirc;̉ đào tạo các nhà ph&acirc;n tích và giúp họ trong các nhi&ecirc;̣m vụ phải dùng óc ph&acirc;n tích, nghi&ecirc;n cứu. Trò chơi có th&ecirc;̉ giúp dự đoán trước các tình hu&ocirc;́ng phức tạp bằng cách bu&ocirc;̣c người chơi phải giải quy&ecirc;́t li&ecirc;n tục nhi&ecirc;̀u tình hu&ocirc;́ng khác nhau.</p>\r\n\r\n<p>Bản th&acirc;n Ruhnke cũng tạo ra các game board thương mại đ&ecirc;̉ bắt chước các xung đ&ocirc;̣t Afghanistan và đưa người chơi qua các tình hu&ocirc;́ng qu&acirc;n sự, chính trị và kinh t&ecirc;́ trong khu vực. Game mang lại cho người chơi &quot;cách hi&ecirc;̉u năng đ&ocirc;̣ng hơn nhi&ecirc;̀u v&ecirc;̀ các v&acirc;́n đ&ecirc;̀ Afghanistan hi&ecirc;̣n đại&quot;, Ruhnke nói và th&ecirc;m rằng m&ocirc;̣t trò chơi tương tự có th&ecirc;̉ sử dụng trong n&ocirc;̣i b&ocirc;̣ CIA.</p>\r\n\r\n<p>Theo&nbsp;<em>CNN</em>, hi&ecirc;̣n nay các game trường học cũ v&acirc;̃n là ngu&ocirc;̀n cảm hứng chính cho các chương trình đào tạo của CIA. Nhưng các nhà ph&acirc;n tích dự đoán game thực t&ecirc;́ ảo sẽ sớm được ứng dụng trong các chương trình đào tạo. Nhi&ecirc;̀u đơn vị qu&acirc;n đ&ocirc;̣i đã dùng phương pháp đào tạo thực t&ecirc;́ ảo trong nhi&ecirc;̀u năm, đưa các thành vi&ecirc;n vào trải nghi&ecirc;̣m cu&ocirc;̣c s&ocirc;́ng thực qua các tình hu&ocirc;́ng bắt chước hình ảnh, &acirc;m thanh thực.</p>\r\n\r\n<p>&quot;<em>Chúng ta càng nhanh chóng ứng dụng VR trong game, tác dụng sẽ càng t&ocirc;́t</em>&quot;, Rachel Grunspan, giám đ&ocirc;́c chi&ecirc;́n lược của m&ocirc;̣t t&ocirc;̉ chức sáng tạo s&ocirc;́ thu&ocirc;̣c CIA, nói. &quot;<em>N&ecirc;́u mu&ocirc;́n các sỹ quan CIA giải quy&ecirc;́t các c&acirc;u hỏi tình báo, VR là m&ocirc;̣t c&ocirc;ng cụ tuy&ecirc;̣t với đ&ecirc;̉ làm đi&ecirc;̀u đó</em>&quot;.</p>', 'ta-i-sao-cia-su-du-ng-game-de-da-o-ta-o-ca-c-sy-quan-ti-nh-ba-o', '/uploads/images/files/1634683.jpg', 0, NULL, NULL, NULL, 1, '2017-03-18 05:26:56', '2017-03-18 05:26:56'),
(8, 5, 1, 1, 'Mỹ cáo buộc điệp viên Nga tấn công tài khoản Yahoo', '<p><strong>Bộ Tư ph&aacute;p Mỹ x&aacute;c định c&oacute; hai điệp vi&ecirc;n người Nga v&agrave; hai tin tặc tham gia v&agrave;o vụ khống chế hơn 500 triệu t&agrave;i khoản của người d&ugrave;ng Yahoo năm 2014.</strong></p>', '<p>Hồ sơ t&ograve;a &aacute;n Mỹ cho biết c&oacute; bốn người tham gia v&agrave;o vụ đ&aacute;nh cắp th&ocirc;ng tin thuộc loại lớn nhất trong lịch sử Internet l&agrave; điệp vi&ecirc;n Nga Dmitry Dokuchaev v&agrave; Igor Sushchin (thuộc Tổng cục An ninh Li&ecirc;n bang Nga FSB) v&agrave; hai hacker được thu&ecirc; kh&aacute;c l&agrave; Karim Baratov v&agrave; Alexsey Belan.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Ảnh truy nã Dmitry Dokuchaev được Bộ Tư pháp Mỹ đặt trong buổi họp báo ngày 15/3." src="http://img.f5.sohoa.vnecdn.net/2017/03/17/hack-1-9067-1489726903.jpg" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ảnh truy n&atilde; Dmitry Dokuchaev được Bộ Tư ph&aacute;p Mỹ đặt trong buổi họp b&aacute;o ng&agrave;y 15/3. Ảnh:&nbsp;<em>CNN</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Belan, biệt danh Magg v&agrave; nằm trong danh s&aacute;ch truy n&atilde; của FBI, sống tại Nga v&agrave; được FSB chi&ecirc;u mộ. Người n&agrave;y đ&atilde; th&acirc;m nhập hệ thống m&aacute;y chủ của Yahoo đầu năm 2014 v&agrave; từ đ&oacute; khống chế c&ocirc;ng cụ m&agrave; c&ocirc;ng ty n&agrave;y d&ugrave;ng để quản l&yacute; những thay đổi tr&ecirc;n t&agrave;i khoản email của người d&ugrave;ng, như đổi mật khẩu mới....</p>\r\n\r\n<p>Nh&oacute;m hacker đ&atilde; sử dụng những dữ liệu thu được để truy cập v&agrave;o t&agrave;i khoản của những c&aacute; nh&acirc;n cụ thể như c&aacute;c nh&agrave; l&atilde;nh đạo, nh&agrave; ngoại giao, c&aacute;n bộ ch&iacute;nh phủ, nh&acirc;n vi&ecirc;n c&ocirc;ng ty c&ocirc;ng nghệ v&agrave; nh&agrave; b&aacute;o điều tra. Những người n&agrave;y cũng t&igrave;m kiếm th&ocirc;ng tin thẻ t&iacute;n dụng, t&agrave;i liệu t&agrave;i ch&iacute;nh, th&ocirc;ng tin đăng nhập v&agrave;o những t&agrave;i khoản c&aacute; nh&acirc;n kh&aacute;c như Gmail.</p>\r\n\r\n<p>Belan c&ograve;n khai th&aacute;c hơn 30 triệu t&agrave;i khoản Yahoo để tiến h&agrave;nh chiến dịch spam nhằm kiếm tiền bằng c&aacute;ch điều hướng người d&ugrave;ng&nbsp;tới một trang dược phẩm online (trang n&agrave;y trả tiền cho những b&ecirc;n thu h&uacute;t người d&ugrave;ng tới site của m&igrave;nh).</p>\r\n\r\n<p>&quot;Dmitry Dokuchaev v&agrave; Igor Sushchin thuộc FSB đ&atilde; trả tiền v&agrave; tạo điều kiện cho c&aacute;c hacker thu thập th&ocirc;ng tin th&ocirc;ng qua c&aacute;c vụ x&acirc;m nhập m&aacute;y t&iacute;nh ở Mỹ v&agrave; những nơi kh&aacute;c&quot;, trợ l&yacute; Bộ trưởng Tư ph&aacute;p Mary McCord cho hay.</p>\r\n\r\n<p>Trong khi đ&oacute;, Nga chưa đưa ra b&igrave;nh luận n&agrave;o về c&aacute;o buộc của Mỹ.</p>\r\n\r\n<p>Th&aacute;ng 9/2016, Yahoo thừa nhận vụ hack từ giữa năm 2014 đ&atilde; khiến 500 triệu t&agrave;i khoản th&agrave;nh vi&ecirc;n bị r&ograve; rỉ. Khi đ&oacute; họ n&oacute;i rằng vụ tấn c&ocirc;ng c&oacute; li&ecirc;n quan tới yếu tố ch&iacute;nh trị, nhưng kh&ocirc;ng n&oacute;i quốc gia n&agrave;o chịu tr&aacute;ch nhiệm.</p>\r\n\r\n<p>Đến th&aacute;ng 12/2016, Yahoo tiếp tục cho hay một tỷ t&agrave;i khoản người d&ugrave;ng, bao gồm t&ecirc;n tuổi, số điện thoại, c&acirc;u hỏi bảo mật, mật khẩu v&agrave; địa chỉ email, c&oacute; thể đ&atilde; bị lấy cắp trong một cuộc tấn c&ocirc;ng kh&aacute;c của hacker diễn ra từ th&aacute;ng 8/2013.</p>\r\n\r\n<p>Hai vụ hack bị phanh phui li&ecirc;n tiếp đ&atilde; l&agrave;m tổn hại nghi&ecirc;m trọng đến h&igrave;nh ảnh của Yahoo. &quot;Con số n&agrave;y vượt xa những vụ vi phạm dữ liệu lớn nhất m&agrave; ch&uacute;ng t&ocirc;i từng chứng kiến. 500 triệu rồi đến 1 tỷ người d&ugrave;ng - đ&acirc;y l&agrave; điều chưa từng c&oacute;&quot;, chuy&ecirc;n gia an ninh mạng Troy Hunt nhấn mạnh.</p>\r\n\r\n<p>Yahoo đ&atilde; phải hạ gi&aacute; b&aacute;n bộ phận email v&agrave; c&aacute;c dịch vụ số kh&aacute;c cho Verizon từ 4,83 tỷ USD xuống c&ograve;n 4,48 tỷ USD.</p>', 'my-cao-buoc-diep-vien-nga-tan-cong-tai-khoan-yahoo', '/uploads/images/files/1635564.jpg', 0, NULL, NULL, NULL, 1, '2017-03-18 14:01:53', '2017-03-18 14:01:53'),
(9, 4, 1, 1, 'Chân dung chi tiết Galaxy S8 qua thông tin rò rỉ', '<p><strong>Samsung đ&atilde; mời b&aacute;o ch&iacute; tới tham dự sự kiện Unpacked diễn ra v&agrave;o ng&agrave;y 29/3 tới. Sự kiện Unpacked h&agrave;ng năm của Samsung l&agrave; nơi giới thiệu điện thoại Galaxy cao cấp mới của h&atilde;ng.</strong></p>', '<p>Từ nhiều th&aacute;ng trước thời điểm ra mắt, c&aacute;c th&ocirc;ng tin r&ograve; rỉ đều đặn đ&atilde; tiết lộ rất nhiều tiết cấu h&igrave;nh cũng như h&igrave;nh ảnh của Galaxy S8. Lưu &yacute; l&agrave; từ v&agrave;i năm gần đ&acirc;y, kể cả với iPhone, th&igrave; c&aacute;c tin r&ograve; rỉ về những sản phẩm c&ocirc;ng nghệ thường c&oacute; độ ch&iacute;nh x&aacute;c cao. Thực ra, kh&ocirc;ng hẳn v&igrave; c&aacute;c nh&agrave; sản xuất bảo mật th&ocirc;ng tin sản phẩm k&eacute;m m&agrave; c&oacute; thể n&oacute;i đ&oacute; l&agrave; chiến lược của c&aacute;c h&atilde;ng, bơm ra th&ocirc;ng tin r&ograve; rỉ dần dần nhằm duy tr&igrave; sự ch&uacute; &yacute; đến sản phẩm của m&igrave;nh.</p>\r\n\r\n<p>Dưới đ&acirc;y l&agrave; to&agrave;n bộ th&ocirc;ng tin r&ograve; rỉ h&eacute; lộ hầu như tất cả cấu h&igrave;nh cơ bản, t&iacute;nh năng cũng như thiết kế của Galaxy S8.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/14/1636142.jpg?t=1489902362022" /></p>\r\n\r\n<p>Đ&acirc;y l&agrave; bức ảnh được cho ảnh b&aacute;o ch&iacute; của Galaxy S8 được &quot;th&aacute;nh r&ograve; rỉ c&ocirc;ng nghệ&quot; Evan Blass tiết lộ tr&ecirc;n Twitter.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/15/1636157.jpg?t=1489902498983" /></p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/17/1636176.jpg?t=1489905509312" /></p>\r\n\r\n<p>Hiện c&oacute; hai tin đồn tr&aacute;i chiều: một tin cho rằng cả hai phi&ecirc;n bản Galaxy S8 sẽ c&oacute; m&agrave;n h&igrave;nh cong ở hai m&eacute;p; một tin đồn từ Sammobile (trang chuy&ecirc;n đưa tin về Samsung) cho rằng Galaxy S8 vẫn sẽ c&oacute; phi&ecirc;n bản m&agrave;n h&igrave;nh phẳng.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/17/1636179.jpg?t=1489905467357" /></p>\r\n\r\n<p>Galaxy S8 sẽ c&oacute; hai phi&ecirc;n bản k&iacute;ch cỡ kh&aacute;c nhau: bản nhỏ sẽ c&oacute; k&iacute;ch cỡ 5.5 hoặc 5.7 inch, c&ograve;n bản cỡ lớn gọi l&agrave; S8 Plus sẽ c&oacute; m&agrave;n h&igrave;nh 6.2 inch.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/10/1636100.jpg?t=1489902362021" /></p>\r\n\r\n<p>H&igrave;nh ảnh r&ograve; rỉ từ &quot;th&aacute;nh tin đồn c&ocirc;ng nghệ&quot; kh&aacute;c tr&ecirc;n Twitter l&agrave; @OnLeaks cho thấy k&iacute;ch cỡ của cả hai phi&ecirc;n bản Galaxy S8 so với c&aacute;c m&aacute;y cao cấp kh&aacute;c.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/17/1636173.jpg?t=1489903909920" /></p>\r\n\r\n<p>Galaxy S8 c&oacute; thể sẽ kh&ocirc;ng c&oacute; n&uacute;t Home vật l&yacute;. Cảm biến v&acirc;n tay của m&aacute;y sẽ được đưa ra mặt lưng, b&ecirc;n cạnh cụm camera.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/10/1636103.jpg?t=1489902362021" /></p>\r\n\r\n<p>Nguồn tin từ ET News cho rằng S8 sẽ c&oacute; camera k&eacute;p, một chiếc 16MP v&agrave; một chiếc 8MP. Hiện vẫn chưa r&otilde; cơ chế hoạt động tr&ecirc;n camera k&eacute;p của điện thoại n&agrave;y sẽ theo m&ocirc; h&igrave;nh của iPhone 7 Plus (một camera thường v&agrave; một camera zoom để chụp ch&acirc;n dung) hay LG G6 (một camera thường v&agrave; một camera g&oacute;c rộng).</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/12/1636124.jpg?t=1489902362022" /></p>\r\n\r\n<p>Cũng theo nguồn tin từ ET News, Samsung c&oacute; thể sẽ đưa t&iacute;nh năng lấy n&eacute;t cực nhanh của Galaxy S7 l&ecirc;n camera trước của S8. Nếu điều n&agrave;y l&agrave; sự thật th&igrave; S8 c&oacute; thể sẽ l&agrave; điện thoại c&oacute; camera trước ấn tượng.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/13/1636139.jpg?t=1489902362022" /></p>\r\n\r\n<p>Galaxy S8 sẽ c&oacute; hai phi&ecirc;n bản vi xử l&yacute;: Snapdragon 835 v&agrave; Exynos cao cấp mới nhất của Samsung.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/11/1636118.jpg?t=1489902362021" /></p>\r\n\r\n<p>Samsung c&oacute; thể sẽ giới thiệu trợ l&yacute; ảo AI mới c&oacute; t&ecirc;n l&agrave; Bixby hoạt động tương tự Siri, Alexa hay Google Assistant. Điều n&agrave;y ho&agrave;n to&agrave;n c&oacute; cơ sở bởi trước đ&oacute; v&agrave;o th&aacute;ng 10/2015, h&atilde;ng điện tử H&agrave;n Quốc đ&atilde; mua c&ocirc;ng ty chuy&ecirc;n về AI c&oacute; t&ecirc;n Viv.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/16/1636163.jpg?t=1489902788206" /></p>\r\n\r\n<p>Theo th&ocirc;ng tin từ Sammobile, trợ l&yacute; ảo Bixby c&oacute; thể kết hợp camera của Galaxy S8 để hỗ trợ nhận diện văn bản v&agrave; ph&acirc;n t&iacute;ch h&igrave;nh ảnh. Đ&acirc;y l&agrave; th&ocirc;ng tin th&uacute; vị bởi cả Siri, Alexa hay Google Assistant hiện vẫn chưa kết hợp với camera.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/11/1636112.jpg?t=1489902362021" /></p>\r\n\r\n<p>Galaxy S8 sẽ sử dụng cổng USB Type-C, c&ograve;n cổng &acirc;m thanh 3.5 mm th&igrave; hiện vẫn c&oacute; th&ocirc;ng tin tr&aacute;i chiều: c&oacute; nguồn tin n&oacute;i c&oacute; v&agrave; c&oacute; nguồn tin cho rằng S8 sẽ bỏ cổng kết nối n&agrave;y.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/16/1636166.jpg?t=1489902920078" /></p>\r\n\r\n<p>Galaxy S8 vẫn sẽ c&oacute; khả năng chống nước như S7.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/16/1636169.jpg?t=1489902971448" /></p>\r\n\r\n<p>Bạn c&oacute; thể kết nối Galaxy S8 với m&agrave;n h&igrave;nh để biến n&oacute; th&agrave;nh c&acirc;y m&aacute;y t&iacute;nh, tương tự t&iacute;nh năng Continuum tr&ecirc;n một số điện thoại Windows Phone của Microsoft.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/10/1636106.jpg?t=1489902971441" /></p>\r\n\r\n<p>Nguồn tin từ GSMarena cho rằng S8 sẽ được trang bị hai loa chất lượng cao Harman, h&atilde;ng &acirc;m thanh lớn vừa được Samsung mua lại với gi&aacute; tr&ecirc;n 8 tỷ USD.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/14/1636148.jpg?t=1489902971448" /></p>\r\n\r\n<p>Theo nguồn tin từ ET News, S8 tương tự Note 7 sẽ c&oacute; t&iacute;nh năng mở kho&aacute; bằng mống mắt. Cảm biến mống mắt c&oacute; thể d&ugrave;ng để mở kho&aacute; ứng dụng v&agrave; một số thư mục tr&ecirc;n điện thoại. Tốc độ của cảm biến mống mắt được r&ograve; rỉ l&agrave; 0,01 gi&acirc;y với hoạt động mở kho&aacute; điện thoại, si&ecirc;u nhanh.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/10/1636109.jpg?t=1489902971442" /></p>\r\n\r\n<p>Về thời điểm ra mắt, Samsung đ&atilde; x&aacute;c nhận S8 sẽ ra mắt v&agrave;o ng&agrave;y 29/3 trong sự kiện diễn ra đồng thời ở nhiều địa điểm tr&ecirc;n to&agrave;n cầu.</p>\r\n\r\n<p><strong>Cấu h&igrave;nh dự kiến c&oacute; tr&ecirc;n Galaxy S8 v&agrave; S8 Plus:</strong></p>\r\n\r\n<p>&gt;&gt; M&agrave;n h&igrave;nh Super AMOLED 5.5/5.8 inch (Galaxy S8) v&agrave; 6.2 inch (Galaxy S8 Plus) độ ph&acirc;n giải 2K, viền si&ecirc;u mảnh.</p>\r\n\r\n<p>&gt;&gt; Vi xử l&yacute; c&oacute; 2 phi&ecirc;n bản: Snapdragon 830 hoặc Exynos 8895 (tuỳ khu vực).</p>\r\n\r\n<p>&gt;&gt; RAM: 4GB hoặc 6GB (Trung Quốc).</p>\r\n\r\n<p>&gt;&gt; Bộ nhớ: 64GB, khe cắm thẻ nhớ.</p>\r\n\r\n<p>&gt;&gt; Camera: 12MP hoặc c&oacute; thể camera k&eacute;p 16/8MP, c&ograve;n camera trước 8MP.</p>\r\n\r\n<p>&gt;&gt; Pin: Galaxy S8 c&oacute; pin 3.000 mAh, c&ograve;n S8 Plus c&oacute; pin 3500 mAh.</p>\r\n\r\n<p>&gt;&gt; Loa ngo&agrave;i: hai loa của AKG, thương hiệu thuộc tập đo&agrave;n Harman đ&atilde; được Samsung mua lại.</p>\r\n\r\n<p>&gt;&gt; Chống bụi nước: IP68</p>\r\n\r\n<p>&gt;&gt; Cổng USB Type-C, cổng &acirc;m thanh 3.5mm (c&oacute; tin đồn n&oacute;i Samsung từ bỏ cổng n&agrave;y).</p>\r\n\r\n<p>&gt;&gt; T&iacute;nh năng kh&aacute;c: cảm biến mống mắt, v&acirc;n tay ở mặt lưng.</p>\r\n\r\n<p style="text-align:right"><strong>Theo VNR</strong></p>', 'chan-dung-chi-tiet-galaxy-s8-qua-thong-tin-ro-ri', '/uploads/images/files/1634683.jpg', 0, NULL, NULL, NULL, 1, '2017-03-19 05:01:27', '2017-03-19 05:01:27'),
(10, 4, 1, 1, 'Hàng loạt trang Facebook ở VN ''mất tích'' do gian lận video', '<p><strong>Đại diện người Việt của Facebook ở Singapore cho biết c&aacute;c fanpage vừa bị kho&aacute; đa phần vi phạm quy tắc về bản quyền, lừa người xem dựa tr&ecirc;n t&iacute;nh năng mới của video.</strong></p>', '<p>Sau sự cố &quot;mất t&iacute;ch&quot; ng&agrave;y 18/3, nhiều page c&oacute; lượt theo d&otilde;i lớn tại Việt Nam như &quot;C&acirc;u chuyện cuộc sống&quot;, &quot;G&oacute;c ẩm thực&quot;, &quot;Foody.vn&quot;, &quot;Kenny Sang&quot; đ&atilde; hoạt động trở lại.</p>\r\n\r\n<p>Tr&ecirc;n diễn đ&agrave;n d&agrave;nh cho c&aacute;c nh&agrave; quảng c&aacute;o, đại diện người Việt của Facebook tại Singapore cho biết c&oacute; ba nguy&ecirc;n nh&acirc;n khiến c&aacute;c fanpage tại Việt Nam bị kho&aacute; trong thời gian qua, gồm vi phạm bản quyền, lợi dụng t&iacute;nh năng webiste đi k&egrave;m video để ch&egrave;n link spam, lừa đảo người d&ugrave;ng, lơ l&agrave; bảo mật khiến hacker chiếm quyền điều khiển trang v&agrave; xo&aacute; đi ho&agrave;n to&agrave;n.</p>\r\n\r\n<p><img alt="Hàng loạt trang Facebook ở VN ''mất tích'' do gian lận video" src="http://vnreview.vn/image/16/36/74/1636748.jpg?t=1490024144986" /></p>\r\n\r\n<p><em>Một số trang fanpage đ&atilde; tu&acirc;n thủ quy định của Facebook, dẫn nguồn video để kh&ocirc;ng vi phạm bản quyền v&agrave; kh&ocirc;ng dẫn link website lừa đảo, spam b&ecirc;n dưới.</em></p>\r\n\r\n<p>Cụ thể, theo đại diện n&agrave;y, c&aacute;c fanpage tại Việt Nam muốn &quot;mượn&quot; nội dung từ c&aacute;c trang kh&aacute;c c&oacute; thể share lại b&agrave;i gốc hoặc xin ph&eacute;p trực tiếp.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute;, nhiều trang fanpage lợi dụng t&iacute;nh năng ph&aacute;t video k&egrave;m link đang thử nghiệm của Facebook để spam, lừa đảo bằng trang đi k&egrave;m b&ecirc;n dưới. Điều n&agrave;y đ&atilde; vi phạm nguy&ecirc;n tắc cộng đồng của Facebook. Do đ&oacute;, c&aacute;c chủ trang n&ecirc;n ngừng việc n&agrave;y để tr&aacute;nh bị kho&aacute;.</p>\r\n\r\n<p>Ngo&agrave;i ra, đại diện Facebook cũng cho rằng một số quản trị fanpage kh&ocirc;ng sử dụng bảo mật hai lớp, dẫn đến việc bị hacker chiếm quyền t&agrave;i khoản v&agrave; huỷ trang.&nbsp;</p>\r\n\r\n<p>Sự việc diễn ra trong ng&agrave;y 18/3 kh&ocirc;ng phải l&agrave; lần đầu c&aacute;c trang Facebook lớn ở Việt Nam bị kho&aacute;. Đầu năm 2017, trang &quot;Nghe g&igrave; coi g&igrave;&quot;, &quot;Welax&quot; v&agrave; fanpage của Giang Popper với hơn 2,7 triệu lượt like cũng gặp phải t&igrave;nh trạng n&agrave;y.</p>\r\n\r\n<p>Trong năm 2015, c&aacute;i chết của fanpage &quot;Beat.vn&quot;, &quot;Thức khuya xem b&oacute;ng đ&aacute;&quot; hay &quot;2!Idol&quot; cũng g&acirc;y x&ocirc;n xao cộng đồng mạng. C&ugrave;ng thời điểm đ&oacute;, giới kinh doanh online tại Việt Nam cũng kh&oacute;c r&ograve;ng v&igrave; h&agrave;ng loạt fanpage bị Facebook đ&oacute;ng cửa.</p>\r\n\r\n<p>Trong một diễn biến mới, Facebook vừa bổ sung t&iacute;nh năng b&aacute;o c&aacute;o th&ocirc;ng tin giả (fake news) để người d&ugrave;ng tố gi&aacute;c c&aacute;c trang đưa th&ocirc;ng tin sai lệch. Sau khi đối chiếu, Facebook sẽ tiến h&agrave;nh c&aacute;c biện ph&aacute;p để ngăn chặn v&agrave; trừng phạt. Đ&acirc;y l&agrave; h&agrave;nh động cụ thể ho&aacute; cho lời hứa tuy&ecirc;n chiến với tin tức giả của CEO Mark Zuckerberg.</p>\r\n\r\n<p>Đầu năm 2017, Bộ TTTT ban h&agrave;nh Th&ocirc;ng tư 38, quy định chi tiết về việc cung cấp th&ocirc;ng tin c&ocirc;ng cộng qua bi&ecirc;n giới. Theo đ&oacute;, những trang như Facebook, YouTube c&oacute; nghĩa vụ hợp t&aacute;c ngăn chặn những th&ocirc;ng tin xấu, độc, xử l&yacute; th&ocirc;ng tin sai sự thật, xuy&ecirc;n tạc, bịa đặt c&oacute; ảnh hưởng xấu tới x&atilde; hội tr&ecirc;n mạng Internet.</p>\r\n\r\n<p>Trong th&aacute;ng 3/2017, một số k&ecirc;nh YouTube đăng tải nội dung kh&ocirc;ng ph&ugrave; hợp đ&atilde; bị Google gỡ bỏ, hạn chế hiển thị ở Việt Nam. Một số doanh nghiệp lớn như Vietnam Airlines, Samsung, Yamaha cũng đ&atilde; ngừng quảng c&aacute;o tr&ecirc;n YouTube sau khi ph&aacute;t hiện ch&uacute;ng được hiển thị tr&ecirc;n c&aacute;c video kh&ocirc;ng ph&ugrave; hợp với ph&aacute;p luật Việt Nam.</p>\r\n\r\n<p style="text-align:right">Theo&nbsp;<em>Zing News</em></p>', 'hang-loat-trang-facebook-o-vn-mat-tich-do-gian-lan-video', '/uploads/images/files/14128774_1782272458728677_278910200_n.jpg', 0, NULL, NULL, NULL, 1, '2017-03-20 10:59:17', '2017-03-22 10:16:40'),
(11, 4, 1, 1, 'Quân đội Australia sẽ sử dụng thiết bị đeo kiểu “hộp đen”', '<p><strong>Qu&acirc;n đ&ocirc;̣i Australia sẽ sớm được trang bị các cảm bi&ecirc;́n có th&ecirc;̉ theo dõi và lưu trữ mọi cử đ&ocirc;̣ng của họ, cho phép Lực lượng qu&ocirc;́c phòng Úc (ADF) tìm hi&ecirc;̉u v&acirc;́n đ&ecirc;̀ khi xảy ra sự c&ocirc;́, gi&ocirc;́ng như đ&ocirc;́i với trường hợp h&ocirc;̣p đen của máy bay.</strong></p>', '<p><strong><img alt="" id="aui_3_2_0_1372" src="http://vnreview.vn/image/16/36/65/1636652.jpg?t=1489999979752" /></strong></p>\r\n\r\n<p>Đơn vị nghi&ecirc;n cứu của B&ocirc;̣ Qu&ocirc;́c phòng Australia đã tri&ecirc;̉n khai m&ocirc;̣t concept v&ecirc;̀ &quot;máy ghi hình chi&ecirc;́n đ&acirc;́u&quot; (fight recorder) &ndash; với ý tưởng gi&ocirc;́ng như thi&ecirc;́t bị h&ocirc;̣p đen máy bay &ndash; ghi lại mọi hoạt đ&ocirc;̣ng tr&ecirc;n máy bay. Thi&ecirc;́t bị này sẽ sử dụng các cảm bi&ecirc;́n đeo b&ecirc;n người và thời lượng pin &quot;tr&acirc;u&quot; đ&ecirc;̉ ghi lại những gì xảy ra với người lính tr&ecirc;n mặt tr&acirc;̣n.</p>\r\n\r\n<p>Máy ghi hình chi&ecirc;́n đ&acirc;́u sẽ có hai mục đích. Nó sẽ gi&ocirc;́ng như m&ocirc;̣t thi&ecirc;́t bị kh&acirc;̉n c&acirc;́p mà người lính có th&ecirc;̉ kích hoạt khi họ gặp khó khăn, dùng các k&ecirc;́t n&ocirc;́i v&ecirc;̣ tinh quỹ đạo th&acirc;́p đ&ecirc;̉ gửi tín hi&ecirc;̣u GPS trở v&ecirc;̀ cơ sở, k&ecirc;u gọi giúp đỡ.</p>\r\n\r\n<p>Trong trường hợp xảy ra tai&nbsp; nạn, nó có th&ecirc;̉ được dùng đ&ecirc;̉ ghi lại mọi hoạt đ&ocirc;̣ng của binh lính, h&ocirc;̃ trợ c&ocirc;ng tác đi&ecirc;̀u tra và đánh giá lại các chi&ecirc;́n thu&acirc;̣t qu&acirc;n sự của Australia. Qu&acirc;n đ&ocirc;̣i Australia muốn biết được khi nào thì một người l&iacute;nh đang đứng y&ecirc;n, đang chạy, đi bộ, b&ograve;, hoặc ngồi vào bất cứ l&uacute;c n&agrave;o.</p>\r\n\r\n<p>Nhóm C&ocirc;ng ngh&ecirc;̣ và Khoa học Qu&ocirc;́c phòng Australia nói rằng thi&ecirc;́t bị kh&ocirc;ng chỉ sử dụng trong qu&acirc;n đ&ocirc;̣i, mà sẽ còn hữu ích với các b&ocirc;̣ ph&acirc;̣n phi qu&acirc;n đ&ocirc;̣i khác.</p>\r\n\r\n<p>&quot;<em>Ngoài lợi ích đ&ocirc;́i với các binh lính chi&ecirc;́n đ&acirc;́u, sáng tạo c&ocirc;ng ngh&ecirc;̣ này còn mang lại lợi ích trong nhi&ecirc;̀u b&ocirc;́i cảnh, tình hu&ocirc;́ng khác, như các dịch vụ kh&acirc;̉n c&acirc;́p, các cơ quan thực thi pháp lu&acirc;̣t và các tình hu&ocirc;́ng ri&ecirc;ng tư</em>&quot;, họ nói.</p>\r\n\r\n<p>Với khả năng định vị địa lý theo d&otilde;i tọa độ của người l&iacute;nh, Australia dự đo&aacute;n c&ocirc;ng ngh&ecirc;̣ máy học c&oacute; thể gi&uacute;p tìm hi&ecirc;̉u dữ liệu, t&igrave;m ra những chiến thuật v&agrave; bảo vệ an to&agrave;n cho binh lính. Các thi&ecirc;́t bị đeo này sẽ giúp họ thu th&acirc;̣p &quot;h&agrave;ng chục th&ocirc;ng số dữ li&ecirc;̣u trong một gi&acirc;y&quot;.</p>\r\n\r\n<p><img alt="" src="http://vnreview.vn/image/16/36/65/1636655.jpg?t=1490000028596" /></p>\r\n\r\n<p>Tuy nhi&ecirc;n, v&acirc;̃n còn m&ocirc;̣t s&ocirc;́ trở ngại kỹ thu&acirc;̣t mà họ c&acirc;̀n vượt qua đ&ecirc;̉ có th&ecirc;̉ ứng dụng thực t&ecirc;́ thi&ecirc;́t bị này, và Australia đã sẵn sàng chi 700.000 USD cho các trường đại học hoặc doanh nghi&ecirc;̣p có th&ecirc;̉ x&acirc;y dựng m&ocirc;̣t sản ph&acirc;̉m nguy&ecirc;n m&acirc;̃u vượt qua những rào cản đó.</p>\r\n\r\n<p>Cụ th&ecirc;̉, họ mu&ocirc;́n m&ocirc;̣t ai đó x&acirc;y dựng những thu&acirc;̣t toán có th&ecirc;̉ tin c&acirc;̣y, đo lường được các hướng và cử đ&ocirc;̣ng của cơ th&ecirc;̉, đặc bi&ecirc;̣t trong b&ocirc;́i cảnh chi&ecirc;́n trường căng thẳng.</p>\r\n\r\n<p>&quot;<em>Dù thi&ecirc;́t bị này có ti&ecirc;̀m năng to lớn trong vi&ecirc;̣c tái hi&ecirc;̣n các cử đ&ocirc;̣ng của con người b&ecirc;n ngoài phòng thí nghi&ecirc;̣m, song c&acirc;̀n phải x&acirc;y dựng những lý thuy&ecirc;́t, thu&acirc;̣t toán và ph&acirc;̀n m&ecirc;̀m c&acirc;̀n thi&ecirc;́t đ&ecirc;̉ đạt được mục ti&ecirc;u này</em>&quot;, họ nói và s&ocirc;́ ti&ecirc;̀n được đưa ra dành cho các nhà nghi&ecirc;n cứu có th&ecirc;̉ đưa ra giải pháp là 300.000 USD (khoảng 7 tỉ đồng).</p>\r\n\r\n<p>Theo trang&nbsp;<em>ITnews</em>, hi&ecirc;̣n nay, qu&acirc;n đ&ocirc;̣i Australia đang tìm ki&ecirc;́m đơn vị có th&ecirc;̉ x&acirc;y dựng được nguy&ecirc;n m&acirc;̃u thi&ecirc;́t bị, có khả năng hoạt đ&ocirc;̣ng ở những vùng xa x&ocirc;i, đi&ecirc;̀u chỉnh linh hoạt đ&ecirc;̉ có th&ecirc;̉ kéo dài thời lượng pin và có th&ecirc;̉ cài đặt trước các chức năng. S&ocirc;́ ti&ecirc;̀n dành đ&ecirc;̉ x&acirc;y dựng ph&acirc;̀n cứng là 400.000 USD (khoảng 9,2 tỉ đồng).</p>\r\n\r\n<p style="text-align:right"><strong>Theo VNR</strong></p>', 'quan-do-i-australia-se-su-dung-thiet-bi-deo-kieu-ho-p-den', '/uploads/images/files/1636142a.jpg', 0, NULL, NULL, NULL, 1, '2017-03-20 12:43:43', '2017-03-22 10:13:40');

-- --------------------------------------------------------

--
-- Structure de la table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `socials`
--

INSERT INTO `socials` (`id`, `user_id`, `provider_user_id`, `provider`, `created_at`, `updated_at`) VALUES
(1, 1, '754008468034978', 'facebook', '2017-03-05 17:00:00', '2017-03-05 17:00:00'),
(3, 1, '1453462207', 'twitter', '2017-03-06 03:28:19', '2017-03-06 03:28:19'),
(5, 1, '102378219461660019364', 'google', '2017-03-06 03:31:32', '2017-03-06 03:31:32'),
(7, 1, '912123298890160', 'facebook', '2017-03-19 04:07:32', '2017-03-19 04:07:32');

-- --------------------------------------------------------

--
-- Structure de la table `tagpost`
--

CREATE TABLE `tagpost` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `birthday`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tien Pham', 'minhtien1096@gmail.com', '$2y$10$yhVBK.EU4vpBu8sWbq8FJ.96pbWXEJaChZGT0qMrChfgAM.u33CTK', 'Tien Pham', '1995-04-11', 2, 1, 'm3775Je7lUXZQJSziY5co4UJBMDl5nzcBhj7KS7IwVpRacTnwHCFdKFVN4IU', '2017-03-07 02:12:03', '2017-03-07 02:12:03'),
(4, 'minhtien1045696', 'minhtien109111@gmail.com', '$2y$10$fR9TaZL3OMYf0iexNWNRxuOcOzp9oQbnkkDo0M21ETZc9uMualPVO', 'Tien Pham', '1996-01-01', 2, 1, 'xHl5ywlXUoGsJZPwKHSPnuk67MSDtFJzoXHnT1QaTR7o19eLErwiDvRTxeHz', '2017-03-06 00:11:19', '2017-03-06 00:23:43'),
(20, 'test', 'test@test.test', NULL, 'test@test.test', NULL, 2, 1, NULL, NULL, '2017-03-18 03:39:57'),
(21, 'admin2', 'admin2@gmail.com', '$2y$10$mWRIwnYKNwI0j9/JyHst3OXCT4hyV3afW4bc2GJ4sr53HyxuaZoTG', 'admin2', '1996-01-04', 2, 1, NULL, '2017-03-16 08:30:40', '2017-03-16 08:30:40');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tagpost`
--
ALTER TABLE `tagpost`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `tagpost`
--
ALTER TABLE `tagpost`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
