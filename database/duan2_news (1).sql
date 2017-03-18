-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 18 Mars 2017 à 22:07
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
(4, 0, 'Xã Hội Số', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'xa-hoi-so', 0, 1, 1, '2017-03-15 12:39:58', '2017-03-18 03:36:28'),
(5, 0, 'Anh Ninh Mạng', 'Tin tức về chủ đề Anh ninh mạng', 'anh-ninh-mang', 0, 1, 1, '2017-03-18 03:44:27', '2017-03-18 03:44:27');

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
(6, '2017_03_05_052557_create_tags_table', 2),
(9, '2017_03_05_053156_create_type_ads_table', 2),
(10, '2017_03_05_053313_create_type_comments_table', 2),
(11, '2017_03_05_051452_create_socials_table', 4),
(12, '2017_03_05_052918_create_type_pages_table', 5),
(13, '2017_03_05_052159_create_posts_table', 6),
(14, '2017_03_05_052742_create_type_post_table', 6);

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
(8, 5, 1, 1, 'Mỹ cáo buộc điệp viên Nga tấn công tài khoản Yahoo', '<p><strong>Bộ Tư ph&aacute;p Mỹ x&aacute;c định c&oacute; hai điệp vi&ecirc;n người Nga v&agrave; hai tin tặc tham gia v&agrave;o vụ khống chế hơn 500 triệu t&agrave;i khoản của người d&ugrave;ng Yahoo năm 2014.</strong></p>', '<p>Hồ sơ t&ograve;a &aacute;n Mỹ cho biết c&oacute; bốn người tham gia v&agrave;o vụ đ&aacute;nh cắp th&ocirc;ng tin thuộc loại lớn nhất trong lịch sử Internet l&agrave; điệp vi&ecirc;n Nga Dmitry Dokuchaev v&agrave; Igor Sushchin (thuộc Tổng cục An ninh Li&ecirc;n bang Nga FSB) v&agrave; hai hacker được thu&ecirc; kh&aacute;c l&agrave; Karim Baratov v&agrave; Alexsey Belan.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Ảnh truy nã Dmitry Dokuchaev được Bộ Tư pháp Mỹ đặt trong buổi họp báo ngày 15/3." src="http://img.f5.sohoa.vnecdn.net/2017/03/17/hack-1-9067-1489726903.jpg" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ảnh truy n&atilde; Dmitry Dokuchaev được Bộ Tư ph&aacute;p Mỹ đặt trong buổi họp b&aacute;o ng&agrave;y 15/3. Ảnh:&nbsp;<em>CNN</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Belan, biệt danh Magg v&agrave; nằm trong danh s&aacute;ch truy n&atilde; của FBI, sống tại Nga v&agrave; được FSB chi&ecirc;u mộ. Người n&agrave;y đ&atilde; th&acirc;m nhập hệ thống m&aacute;y chủ của Yahoo đầu năm 2014 v&agrave; từ đ&oacute; khống chế c&ocirc;ng cụ m&agrave; c&ocirc;ng ty n&agrave;y d&ugrave;ng để quản l&yacute; những thay đổi tr&ecirc;n t&agrave;i khoản email của người d&ugrave;ng, như đổi mật khẩu mới....</p>\r\n\r\n<p>Nh&oacute;m hacker đ&atilde; sử dụng những dữ liệu thu được để truy cập v&agrave;o t&agrave;i khoản của những c&aacute; nh&acirc;n cụ thể như c&aacute;c nh&agrave; l&atilde;nh đạo, nh&agrave; ngoại giao, c&aacute;n bộ ch&iacute;nh phủ, nh&acirc;n vi&ecirc;n c&ocirc;ng ty c&ocirc;ng nghệ v&agrave; nh&agrave; b&aacute;o điều tra. Những người n&agrave;y cũng t&igrave;m kiếm th&ocirc;ng tin thẻ t&iacute;n dụng, t&agrave;i liệu t&agrave;i ch&iacute;nh, th&ocirc;ng tin đăng nhập v&agrave;o những t&agrave;i khoản c&aacute; nh&acirc;n kh&aacute;c như Gmail.</p>\r\n\r\n<p>Belan c&ograve;n khai th&aacute;c hơn 30 triệu t&agrave;i khoản Yahoo để tiến h&agrave;nh chiến dịch spam nhằm kiếm tiền bằng c&aacute;ch điều hướng người d&ugrave;ng&nbsp;tới một trang dược phẩm online (trang n&agrave;y trả tiền cho những b&ecirc;n thu h&uacute;t người d&ugrave;ng tới site của m&igrave;nh).</p>\r\n\r\n<p>&quot;Dmitry Dokuchaev v&agrave; Igor Sushchin thuộc FSB đ&atilde; trả tiền v&agrave; tạo điều kiện cho c&aacute;c hacker thu thập th&ocirc;ng tin th&ocirc;ng qua c&aacute;c vụ x&acirc;m nhập m&aacute;y t&iacute;nh ở Mỹ v&agrave; những nơi kh&aacute;c&quot;, trợ l&yacute; Bộ trưởng Tư ph&aacute;p Mary McCord cho hay.</p>\r\n\r\n<p>Trong khi đ&oacute;, Nga chưa đưa ra b&igrave;nh luận n&agrave;o về c&aacute;o buộc của Mỹ.</p>\r\n\r\n<p>Th&aacute;ng 9/2016, Yahoo thừa nhận vụ hack từ giữa năm 2014 đ&atilde; khiến 500 triệu t&agrave;i khoản th&agrave;nh vi&ecirc;n bị r&ograve; rỉ. Khi đ&oacute; họ n&oacute;i rằng vụ tấn c&ocirc;ng c&oacute; li&ecirc;n quan tới yếu tố ch&iacute;nh trị, nhưng kh&ocirc;ng n&oacute;i quốc gia n&agrave;o chịu tr&aacute;ch nhiệm.</p>\r\n\r\n<p>Đến th&aacute;ng 12/2016, Yahoo tiếp tục cho hay một tỷ t&agrave;i khoản người d&ugrave;ng, bao gồm t&ecirc;n tuổi, số điện thoại, c&acirc;u hỏi bảo mật, mật khẩu v&agrave; địa chỉ email, c&oacute; thể đ&atilde; bị lấy cắp trong một cuộc tấn c&ocirc;ng kh&aacute;c của hacker diễn ra từ th&aacute;ng 8/2013.</p>\r\n\r\n<p>Hai vụ hack bị phanh phui li&ecirc;n tiếp đ&atilde; l&agrave;m tổn hại nghi&ecirc;m trọng đến h&igrave;nh ảnh của Yahoo. &quot;Con số n&agrave;y vượt xa những vụ vi phạm dữ liệu lớn nhất m&agrave; ch&uacute;ng t&ocirc;i từng chứng kiến. 500 triệu rồi đến 1 tỷ người d&ugrave;ng - đ&acirc;y l&agrave; điều chưa từng c&oacute;&quot;, chuy&ecirc;n gia an ninh mạng Troy Hunt nhấn mạnh.</p>\r\n\r\n<p>Yahoo đ&atilde; phải hạ gi&aacute; b&aacute;n bộ phận email v&agrave; c&aacute;c dịch vụ số kh&aacute;c cho Verizon từ 4,83 tỷ USD xuống c&ograve;n 4,48 tỷ USD.</p>', 'my-cao-buoc-diep-vien-nga-tan-cong-tai-khoan-yahoo', '/uploads/images/files/1635564.jpg', 0, NULL, NULL, NULL, 1, '2017-03-18 14:01:53', '2017-03-18 14:01:53');

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
(2, 10, '100918923199041879183', 'google', '2017-03-06 03:27:42', '2017-03-06 03:27:42'),
(3, 11, '1453462207', 'twitter', '2017-03-06 03:28:19', '2017-03-06 03:28:19'),
(4, 1, '912123298890160', 'facebook', '2017-03-06 03:30:08', '2017-03-06 03:30:08'),
(5, 1, '102378219461660019364', 'google', '2017-03-06 03:31:32', '2017-03-06 03:31:32'),
(6, 13, '113293487244010602359', 'google', '2017-03-07 07:46:27', '2017-03-07 07:46:27');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `posts_id` int(11) NOT NULL,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'Tien Pham', 'minhtien1096@gmail.com', '$2y$10$yhVBK.EU4vpBu8sWbq8FJ.96pbWXEJaChZGT0qMrChfgAM.u33CTK', 'Tien Pham', '1995-04-11', 2, 1, 'IioN2JJ7nzOei3GriBqsoh0foPc7ykWkAemHKL9NtYc4rES9l3qo1ETWFxc8', '2017-03-07 02:12:03', '2017-03-07 02:12:03'),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
