-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 17 2017 г., 21:39
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 9),
(2, 1, 24),
(3, 1, 25),
(4, 1, 35),
(5, 1, 36),
(6, 1, 37),
(7, 1, 38),
(8, 1, 39),
(9, 1, 42),
(10, 1, 47),
(11, 1, 51),
(12, 46, 18),
(13, 46, 24),
(14, 46, 26),
(15, 46, 29),
(16, 46, 35),
(17, 46, 37),
(18, 46, 38),
(19, 46, 39),
(20, 46, 41),
(21, 46, 48),
(22, 46, 51),
(23, 47, 15),
(24, 47, 24),
(25, 47, 25),
(26, 47, 35),
(27, 47, 37),
(28, 47, 38),
(29, 47, 39),
(30, 47, 40),
(31, 47, 42),
(32, 47, 47),
(33, 47, 51),
(34, 48, 16),
(35, 48, 24),
(36, 48, 25),
(37, 48, 27),
(38, 48, 35),
(39, 48, 37),
(40, 48, 38),
(41, 48, 41),
(42, 48, 45),
(43, 48, 48),
(44, 48, 51),
(45, 49, 9),
(46, 49, 24),
(47, 49, 25),
(48, 49, 35),
(49, 49, 36),
(50, 49, 37),
(51, 49, 38),
(52, 49, 39),
(55, 49, 42),
(56, 49, 57),
(67, 51, 10),
(68, 51, 24),
(69, 51, 25),
(70, 51, 27),
(71, 51, 30),
(72, 51, 34),
(73, 51, 35),
(74, 51, 37),
(75, 51, 38),
(76, 51, 39),
(77, 51, 50),
(78, 51, 63),
(79, 52, 17),
(80, 52, 24),
(81, 52, 25),
(82, 52, 27),
(83, 52, 35),
(84, 52, 38),
(85, 52, 39),
(86, 52, 41),
(87, 52, 49),
(88, 52, 54),
(89, 53, 21),
(90, 53, 27),
(91, 53, 35),
(92, 53, 38),
(93, 53, 48),
(94, 53, 58),
(95, 54, 10),
(96, 54, 24),
(97, 54, 25),
(98, 54, 27),
(99, 54, 30),
(100, 54, 32),
(101, 54, 29),
(102, 54, 31),
(103, 54, 35),
(104, 54, 37),
(105, 54, 42),
(106, 54, 50),
(107, 55, 11),
(108, 55, 24),
(109, 55, 25),
(110, 55, 27),
(111, 55, 29),
(112, 55, 30),
(113, 55, 28),
(114, 55, 32),
(115, 55, 37),
(116, 55, 38),
(117, 55, 50),
(118, 55, 55);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
