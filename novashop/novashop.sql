-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th10 26, 2024 lúc 09:45 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `novashop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`) VALUES
(1, 'Giày lining', 'Giày cầu lông Lining AYZU019-4.webp'),
(2, 'Giày yonex', 'Giày cầu lông Yonex SHB 510WCR.webp'),
(3, 'Giày Mizuno', 'Giày cầu lông Mizuno Gate Sky 2.webp'),
(4, 'Giày Victor', 'Giày cầu lông Victor Crayon Shinchan A39JRCS.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderdetails_orders_order_id` (`order_id`),
  CONSTRAINT `fk_orderdetails_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer`, `phone`, `address`, `user_id`, `create_at`) VALUES
(9, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 02:31:11'),
(10, 'Hung', '2, Lê Thị Kim', '56565756757', 1, '2024-06-26 02:37:14'),
(11, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 23:57:40'),
(12, 'Hung', '2, Lê Thị Kim', '0976385309', 1, '2024-06-26 23:59:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
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
  `category_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `sale`, `image`, `views`, `detail`, `category_id`, `status`) VALUES
(24, 'Giày cầu lông Mizuno Gate Sky Plus 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 1900000, 1800000, 'Giày Cầu Lông Mizuno Wave Claw Neo 2.webp', 0, '                        Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3, 1),
(25, 'Giày Cầu Lông Mizuno Wave Claw 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n          ', 235435, NULL, 'Giày cầu lông Mizuno Gate Sky Plus 3.webp', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n        ', 3, 1),
(26, 'Giày cầu lông Mizuno Wave Claw Neo 3', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 15000000, NULL, 'Giày cầu lông Mizuno Wave Claw Neo 3.jpg', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3, 1),
(27, 'Giày cầu lông Mizuno Wave Fang El 2', 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 243509, 1, 'Giày cầu lông Mizuno Wave Fang El 2.webp', 0, 'Đặc điểm nổi bật\r\nChất lượng vượt trội: Được làm từ nguyên liệu cao cấp, sản phẩm đảm bảo độ bền và hiệu suất tối ưu.\r\nThiết kế hiện đại: Mang phong cách tinh tế và phù hợp với mọi nhu cầu sử dụng.\r\nTiện ích đa năng: Sản phẩm tích hợp nhiều tính năng, hỗ trợ bạn trong công việc và cuộc sống hằng ngày.\r\n', 3, 1),
(28, 'Giày Cầu Lông Yonex SHB 88 Dial 3', 'pk', 2290000, NULL, 'Giày Cầu Lông Yonex SHB 88 Dial 3.webp', 65, 'ok', 2, 1),
(29, 'Giày cầu lông Yonex 65Z3 New', 'ok', 2950000, NULL, 'Giày cầu lông Yonex 65Z3 New.webp', 36, 'ok', 2, 1),
(30, 'Giày cầu lông Yonex Eclipsion Z Men', 'ok', 2179000, NULL, 'Giày cầu lông Yonex Eclipsion Z Men.jpg', 234, 'ok', 2, 1),
(31, 'Giày Cầu Lông Yonex Precision 2 ', 'ok', 950000, NULL, 'Giày Cầu Lông Yonex Precision 2.webp', 0, 'ok', 2, 1),
(32, 'Giày cầu lông Lining AYAU007-4', 'ok', 2500000, NULL, 'Giày cầu lông Lining AYAU007-4.jpg', 0, 'ok', 1, 1),
(33, 'Giày cầu lông Lining AYAU007-3', 'ok', 2500000, NULL, 'Giày cầu lông Lining AYAU007-3.jpg', 0, '', 1, 1),
(34, 'Giày cầu lông Lining AYAU007-1', 'ok', 3000000, NULL, 'Giày cầu lông Lining AYAU007-1.jpg', 0, 'k', 1, 1),
(35, 'Giày cầu lông Lining AYZU015-1', 'ok', 3500000, NULL, 'Giày cầu lông Lining AYZU015-1.webp', 0, 'ok', 1, 1),
(36, 'Giày cầu lông Lining AYAU007-2', 'ok', 900000, NULL, 'Giày cầu lông Lining AYAU007-2.webp', 0, 'ok', 1, 1),
(37, 'Giày cầu lông Yonex Comfort Z3 Men', 'ok', 3999999, NULL, 'Giày cầu lông Yonex Comfort Z3 Men.webp', 0, '', 2, 1),
(38, 'Giày Cầu Lông Yonex SHB 34 LX', 'Giày Cầu Lông Yonex SHB 34 LX', 1670000, NULL, 'Giày Cầu Lông Yonex SHB 34 LX.webp', 0, '', 2, 1),
(39, 'Giày cầu lông Yonex SHB-02 LX ', 'Giày cầu lông Yonex SHB-02 LX ', 2354600, NULL, 'Giày cầu lông Yonex SHB-02 LX.webp', 0, '', 2, 1),
(40, 'Giày cầu lông Mizuno Wave Thunderstorm - Đen Trắng Xanh chính hãng', 'ok', 1790000, NULL, 'Giày cầu lông Mizuno Wave Thunderstorm - Đen Trắng Xanh chính hãng.webp', 0, '', 3, 1),
(41, 'Giày cầu lông Victor Crayon Shinchan A39JRCS 9', '', 2345000, 123213, 'Giày cầu lông Victor Crayon Shinchan A39JRCS 9.webp', 0, '', 4, 1),
(42, 'Giày cầu lông Victor Crayon Shinchan A39CS - AF', 'ok', 2450000, NULL, 'Giày cầu lông Victor Crayon Shinchan A39CS - AF.webp', 124, 'ok', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phone`, `block`, `role_id`) VALUES
(1, 'admin', 'admin@gmail.com', '7a672068117bd7819d0da88510d0e73e', NULL, NULL, 1),
(2, 'user1', 'nqh2610@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL),
(3, 'user2', 'user2@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL),
(6, 'user3', 'user3@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orderdetail_product_product_id` (`product_id`),
  ADD KEY `fk_orderdetail_order_order_id` (`order_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category_cate_id_id` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_orderdetail_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_orderdetail_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category_cate_id_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
