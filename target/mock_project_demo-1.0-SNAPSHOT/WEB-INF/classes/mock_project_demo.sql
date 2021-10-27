-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2021 lúc 05:42 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mock_project_demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_report`
--

CREATE TABLE `categories_report` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `passed_question` int(11) DEFAULT NULL,
  `timer` int(11) NOT NULL,
  `total_questions` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `categories_report`
--

INSERT INTO `categories_report` (`id`, `categories`, `date`, `passed_question`, `timer`, `total_questions`, `username`) VALUES
(1, 'Random', '2021-10-27 03:37:02', 10, 300, 10, 'User01'),
(2, 'Python', '2021-10-27 03:37:29', 3, 150, 5, 'User01'),
(3, 'Nodejs', '2021-10-27 03:38:09', 3, 90, 3, 'User02'),
(4, 'Random', '2021-10-27 03:39:27', 10, 600, 20, 'User02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`) VALUES
(1, 'Java'),
(2, 'Python'),
(3, 'C#'),
(4, 'Nodejs'),
(5, 'Angular');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `a` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `b` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `c` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `d` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `questionContent` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `question`
--

INSERT INTO `question` (`id`, `a`, `answer`, `b`, `c`, `d`, `duration`, `questionContent`, `category_id`) VALUES
(1, '2', 'C', '3', '4', '5', 30, '2 + 2 = ?', 1),
(2, '2', 'D', '3', '4', '5', 30, '2 + 3 = ?', 1),
(3, '5', 'B', '6', '7', '8', 30, '2 + 4 = ?', 1),
(4, '2', 'C', '3', '4', '5', 30, '2 x 2 = ?', 1),
(5, '2', 'D', '3', '4', '6', 30, '2 x 3 = ?', 1),
(6, '5', 'D', '6', '7', '8', 30, '2 x 4 = ?', 1),
(7, '2', 'D', '3', '4', '7', 30, '2 + 5 = ?', 1),
(8, '2', 'C', '3', '8', '5', 30, '2 + 6 = ?', 1),
(9, '5', 'B', '9', '7', '8', 30, '2 + 7 = ?', 1),
(10, '2', 'D', '3', '4', '7', 30, '2 + 5 = ?', 1),
(11, '2', 'C', '3', '8', '5', 30, '2 + 6 = ?', 1),
(12, '5', 'B', '9', '7', '8', 30, '2 + 7 = ?', 1),
(13, '2', 'D', '3', '4', '10', 30, '2 x 5 = ?', 2),
(14, '12', 'A', '3', '8', '5', 30, '2 x 6 = ?', 2),
(15, '5', 'B', '14', '7', '8', 30, '2 x 7 = ?', 2),
(16, '2', 'C', '3', '10', '7', 30, '2 x 5 = ?', 2),
(17, '12', 'A', '3', '8', '5', 30, '2 x 6 = ?', 2),
(18, '5', 'C', '9', '14', '8', 30, '2 x 7 = ?', 3),
(19, '2', 'B', '10', '4', '7', 30, '2 x 5 = ?', 3),
(20, '12', 'A', '3', '8', '5', 30, '2 x 6 = ?', 3),
(21, '5', 'B', '4', '7', '8', 30, '12 / 3 = ?', 4),
(22, '2', 'B', '3', '4', '7', 30, '12 / 4 = ?', 4),
(23, '2', 'C', '3', '26', '5', 30, '20 + 6 = ?', 4),
(24, '5', 'B', '9', '7', '8', 30, '2 x 7 - 5 = ?', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--
-- username: Mentor/pass: 123
INSERT INTO `user` (`id`, `password`, `status`, `username`) VALUES
(1, '$2a$10$kP6cmJz0WaikiUmS.N2sVuyJWoAcjflaaYswgCMhqt/1suK4KwfW2', 'ACTIVE', 'Mentor'), 
(2, '$2a$10$6tfzxd4EEDUT16CKXDZv6u4jGfyv6G9JZtELOL.AV11lHZl/WOouC', 'ACTIVE', 'User01'),
(3, '$2a$10$M7hxg1Zd2JkWvd76CeKK/O59BZTSHdoGExSi.idvt0XWsgO1v0b.i', 'ACTIVE', 'User02'),
(4, '$2a$10$LtunGHjY4xpNrYoZDYZKNuga3QCkbgPQKWRBEK50mF9cDu.RaJNNy', 'UNACTIVE', 'User03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'ROLE_MENTOR'),
(2, 'ROLE_MEMBER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role_relationship`
--

CREATE TABLE `user_role_relationship` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role_relationship`
--

INSERT INTO `user_role_relationship` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories_report`
--
ALTER TABLE `categories_report`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7jaqbm9p4prg7n91dd1uabrvj` (`category_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_role_relationship`
--
ALTER TABLE `user_role_relationship`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKjrky4py4v4t0v3aw7mmc92sne` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories_report`
--
ALTER TABLE `categories_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK7jaqbm9p4prg7n91dd1uabrvj` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `user_role_relationship`
--
ALTER TABLE `user_role_relationship`
  ADD CONSTRAINT `FKehp88qoke5p45o64h3j6p08q5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKjrky4py4v4t0v3aw7mmc92sne` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
