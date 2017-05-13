-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 17 2017 г., 21:38
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
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_count` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_count`) VALUES
(1, 1, 46, '1'),
(2, 1, 47, '2'),
(3, 58, 52, '1'),
(4, 63, 52, '1'),
(5, 64, 52, '1'),
(6, 64, 51, '1'),
(7, 65, 52, '1'),
(8, 65, 51, '1'),
(9, 66, 52, '1'),
(10, 67, 52, '2'),
(11, 79, 49, '1'),
(12, 80, 52, '1'),
(13, 81, 51, '1'),
(14, 82, 52, '1'),
(15, 83, 52, '1'),
(16, 84, 49, '1'),
(17, 85, 52, '1'),
(18, 100, 52, '1'),
(19, 101, 52, '1'),
(20, 102, 52, '1'),
(21, 103, 51, '1'),
(22, 104, 52, '1'),
(23, 105, 52, '1'),
(24, 105, 51, '1'),
(25, 106, 52, '1'),
(26, 107, 52, '1'),
(27, 108, 52, '1'),
(28, 109, 52, '1'),
(29, 110, 52, '1'),
(30, 111, 52, '1'),
(31, 112, 52, '1'),
(32, 112, 51, '1'),
(33, 113, 52, '1'),
(34, 113, 51, '2'),
(35, 113, 49, '1'),
(36, 114, 52, '1'),
(37, 114, 51, '2'),
(38, 114, 49, '1'),
(39, 115, 52, '1'),
(40, 115, 51, '2'),
(41, 115, 49, '1'),
(42, 116, 47, '1'),
(43, 117, 52, '1'),
(44, 117, 51, '1'),
(45, 118, 52, '1'),
(46, 118, 51, '1'),
(47, 119, 52, '1'),
(48, 119, 51, '1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
