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
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(3, 'Алексей', 'alex@mail.com', '112233', ''),
(4, 'Руслан Игоревич', 'mcgregor@gmail.com', '123456', 'admin'),
(5, 'Александер', 'alexander@mail.com', '289654', ''),
(6, 'Петрович', 'Petrovich@mail.com', '$2y$10$0HL4caz.Fva0n0m6qlMFu.8N6SAtJrIKyFWVXa1iQj1YiDI1gWI/O', ''),
(7, 'Михаил', 'Petrovich64@mail.com', '$2y$12$fdfsd9hHGhjG9f8sf7s6feUs5GLCjE3DqLnkczktn4SSql6uVU5Wm', ''),
(8, 'Петя', 'petrov@mail.ru', '$2y$12$fdfsd9hHGhjG9f8sf7s6feUs5GLCjE3DqLnkczktn4SSql6uVU5Wm', ''),
(9, 'Валентин', 'valentin@mail.ru', '$2y$12$fdfsd9hHGhjG9f8sf7s6feUs5GLCjE3DqLnkczktn4SSql6uVU5Wm', ''),
(10, 'Евгений', 'Efimov@mail.ru', '$2y$12$fdfsd9hHGhjG9f8sf7s6felc6t1UpIUwjUBxVrEex4xc8D9iMTmuu', ''),
(11, 'Геннадий', 'gena@mail.com', '$2y$12$fdfsd9hHGhjG9f8sf7s6feihjvFkHaGeQ2odsSchRRvHcqS.s0Cda', ''),
(12, 'Руслан', 'ruslan.igorevich@list.ru', '$2y$12$fdfsd9hHGhjG9f8sf7s6femNKpeNHIkCMRja9SnSrtHB6P1pbb6tO', 'admin'),
(13, 'Fedorov', 'fedorov@mail.ru', '$2y$12$fdfsd9hHGhjG9f8sf7s6feUs5GLCjE3DqLnkczktn4SSql6uVU5Wm', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
