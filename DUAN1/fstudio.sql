-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 19, 2024 lúc 08:49 AM
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
-- Cơ sở dữ liệu: `fstudio`
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
(6, 'Đồ cô dâu', 'th.jpg'),
(8, 'Đồ chú rể', 'anh-chu-re-don-2k_013637758.jpg'),
(12, 'Đồ Sui gia', 'thbame.jpg'),
(13, 'Đồ bưng quả', 'bungqua.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `product_id`, `price`, `quantity`, `order_id`) VALUES
(9, 4, 400, 1, 9),
(10, 2, 400, 1, 9),
(11, 4, 400, 2, 10),
(12, 2, 400, 1, 10),
(13, 3, 3000, 8, 11),
(14, 2, 400, 3, 11),
(15, 1, 3000, 1, 11),
(16, 3, 3000, 1, 12),
(17, 2, 400, 1, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
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
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `sale` int NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `detail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `sale`, `image`, `views`, `detail`, `category_id`) VALUES
(1, 'Đầm Cưới Maxi Vai Kiểu POXI', 'Mô tả 1            ', 3000, 2500, 'TONYWEDDING-21-10.jpg', 4, 'Chi tiết 1            ', 6),
(2, 'Đầm Cưới Maxi Trắng Trơn POXI', 'Mô tả 2    ', 400, 299, 'H_R60506.jpg', 3, 'Chi tiết 2    ', 6),
(3, 'Sản phẩm 3', 'Mô tả 3    ', 3000, 2500, 'th (2).jpg', 4, 'Chi tiết 1    ', 8),
(4, 'Sản phẩm 4', 'Mô tả 4    ', 400, 299, 'ung-dungghep-anh-co-dau.jpg', 3, 'Chi tiết 2    ', 8),
(5, 'Sản phẩm 5', 'Mô tả 5    ', 3000, 2500, 'th (1).jpg', 4, 'Chi tiết 1    ', 12),
(6, 'Sản phẩm 6', 'Mô tả 6    ', 400, 299, 'co-dau-phu-lam-gi-trong-ngay-cuoi-1.jpg', 3, 'Chi tiết 2    ', 6),
(7, 'Sản phẩm 7', 'Mô tả 7    ', 400, 299, '45225059_2034548539946025_3157741650592137216_n.jpg', 3, 'Chi tiết 2    ', 13),
(8, 'Sản phẩm 8', 'Mô tả 3    ', 3000, 2500, 'th (3).jpg', 4, 'Chi tiết 1    ', 8),
(9, 'Sản phẩm 9', 'Mô tả 2    ', 400, 299, 'chup-anh-cuoi-trong-studio-theo-phong-cach-han-quoc2.jpeg', 3, 'Chi tiết 2    ', 6),
(10, 'Sản phẩm 10', 'Mô tả 2    ', 400, 299, 'th (4).jpg', 3, 'Chi tiết 2    ', 6);

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
(1, 'admin', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, NULL, 1),
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
