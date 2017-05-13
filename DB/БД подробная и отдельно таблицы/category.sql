-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 17 2017 г., 21:37
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
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`, `sort_order`, `status`) VALUES
(1, 'Производители', 0, 1, 1),
(2, 'Поддержка платформ', 0, 3, 1),
(3, 'Дисплей', 0, 5, 1),
(4, 'Уведомления', 0, 7, 1),
(5, 'Мониторинг', 0, 9, 1),
(6, 'Датчики', 0, 11, 1),
(7, 'Материал', 0, 13, 1),
(8, 'Цвет', 0, 15, 1),
(9, 'Jawbone', 1, 2, 1),
(10, 'Huawei', 1, 2, 1),
(11, 'Sony', 1, 2, 0),
(12, 'Striv', 1, 2, 0),
(13, 'Samsung', 1, 2, 0),
(14, 'Asus', 1, 2, 1),
(15, 'Belsis', 1, 2, 1),
(16, 'Runtastic', 1, 2, 1),
(17, 'Mio', 1, 2, 1),
(18, 'Fitbit', 1, 2, 1),
(19, 'Razer', 1, 2, 0),
(20, 'Harper', 1, 2, 0),
(21, 'Xiaomi', 1, 2, 1),
(22, 'Onetrak', 1, 2, 0),
(23, 'Sigma', 1, 2, 0),
(24, 'Android', 2, 4, 1),
(25, 'IOS', 2, 4, 1),
(26, 'Windows Phone', 2, 4, 1),
(27, 'Есть', 3, 6, 1),
(28, 'Социальные сети', 4, 8, 1),
(29, 'Входящие вызовы', 4, 8, 1),
(30, 'SMS', 4, 8, 1),
(31, 'Пропущенные вызовы', 4, 8, 1),
(32, 'Электронная почта', 4, 8, 1),
(33, 'Календарь', 4, 8, 1),
(34, 'Погода', 4, 8, 1),
(35, 'Калорий', 5, 10, 1),
(36, 'Настроения', 5, 10, 1),
(37, 'Сна', 5, 10, 1),
(38, 'Физической активности', 5, 10, 1),
(39, 'Акселерометр', 6, 12, 1),
(40, 'Гироскоп', 6, 12, 1),
(41, 'Пульсометр', 6, 12, 1),
(42, 'Шагомер', 6, 12, 1),
(43, 'Термометр', 6, 12, 1),
(44, 'Атмосферного давления', 6, 12, 1),
(45, 'Освещенности', 6, 12, 1),
(46, 'Приближения', 6, 12, 0),
(47, 'Резина', 7, 14, 1),
(48, 'Силикон', 7, 14, 1),
(49, 'Пластик', 7, 14, 1),
(50, 'Кожа', 7, 14, 1),
(51, 'Черный', 8, 16, 1),
(52, 'Синий', 8, 16, 0),
(53, 'Красный', 8, 16, 0),
(54, 'Голубой', 8, 16, 1),
(55, 'Белый', 8, 16, 0),
(56, 'Салатовый', 8, 16, 0),
(57, 'Оранжевый', 8, 16, 1),
(58, 'Зеленый', 8, 16, 0),
(59, 'Золотистый', 8, 16, 0),
(60, 'Серебристый', 8, 16, 0),
(61, 'Розовый', 8, 16, 0),
(62, 'Серый', 8, 16, 0),
(63, 'Коричневый', 8, 16, 1),
(64, 'Polar', 1, 2, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
