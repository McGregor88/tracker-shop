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
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_comment` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_name`, `user_phone`, `user_comment`, `user_id`, `date`, `status`) VALUES
(1, 'Алексей', '8964511243', 'Самовывоз', 3, '2017-03-18 13:09:27', 3),
(2, 'rgfgfg', '4654654654654646', 'fbhfggfgdg', 0, '2017-03-21 20:02:20', 1),
(3, 'Виталий', '89646153610', 'Самовывоз', 0, '2017-03-21 20:16:13', 1),
(4, 'Руслан Игоревич', '89646153688', 'Доставка', 4, '2017-03-21 20:18:45', 1),
(5, 'Алексий', '636372639269386', 'доставкааааа', 0, '2017-03-21 21:39:58', 1),
(6, 'Алексий', '636372639269386', 'доставкааааа', 0, '2017-03-21 21:40:09', 1),
(35, 'рпропорпорп', '786786666876876876', 'опорпропропоп', 0, '2017-04-12 18:31:14', 1),
(36, 'выловлыовло', '090-90-90-9-0909', 'ошвоышвоывы', 0, '2017-04-12 18:33:51', 1),
(37, 'выловлыовло', '090-90-90-9-0909', 'ошвоышвоывы', 0, '2017-04-12 18:34:43', 1),
(38, 'ывывфывфв', '098908908098908', 'роролролролрлорлорлор', 0, '2017-04-12 18:35:51', 1),
(39, 'Jkyhd', '7789789789789789', 'hgghjghjghjgjhghj', 0, '2017-04-12 19:05:36', 1),
(40, 'asdasdsadsadsad', '8779789789798798789', 'hkjhjkhjkhjkhkjhk', 0, '2017-04-12 19:08:27', 1),
(41, 'asdasdsadsadsad', '8779789789798798789', 'hkjhjkhjkhjkhkjhk', 0, '2017-04-12 19:09:32', 1),
(43, 'Маша', '2387827327389729372', 'авыаываываываывавы', 0, '2017-04-12 20:36:40', 1),
(44, 'Маша', '2387827327389729372', 'авыаываываываывавы', 0, '2017-04-12 20:37:18', 1),
(45, 'Маша', '2387827327389729372', 'авыаываываываывавы', 0, '2017-04-12 20:37:41', 1),
(46, 'Маша', '2387827327389729372', 'авыаываываываывавы', 0, '2017-04-12 20:38:26', 1),
(47, 'Павекны', '7897897897987897', 'ролролролролролрлор', 0, '2017-04-12 20:41:53', 1),
(48, 'авакауаука', '6554543543545', 'павпапавпавап', 0, '2017-04-12 20:52:53', 1),
(49, 'авакауаука', '6554543543545', 'павпапавпавап', 0, '2017-04-12 20:53:38', 1),
(50, 'авакауаука', '6554543543545', 'павпапавпавап', 0, '2017-04-12 20:54:05', 1),
(51, 'авакауаука', '6554543543545', 'павпапавпавап', 0, '2017-04-12 20:54:39', 1),
(52, 'врпапргапврпар', '8789789789789789', 'роролролролролр', 0, '2017-04-12 20:59:48', 1),
(53, 'РПрпрпрпро', '089789089898908', 'олролролролролр', 0, '2017-04-12 21:01:56', 1),
(54, 'РПрпрпрпро', '089789089898908', 'олролролролролр', 0, '2017-04-12 21:02:57', 1),
(55, 'РПрпрпрпро', '089789089898908', 'олролролролролр', 0, '2017-04-12 21:03:14', 1),
(56, 'РПрпрпрпро', '089789089898908', 'олролролролролр', 0, '2017-04-12 21:04:27', 1),
(57, 'ПавелПерец', '9089089089089089', 'Хочу врвргыы', 0, '2017-04-12 21:12:11', 1),
(58, 'ПавелПерец', '9089089089089089', 'Хочу врвргыы', 0, '2017-04-12 21:14:19', 1),
(59, 'ОРолролрор', '65646546546456', 'авававаываыава', 0, '2017-04-12 21:17:49', 1),
(60, 'квавававававава', '65646546546456', 'авававаываыава', 0, '2017-04-12 21:18:01', 1),
(61, 'квавававававава', '6564654654645643434', 'авававаываыава', 0, '2017-04-12 21:18:05', 1),
(62, 'вывывфвфвфыв', '09787089787809708', 'толролрлрлр', 0, '2017-04-12 21:19:11', 1),
(63, 'вывывфвфвфыв', '09787089787809708', 'толролрлрлр', 0, '2017-04-12 21:19:37', 1),
(64, 'Магоыыф', '877896785656587', 'ороолыффыфы', 0, '2017-04-12 21:21:49', 1),
(65, 'Магоыыф', '877896785656587', 'ороолыффыфы', 0, '2017-04-12 21:21:51', 1),
(66, 'Магоыыф', '877896785656587', 'ороолыффыфы', 0, '2017-04-12 21:22:07', 1),
(67, 'Валентин', '8908908908908908', 'тотлотыолтфолтфолыт', 0, '2017-04-12 21:24:01', 1),
(68, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:28:03', 1),
(69, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:28:05', 1),
(70, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:28:20', 1),
(71, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:28:42', 1),
(72, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:28:57', 1),
(73, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:30:46', 1),
(74, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:30:49', 1),
(75, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:31:26', 1),
(76, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:31:47', 1),
(77, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:31:49', 1),
(78, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:33:21', 1),
(79, 'Валентин', '098908098908908', 'гшрловыовтоывывыв', 0, '2017-04-12 21:34:28', 1),
(80, 'Павпвпв', '9890890808098098', 'лоролрлрлрлр', 0, '2017-04-12 21:35:18', 1),
(81, 'вааыаыаыаыа', '8978979797897897', 'рролролролролрлр', 0, '2017-04-12 21:37:28', 1),
(82, 'Мизаил', '88098098908908', 'Паврвошылыыыы', 0, '2017-04-12 21:38:26', 1),
(83, 'Маша', '8990890890890', 'рлоролролрлорлор', 0, '2017-04-12 21:41:14', 1),
(84, 'Петя', '8990890809809809', 'ролоролрлорлорлор', 0, '2017-04-12 21:42:12', 1),
(85, 'ЛОРлорлоролрлор', '09890098098098', 'рлорлолорлорлор', 0, '2017-04-12 21:43:16', 1),
(86, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:50:06', 1),
(87, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:50:09', 1),
(88, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:52:26', 1),
(89, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:52:30', 1),
(90, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:53:37', 1),
(91, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:53:41', 1),
(92, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:53:51', 1),
(93, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:53:53', 1),
(94, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:54:31', 1),
(95, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:54:57', 1),
(96, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:55:23', 1),
(97, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:56:12', 1),
(98, 'олрлрлролролр', '908098908908098', 'тириолролролрлор', 0, '2017-04-12 21:56:14', 1),
(99, 'гролролролр', '8790098908080988', 'рполрлрлрлр', 0, '2017-04-12 21:56:29', 1),
(100, 'гролролролр', '8790098908080988', 'рполрлрлрлр', 0, '2017-04-12 21:57:49', 1),
(101, 'Евгений', '987665798789789', 'олтолыролврывывыв', 0, '2017-04-12 21:59:24', 1),
(102, 'ороролролророл', '87908098908908098', 'ролролролрлорлоро', 0, '2017-04-12 22:00:11', 1),
(103, 'Павел', '787987897897', 'оролрволырлврылв', 0, '2017-04-12 22:02:06', 1),
(104, 'Клавдий', '877890890890898908', 'оловлоащвоащлывоаыв', 0, '2017-04-12 22:10:56', 1),
(105, 'Петрович', '9807896789890', 'олвывыввыфвыфв', 0, '2017-04-12 22:11:48', 1),
(106, 'Петрович', '9807896789890', 'олвывыввыфвыфв', 0, '2017-04-12 22:12:00', 1),
(107, 'Степановна', '9867567877987987', 'аваывавыаывавыа', 0, '2017-04-12 22:12:46', 1),
(108, 'Петрович', '97832322121313', 'ваывавыаывавыавыа', 0, '2017-04-12 22:14:00', 1),
(109, 'Петрович', '09890098098098', 'цывыфвфывфывыфв', 0, '2017-04-12 22:15:29', 1),
(110, 'Марго', '98908908908908', 'олролрлрвыывывы', 0, '2017-04-12 22:17:07', 1),
(111, 'Геннадий', '789798797897', 'роропропроыровыв', 0, '2017-04-12 22:18:51', 1),
(112, 'олролрлоролрлор', '08098908989808', 'ололролролролрлор', 0, '2017-04-12 22:22:56', 1),
(113, 'Петрович', '9646157823929', 'Доставка в Москву', 0, '2017-04-12 22:24:59', 1),
(114, 'Михаил', '98908908908908', 'Прпвыпврывыв', 0, '2017-04-12 22:35:48', 1),
(115, 'Петрович', '8978978567657657', 'пвапвапвапвапвапвап', 0, '2017-04-13 17:56:28', 1),
(116, 'Валентин', '61583939292892', 'Спасибо ывллыо рпсрмав', 0, '2017-04-14 21:23:38', 1),
(117, 'Петрович', '86786465544453', 'Доставка в Москву', 614985, '2017-04-17 01:01:12', 1),
(118, 'Петрович', '788746456645645645645', 'Доставка в Москву', 0, '2017-04-17 01:01:42', 1),
(119, 'Геннадий', '8678678768678678', 'bcfbcbffcbfcbcfbfbf', 11, '2017-04-17 02:22:49', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
