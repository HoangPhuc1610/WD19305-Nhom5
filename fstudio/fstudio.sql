-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 21, 2024 at 09:42 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asm`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Giày lining', 'Giày cầu lông Lining AYZU019-4.webp'),
(2, 'Giày yonex', 'Giày cầu lông Yonex SHB 510WCR.webp'),
(3, 'Giày Mizuno', 'Giày cầu lông Mizuno Gate Sky 2.webp'),
(4, 'Giày Victor', 'Giày cầu lông Victor Crayon Shinchan A39JRCS.webp');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `phone`, `address`, `user_id`, `create_at`) VALUES
(9, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 02:31:11'),
(10, 'Hung', '2, Lê Thị Kim', '56565756757', 1, '2024-06-26 02:37:14'),
(11, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 23:57:40'),
(12, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 23:59:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `sale` int DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `sale`, `image`, `views`, `detail`, `category_id`) VALUES
(24, 'Giày cầu lông Mizuno Gate Sky Plus 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 1900000, 1800000, 'Giày Cầu Lông Mizuno Wave Claw Neo 2.webp', 0, '                        Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3),
(25, 'Giày Cầu Lông Mizuno Wave Claw 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n          ', 235435, NULL, 'Giày cầu lông Mizuno Gate Sky Plus 3.webp', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n        ', 3),
(26, 'Giày cầu lông Mizuno Wave Claw Neo 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 15000000, NULL, 'Giày cầu lông Mizuno Wave Claw Neo 3.jpg', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3),
(27, 'Giày cầu lông Mizuno Wave Fang El 2', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 243509, 1, 'Giày cầu lông Mizuno Wave Fang El 2.webp', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3),
(28, 'Giày Cầu Lông Yonex SHB 88 Dial 3', 'pk', 2290000, NULL, 'Giày Cầu Lông Yonex SHB 88 Dial 3.webp', 65, 'ok', 2),
(29, 'Giày cầu lông Yonex 65Z3 New', 'ok', 2950000, NULL, 'Giày cầu lông Yonex 65Z3 New.webp', 36, 'ok', 2),
(30, 'Giày cầu lông Yonex Eclipsion Z Men', 'ok', 2179000, NULL, 'Giày cầu lông Yonex Eclipsion Z Men.jpg', 234, 'ok', 2),
(31, 'Giày Cầu Lông Yonex Precision 2 ', 'ok', 950000, NULL, 'Giày Cầu Lông Yonex Precision 2.webp', 0, 'ok', 2),
(32, 'Giày cầu lông Lining AYAU007-4', 'ok', 2500000, NULL, 'Giày cầu lông Lining AYAU007-4.jpg', 0, 'ok', 1),
(33, 'Giày cầu lông Lining AYAU007-3', 'ok', 2500000, NULL, 'Giày cầu lông Lining AYAU007-3.jpg', 0, '', 1),
(34, 'Giày cầu lông Lining AYAU007-1', 'ok', 3000000, NULL, 'Giày cầu lông Lining AYAU007-1.jpg', 0, 'k', 1),
(35, 'Giày cầu lông Lining AYZU015-1', 'ok', 3500000, NULL, 'Giày cầu lông Lining AYZU015-1.webp', 0, 'ok', 1),
(36, 'Giày cầu lông Lining AYAU007-2', 'ok', 900000, NULL, 'Giày cầu lông Lining AYAU007-2.webp', 0, 'ok', 1),
(37, 'Giày cầu lông Yonex Comfort Z3 Men', 'ok', 3999999, NULL, 'Giày cầu lông Yonex Comfort Z3 Men.webp', 0, '', 2),
(38, 'Giày Cầu Lông Yonex SHB 34 LX', 'Giày Cầu Lông Yonex SHB 34 LX', 1670000, NULL, 'Giày Cầu Lông Yonex SHB 34 LX.webp', 0, '', 2),
(39, 'Giày cầu lông Yonex SHB-02 LX ', 'Giày cầu lông Yonex SHB-02 LX ', 2354600, NULL, 'Giày cầu lông Yonex SHB-02 LX.webp', 0, '', 2),
(40, 'Giày cầu lông Mizuno Wave Thunderstorm - Đen Trắng Xanh chính hãng', 'ok', 1790000, NULL, 'Giày cầu lông Mizuno Wave Thunderstorm - Đen Trắng Xanh chính hãng.webp', 0, '', 3),
(41, 'Giày cầu lông Victor Crayon Shinchan A39JRCS 9', '', 2345000, NULL, 'Giày cầu lông Victor Crayon Shinchan A39JRCS 9.webp', 0, '', 4),
(42, 'Giày cầu lông Victor Crayon Shinchan A39CS - AF', 'ok', 2450000, NULL, 'Giày cầu lông Victor Crayon Shinchan A39CS - AF.webp', 124, 'ok', 4),
(43, 'Giày cầu lông Victor P8500TD', 'ok', 1390000, NULL, 'Giày cầu lông Victor P8500TD.webp', 30, 'ok', 4),
(44, 'Giày cầu lông Victor P9200A', 'ok', 2090000, NULL, 'Giày cầu lông Victor P9200A.webp', 100, 'ok', 4),
(45, 'Giày Cầu Lông Victor A170 II-A', 'ok', 1070000, NULL, 'Giày Cầu Lông Victor A170 II-A.webp', 200, 'ok', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `block` tinyint(1) DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phone`, `block`, `role_id`) VALUES
(1, 'admin', 'admin@gmail.com', '6ea798a0c56a77d83b7d4925ffa968ba', NULL, NULL, 1),
(2, 'user1', 'nqh2610@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL),
(3, 'user2', 'user2@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL),
(6, 'user3', 'user3@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderdetail_product_product_id` (`product_id`),
  ADD KEY `fk_orderdetail_order_order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users_user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category_cate_id_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_orderdetail_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_orderdetail_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category_cate_id_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
