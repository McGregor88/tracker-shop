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
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `h1` varchar(255) NOT NULL,
  `short_content` text NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preview` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `h1`, `short_content`, `content`, `date`, `preview`, `status`) VALUES
(1, 'Появились изображения отмененного смарт-браслета Microsoft Band 3', 'Как известно, недавно компания Microsoft полностью прекратила продажи своего смарт-браслета Band 2 и расформировала команду, ответственную за его развитие. Но это вовсе не означает, что компания не планировала выпускать третье поколение браслета.', 'Как известно, недавно компания Microsoft полностью прекратила продажи своего смарт-браслета Band 2 и расформировала команду, ответственную за его развитие. Но это вовсе не означает, что компания не планировала выпускать третье поколение браслета. Прямое тому доказательство – опубликованные источником изображения, на которых якобы запечатлен умный браслет Microsoft Band 3.\r\n\r\nАвтор изображения утверждает, что устройство имело влагозащищенное исполнение, монитор артериального давления и поддержку RFID.\r\n\r\nДизайн Microsoft Band 3 в целом выдержан в духе предшественника Microsoft Band 2. Исключением здесь является лишь слегка обновленная застежка. На одном из снимков на экране браслета можно увидеть плитку с иконкой пловца, из чего можно сделать вывод, что устройство может использоваться для отслеживания плавания. Доподлинно неизвестно, почему Microsoft передумала выпускать Band 3 – публично никаких заявлений компания не делала. В то же время программный гигант и дальше будет оказывать поддержку нынешним владельцам умных браслетов Band, в своей время отважившихся стать частью весьма непродолжительного фитнес-путешествия Microsoft.', '2017-04-17 18:36:05', 'Microsoft Band 3', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
