-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 18 2015 г., 20:14
-- Версия сервера: 5.6.25
-- Версия PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `resource_registry`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_class_view`
--

CREATE TABLE IF NOT EXISTS `attribute_class_view` (
  `view_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `operation_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `before_change` text
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `operation`
--

INSERT INTO `operation` (`operation_id`, `date`, `type_id`, `user_id`, `resource_id`, `before_change`) VALUES
(1, '2015-10-13 13:53:08', 1, NULL, 99, ' looooooooooooooooonnnnnnnnnnnnnngggggggggggg'),
(2, '2015-10-13 13:55:21', 2, NULL, 99, 'ffffffffffffffffffffffffffffffff'),
(4, '2015-10-13 13:56:55', 2, NULL, 99, NULL),
(5, '2015-10-13 13:59:38', 2, NULL, 99, NULL),
(6, '2015-10-13 14:05:34', 1, NULL, 100, NULL),
(14, '2015-10-13 14:15:28', 1, NULL, 101, NULL),
(15, '2015-10-13 14:27:03', 2, NULL, 99, 'sdds'),
(16, '2015-10-13 14:29:03', 2, NULL, 99, NULL),
(17, '2015-10-13 14:31:21', 2, NULL, 99, NULL),
(18, '2015-10-13 16:52:40', 2, NULL, 101, NULL),
(19, '2015-10-14 17:17:33', 1, NULL, 103, NULL),
(20, '2015-10-14 17:18:02', 2, NULL, 103, 'попередня назва ресурсу : Test,  поточна  : TestOne. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(21, '2015-10-14 17:18:52', 3, NULL, 103, 'назва ресурсу : TestOne. клас : land. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(22, '2015-10-14 21:41:58', 2, NULL, 47, 'попередня назва ресурсу : парк Високий замок155,  поточна  : парк Високий замок156. попередній клас : без змін,  поточний : land. попередні координати : [[undefined,undefined],[undefined,undefi,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(23, '2015-10-14 21:43:07', 1, NULL, 102, NULL),
(24, '2015-10-14 21:43:14', 2, NULL, 102, 'попередня назва ресурсу : rrrr,  поточна  : rrrr2. попередній клас : без змін,  поточний : airspace. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.1325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(25, '2015-10-14 21:43:23', 2, NULL, 101, 'попередня назва ресурсу : Старий2,  поточна  : Старий1. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(26, '2015-10-14 21:43:53', 2, NULL, 53, 'попередня назва ресурсу : test2,  поточна  : test3. попередній клас : без змін,  поточний : climate. попередні координати : без змін,  поточний  : [[49.8405,24.0307],[49.8397,24.0408],[49.8378,24.0332],[49.838,24.1261],[49.8397,24.0245],[49.8402,24.0263]]попередній власник  : без змінпоточний : без змін'),
(27, '2015-10-14 21:44:01', 3, NULL, 44, 'назва ресурсу : Скнилівський парк. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Deeeee'),
(28, '2015-10-14 21:44:07', 3, NULL, 45, 'назва ресурсу : Снопківський парк2. клас : land. координати : [49.8210, 24.0000] власник  : Власника немає'),
(29, '2015-10-14 21:44:12', 3, NULL, 46, 'назва ресурсу : Парк імені 700-річчя львова. клас : land. координати : [49.8329, 24.0200] власник  : Власника немає'),
(30, '2015-10-14 21:44:14', 3, NULL, 47, 'назва ресурсу : парк Високий замок156. клас : land. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(31, '2015-10-14 21:44:19', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води,  поточна  : парк Залізні води1. попередній клас : без змін,  поточний : land. попередні координати : [49.8191, 24.0374],  поточний  : [[undefined,undefined],[undefined,undefined]]попередній власник  : без змінпоточний : без змін'),
(32, '2015-10-14 21:52:23', 1, NULL, 103, NULL),
(33, '2015-10-14 22:03:15', 3, NULL, 73, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(34, '2015-10-14 22:09:08', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води1,  поточна  : парк Залізні води2. попередній клас : без змін,  поточний : land. попередні координати : [[undefined,undefined],[undefined,undefi,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(35, '2015-10-15 11:23:48', 1, NULL, 104, NULL),
(36, '2015-10-15 11:23:56', 3, NULL, 104, 'назва ресурсу : ккккк. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(37, '2015-10-15 16:04:40', 3, NULL, 51, 'назва ресурсу : test3. клас : climate. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(38, '2015-10-15 16:04:51', 3, NULL, 52, 'назва ресурсу : test. клас : climate. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.1325]] власник  : Власника немає'),
(39, '2015-10-15 16:05:00', 3, NULL, 70, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(40, '2015-10-15 16:05:06', 3, NULL, 103, 'назва ресурсу : erererere. клас : climate. координати : [[49.843,24.0104],[49.8407,24.0485],[49.8341,24.0411],[49.8327,24.0231],[49.8338,24.0083]] власник  : Власника немає'),
(41, '2015-10-15 16:06:13', 3, NULL, 53, 'назва ресурсу : test3. клас : climate. координати : [[49.8405,24.0307],[49.8397,24.0408],[49.8378,24.0332],[49.838,24.1261],[49.8397,24.0245],[49.8402,24.0263]] власник  : Власника немає'),
(42, '2015-10-15 16:06:17', 3, NULL, 54, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(43, '2015-10-15 16:06:29', 3, NULL, 55, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(44, '2015-10-15 16:06:33', 3, NULL, 57, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(45, '2015-10-15 16:06:35', 3, NULL, 58, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(46, '2015-10-15 16:06:37', 3, NULL, 59, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(47, '2015-10-15 16:06:40', 3, NULL, 60, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(48, '2015-10-15 16:06:42', 3, NULL, 64, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(49, '2015-10-15 16:06:49', 3, NULL, 65, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(50, '2015-10-15 16:07:02', 3, NULL, 67, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(51, '2015-10-15 16:07:18', 3, NULL, 66, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(52, '2015-10-15 16:07:22', 3, NULL, 68, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(53, '2015-10-15 16:07:44', 3, NULL, 71, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(54, '2015-10-15 16:07:49', 3, NULL, 72, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(55, '2015-10-15 16:08:24', 3, NULL, 81, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(56, '2015-10-15 16:08:38', 3, NULL, 83, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(57, '2015-10-15 16:08:43', 3, NULL, 84, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(58, '2015-10-15 16:08:46', 3, NULL, 74, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(59, '2015-10-15 16:08:53', 3, NULL, 82, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(60, '2015-10-15 16:09:03', 3, NULL, 85, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(61, '2015-10-15 16:09:06', 3, NULL, 86, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(62, '2015-10-15 16:09:15', 3, NULL, 76, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(63, '2015-10-15 16:09:20', 3, NULL, 77, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(64, '2015-10-15 16:09:23', 3, NULL, 78, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(65, '2015-10-15 16:09:27', 3, NULL, 80, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(66, '2015-10-15 16:10:07', 3, NULL, 69, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(67, '2015-10-15 16:10:11', 3, NULL, 75, 'назва ресурсу : test. клас : climate. координати : 11111 власник  : Власника немає'),
(68, '2015-10-15 16:48:14', 1, NULL, 105, NULL),
(69, '2015-10-15 16:48:54', 2, NULL, 105, 'попередня назва ресурсу : без змін,  поточна  : Вареник. попередній клас : без змін,  поточний : radio frequency. попередні координати : [[49.844,24.0269],[49.8445,24.0354],[49.,  поточний  : [[49.844,24.0269],[49.8445,24.0354],[49.8381,24.0347]]попередній власник  : без змінпоточний : Rerere'),
(70, '2015-10-15 16:50:08', 3, NULL, 105, 'назва ресурсу : Вареник. клас : radio frequency. координати : [[49.844,24.0269],[49.8445,24.0354],[49.8381,24.0347]] власник  : Rerere'),
(71, '2015-10-15 16:50:54', 3, NULL, 87, 'назва ресурсу : coo. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325],] власник  : Власника немає'),
(72, '2015-10-15 16:51:02', 3, NULL, 88, 'назва ресурсу : coord1. клас : land. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,26.0325],] власник  : Власника немає'),
(73, '2015-10-15 16:51:38', 3, NULL, 89, 'назва ресурсу : coord3. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,23.0325],[49.8415,24.0325]] власник  : Власника немає'),
(74, '2015-10-15 16:52:12', 3, NULL, 90, 'назва ресурсу : coord4. клас : climate. координати : [[49.8425,24.0319],[49.842,24.0337],[49.8417,24.0307],[49.8415,24.0325]] власник  : Власника немає'),
(75, '2015-10-15 16:52:18', 3, NULL, 93, 'назва ресурсу : rrr. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(76, '2015-10-15 16:52:23', 3, NULL, 94, 'назва ресурсу : teest. клас : mineral. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(77, '2015-10-15 17:03:36', 2, NULL, 49, 'попередня назва ресурсу : без змін,  поточна  : Погулянка. попередній клас : без змін,  поточний : land. попередні координати : [49.8236,24.0657],  поточний  : [[undefined,undefined],[undefined,undefined]]попередній власник  : без змінпоточний : без змін'),
(78, '2015-10-15 17:12:58', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води2,  поточна  : парк Залізні води. попередній клас : без змін,  поточний : land. попередні координати : [[49.8415,24.0302],[49.8423,24.0302],[49,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(79, '2015-10-15 17:16:16', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води,  поточна  : парк Залізні води1. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(80, '2015-10-15 17:16:22', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води1,  поточна  : парк Залізні води. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(81, '2015-10-15 17:17:38', 2, NULL, 95, 'попередня назва ресурсу : tert,  поточна  : Горіховий Гай. попередній клас : без змін,  поточний : fauna. попередні координати : [[49.8425,24.0321],[49.8424,24.1328],[49,  поточний  : [[49.8376,23.9592],[49.8407,23.9635],[49.8435,23.9529],[49.8395,23.9345],[49.839,23.9416]]попередній власник  : без змінпоточний : без змін'),
(82, '2015-10-15 17:19:01', 2, NULL, 96, 'попередня назва ресурсу : teeeest,  поточна  : Митрополичі сади. попередній клас : без змін,  поточний : mineral. попередні координати : [[49.8417,24.0302],[49.8428,24.0327],[49,  поточний  : [[49.9039,23.7066],[49.9055,23.7364],[49.8948,23.7289],[49.8945,23.7024]]попередній власник  : без змінпоточний : без змін'),
(83, '2015-10-15 17:20:33', 2, NULL, 97, 'попередня назва ресурсу : Test333,  поточна  : Піскові Озера. попередній клас : без змін,  поточний : mineral. попередні координати : [[49.8427,24.0337],[49.8419,24.033],[49.,  поточний  : [[49.7848,24.1025],[49.7883,24.1402],[49.7697,24.1334],[49.7799,24.1011]]попередній власник  : без змінпоточний : без змін'),
(84, '2015-10-15 17:22:34', 2, NULL, 98, 'попередня назва ресурсу : tetetet,  поточна  : Шевченківський гай. попередній клас : без змін,  поточний : mineral. попередні координати : [[49.8418,24.0338],[49.8411,24.1336],[49,  поточний  : [[49.8247,24.1069],[49.816,24.1235],[49.8309,24.1247],[49.8328,24.0957]]попередній власник  : без змінпоточний : без змін'),
(85, '2015-10-15 17:38:52', 2, NULL, 99, 'попередня назва ресурсу : Стрий Самбір fdgfdg,  поточна  : Стрий Самбір. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(86, '2015-10-15 17:39:56', 3, NULL, 101, 'назва ресурсу : Старий1. клас : land. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(87, '2015-10-15 17:40:23', 2, NULL, 102, 'попередня назва ресурсу : rrrr2,  поточна  : Левандівське озеро. попередній клас : без змін,  поточний : airspace. попередні координати : [[49.8415,24.0302],[49.8423,24.0302],[49,  поточний  : [[49.844,24.0848],[49.8484,24.0848],[49.8484,24.0966],[49.844,24.0966]]попередній власник  : без змінпоточний : без змін'),
(88, '2015-10-15 17:41:23', 2, NULL, 100, 'попередня назва ресурсу : Стрий,  поточна  : Стрий1. попередній клас : без змін,  поточний : aquatic. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(89, '2015-10-15 17:41:41', 2, NULL, 100, 'попередня назва ресурсу : Стрий1,  поточна  : Стрий. попередній клас : без змін,  поточний : aquatic. попередні координати : без змін,  поточний  : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]попередній власник  : без змінпоточний : без змін'),
(90, '2015-10-15 18:15:47', 1, NULL, 106, NULL),
(91, '2015-10-15 18:16:55', 2, NULL, 106, 'попередня назва ресурсу : без змін,  поточна  : Парк Івана Франка. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8441,24.0234],[49.8444,24.0284],[49.8439,24.0313],[49.8425,24.0321],[49.8416,24.0313],[49.8409,24.0278],[49.8417,24.0226]]попередній власник  : без змінпоточний : Шевчук'),
(92, '2015-10-16 16:46:04', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води,  поточна  : парк Залізні води2. попередній клас : без змін,  поточний : land. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(93, '2015-10-16 16:55:25', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води2. попередній клас : land,  поточний : mineral. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(94, '2015-10-16 16:58:59', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води2. попередній клас : mineral,  поточний : airspace. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(95, '2015-10-16 19:59:27', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води2,  поточна  : парк Залізні води3. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(96, '2015-10-16 20:35:02', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води3. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(97, '2015-10-16 20:36:47', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води3. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(98, '2015-10-16 20:45:38', 1, NULL, 107, NULL),
(99, '2015-10-16 22:37:20', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води3. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(100, '2015-10-16 22:38:53', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води3,  поточна  : парк Залізні води. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(101, '2015-10-16 22:45:41', 3, NULL, 49, 'назва ресурсу : Погулянка. клас : земельні ресурси. координати : [[undefined,undefined],[undefined,undefined]] власник  : Власника немає'),
(102, '2015-10-17 12:03:15', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води,  поточна  : парк Залізні води2. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(103, '2015-10-17 12:03:31', 2, NULL, 48, 'попередня назва ресурсу : парк Залізні води2,  поточна  : парк Залізні води. попередній клас : без змін,  поточний : повітряний простір. попередні координати : без змін,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[49.8447,24.019],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(104, '2015-10-17 13:35:39', 2, NULL, 48, 'попередня назва ресурсу : без змін,  поточна  : парк Залізні води. попередній клас : без змін,  поточний : повітряний простір. попередні координати : [[49.8451,24.0163],[49.8455,24.0183],[49,  поточний  : [[49.8451,24.0163],[49.8455,24.0183],[48.8447,25.0189],[49.8444,24.0167]]попередній власник  : без змінпоточний : без змін'),
(105, '2015-10-17 13:36:29', 3, NULL, 107, 'назва ресурсу : rere. клас : надра. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(106, '2015-10-17 13:37:35', 1, NULL, 108, NULL),
(107, '2015-10-17 13:37:42', 3, NULL, 108, 'назва ресурсу : test. клас : клімат. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає'),
(108, '2015-10-17 13:38:23', 1, NULL, 109, NULL),
(109, '2015-10-17 13:38:30', 3, NULL, 109, 'назва ресурсу : test. клас : надра. координати : [[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]] власник  : Власника немає');

-- --------------------------------------------------------

--
-- Структура таблицы `operation_type`
--

CREATE TABLE IF NOT EXISTS `operation_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `operation_type`
--

INSERT INTO `operation_type` (`type_id`, `name`) VALUES
(1, 'Створення ресурсу'),
(2, 'Редагування ресурсу'),
(3, 'Видалення ресурсу');

-- --------------------------------------------------------

--
-- Структура таблицы `parameter`
--

CREATE TABLE IF NOT EXISTS `parameter` (
  `parameter_id` int(11) NOT NULL,
  `value` varchar(45) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `parameter`
--

INSERT INTO `parameter` (`parameter_id`, `value`, `resource_id`, `attribute_id`) VALUES
(47, '1000', 48, 3),
(48, '1000', 48, 4),
(96, '55', 95, 1),
(103, '10', 96, 7),
(110, '40', 97, 1),
(111, '20', 98, 1),
(112, '15', 99, 4),
(113, '10', 100, 2),
(114, '10', 100, 1),
(121, '40', 102, 1),
(127, '100', 48, 1),
(128, '200', 48, 2),
(132, '20', 95, 2),
(133, '20', 95, 3),
(134, '3476', 106, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_data`
--

CREATE TABLE IF NOT EXISTS `personal_data` (
  `personal_data_id` int(11) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) NOT NULL,
  `passport_series` varchar(5) NOT NULL,
  `passport_number` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `personal_data`
--

INSERT INTO `personal_data` (`personal_data_id`, `last_name`, `first_name`, `middle_name`, `passport_series`, `passport_number`, `address`) VALUES
(1, 'Miekh', 'Dmytro', 'Uriyovich', 'NM', '123456', 'Lviv'),
(2, 'Miekh2', 'Dmytro2', 'Uriyovich2', 'NM2', '123451', 'Lvi2'),
(41, 'd', 'd', 'd', 'dd', '11111', 'd'),
(43, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(44, 'Aaa', 'Aaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(45, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(53, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(58, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(60, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(61, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(64, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(65, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(67, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '11111', 'Aaaa'),
(68, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(69, 'Bbbbb', 'Bbbbb', 'Bbbb', 'AA', '111112', 'Bbbbb'),
(70, 'name', 'name', 'name', 'AA', '77777', 'lviv'),
(71, 'Baaa', 'Aaaa', 'Aaaa', 'CC', '222222', 'Aaaa'),
(72, 'Bfff', 'Bfff', 'Bfff', 'DD', '333333', 'Bfff'),
(73, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(74, 'Aaaa', 'Aaaa', 'Aaaa', 'AA', '111111', 'Aaaa'),
(75, 'Aaa123', 'Aaa123', 'Aaa123', 'AA', '11111', 'Aaa123'),
(78, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(79, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(80, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(81, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(82, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(83, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(84, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(85, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(86, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(87, 'Ffff', 'Ffff', 'Fffff', 'DD', '434343', 'Fffg'),
(88, 'Sdff', 'Sfff', 'Sdd', 'GG', '323223', 'SDdd'),
(90, 'Yyyy', 'Rrrr', 'Uuuu', 'TT', '66666', 'Cbbbb'),
(91, 'Test', 'Tet', 'Test', 'SD', '123456', 'Test'),
(92, 'VVV', 'VVV', 'VVV', 'AA', '121212', 'vvvv'),
(94, 'test36', 'test36', 'test36', 'TE', '123456', 'test36'),
(97, 'test37', 'test37', 'test37', 'TE', '56565', 'test37'),
(98, 'test37', 'test37', 'test37', 'TE', '56565', 'test37'),
(101, 'test37', 'test37', 'test37', 'TE', '56565', 'test37'),
(102, 'jhgjhgj', 'jhgjghjgh', 'ghfghf', 'kh', 'khkuh', 'kuhkuh'),
(103, 'jhgjhgj', 'jhgjghjgh', 'ghfghf', 'kh', 'khkuh', 'kuhkuh'),
(104, 'jhgjhgj', 'jhgjghjgh', 'ghfghf', 'kh', 'khkuh', 'kuhkuh'),
(105, 'jhgjhgj', 'jhgjghjgh', 'ghfghf', 'kh', 'khkuh', 'kuhkuh'),
(106, 'jhgjhgj', 'jhgjghjgh', 'ghfghf', 'kh', 'khkuh', 'kuhkuh'),
(107, 'Петров', 'Василий', 'Петрович', 'КН', '374826374', 'Виговського 67'),
(108, 'Петров', 'Василий', 'Петрович', 'КН', '374826374', 'Виговського 67'),
(109, 'gfbgf', 'grgrk', 'knklbrt', 'tg', 'bgbg', 'bgbg'),
(111, 'Шевчук', 'Віталій', 'Сергійович', 'КС', '123456', 'Адреса'),
(112, 'Петров', 'Иван', 'Иванович', 'КС', '34536574', 'виговського 7'),
(113, 'Петренко', 'Петро', 'Петрович', 'EE', '123456', '29000, м. Хмельницький, вул. Героїв Майдану, 17, кв. 17');

-- --------------------------------------------------------

--
-- Структура таблицы `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `resource_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `class_id` int(11) NOT NULL,
  `coordinates` text NOT NULL,
  `owner_data_id` int(11) DEFAULT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resource`
--

INSERT INTO `resource` (`resource_id`, `name`, `class_id`, `coordinates`, `owner_data_id`, `reason`) VALUES
(48, 'парк Залізні води', 5, '[[49.8451,24.0163],[49.8455,24.0183],[48.8447,25.0189],[49.8444,24.0167]]', NULL, 'паспорт громадянина України КК 123456, виданий на ім’я Петренко Петро Петрович Хмельницьким МВ УМВС України в Хмельницький області 01 січня 1997 року;\n\n титул власності на природні ресурси України від 02 квітня 2015 року;\n\n доручення № 210715/1 від 21 липня 2015 року'),
(95, 'Горіховий Гай', 8, '[[49.8376,23.9592],[49.8407,23.9635],[49.8435,23.9529],[49.8395,23.9345],[49.839,23.9416]]', NULL, ''),
(96, 'Митрополичі сади', 3, '[[49.9039,23.7066],[49.9055,23.7364],[49.8948,23.7289],[49.8945,23.7024]]', NULL, ''),
(97, 'Піскові Озера', 3, '[[49.7848,24.1025],[49.7883,24.1402],[49.7697,24.1334],[49.7799,24.1011]]', NULL, ''),
(98, 'Шевченківський гай', 3, '[[49.8247,24.1069],[49.816,24.1235],[49.8309,24.1247],[49.8328,24.0957]]', NULL, ''),
(99, 'Стрий Самбір', 1, '[[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]', NULL, ''),
(100, 'Стрий', 2, '[[49.8415,24.0302],[49.8423,24.0302],[49.8423,24.0325],[49.8415,24.0325]]', NULL, ''),
(102, 'Левандівське озеро', 5, '[[49.844,24.0848],[49.8484,24.0848],[49.8484,24.0966],[49.844,24.0966]]', NULL, ''),
(106, 'Парк Івана Франка', 1, '[[49.8441,24.0234],[49.8444,24.0284],[49.8439,24.0313],[49.8425,24.0321],[49.8416,24.0313],[49.8409,24.0278],[49.8417,24.0226]]', 111, '');

--
-- Триггеры `resource`
--
DELIMITER $$
CREATE TRIGGER `resource_log_DELETE` BEFORE DELETE ON `resource`
 FOR EACH ROW BEGIN

DECLARE res_type_name VARCHAR(40) DEFAULT NULL;
DECLARE res_owner_last_name VARCHAR(40) DEFAULT 'Власника немає';

SELECT name INTO res_type_name 
	FROM resource_class
    WHERE resource_class.class_id = OLD.class_id;
    
SELECT last_name INTO res_owner_last_name
	FROM personal_data 
    WHERE personal_data.personal_data_id = OLD.owner_data_id;
  
INSERT INTO `operation`(`date`, `type_id`, `resource_id`, `user_id`,  `before_change`)
VALUES (now(), 3, OLD.resource_id, NULL,

        CONCAT('назва ресурсу : ',OLD.name,               
              '. клас : ', res_type_name,
                '. координати : ', OLD.coordinates,
               ' власник  : ', res_owner_last_name             
             )         
       );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `resource_log_INSERT` AFTER INSERT ON `resource`
 FOR EACH ROW BEGIN

INSERT INTO `operation`(`date`, `type_id`, `resource_id`, `user_id`)
VALUES (now(), 1, NEW.resource_id,  NULL);

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `resource_log_UPDATE` BEFORE UPDATE ON `resource`
 FOR EACH ROW BEGIN

DECLARE res_name VARCHAR(40) DEFAULT 'без змін';
DECLARE res_type_name VARCHAR(40) DEFAULT 'без змін';
DECLARE res_coord VARCHAR(40) DEFAULT 'без змін';
DECLARE res_type_newname VARCHAR(40) DEFAULT 'без змін';
DECLARE res_owner_last_name VARCHAR(40) DEFAULT 'без змін';
DECLARE res_owner_last_name_new VARCHAR(40) DEFAULT 'без змін';

IF OLD.name != NEW.name THEN
	SET res_name = OLD.name;
END IF;

SELECT name INTO res_type_newname 
	FROM resource_class 
    WHERE resource_class.class_id = NEW.class_id;
    
IF OLD.class_id != NEW.class_id THEN   
    SELECT name INTO res_type_name 
	FROM resource_class WHERE resource_class.class_id = OLD.class_id;
END IF;

SELECT last_name INTO res_owner_last_name_new
	FROM personal_data 
    WHERE personal_data.personal_data_id = NEW.owner_data_id;

IF OLD.owner_data_id != NEW.owner_data_id THEN   
    SELECT last_name INTO res_owner_last_name
	FROM personal_data 
    WHERE personal_data.personal_data_id = OLD.owner_data_id;
END IF;

IF OLD.coordinates != NEW.coordinates THEN   
    SET res_coord = OLD.coordinates;
END IF;
  
INSERT INTO `operation`(`date`, `type_id`, `resource_id`, `user_id`,  `before_change`)
VALUES (now(), 2, OLD.resource_id, NULL,        
        CONCAT('попередня назва ресурсу : ',res_name,
               ',  поточна  : ', NEW.name,
              '. попередній клас : ', res_type_name,
                ',  поточний : ', res_type_newname,
              '. попередні координати : ', res_coord,
               ',  поточний  : ', NEW.coordinates,
               'попередній власник  : ', res_owner_last_name,
               'поточний : ',res_owner_last_name_new
             )
       );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `resource_attribute`
--

CREATE TABLE IF NOT EXISTS `resource_attribute` (
  `attribute_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resource_attribute`
--

INSERT INTO `resource_attribute` (`attribute_id`, `name`) VALUES
(1, 'length'),
(2, 'width'),
(3, 'height'),
(4, 'square'),
(5, 'volume'),
(6, 'weight'),
(7, 'perimeter');

-- --------------------------------------------------------

--
-- Структура таблицы `resource_class`
--

CREATE TABLE IF NOT EXISTS `resource_class` (
  `class_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `resource_class`
--

INSERT INTO `resource_class` (`class_id`, `name`) VALUES
(1, 'земельні ресурси'),
(2, 'водні ресурси'),
(3, 'надра'),
(4, 'клімат'),
(5, 'повітряний простір'),
(6, 'атмосферні ресурси'),
(7, 'радіочастотний ресурс'),
(8, 'фауна '),
(9, 'флора '),
(10, 'альтернативні джерела енергії');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'user'),
(2, 'registrar'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_data_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `user_data_id`, `role_id`) VALUES
(1, 'demo', 'mPLobHQJkMV7pdw6JM5azks9n-Fkx9EY', '$2y$13$BlX7rTSKcUaluomULVXgRec/1H.y2yJG.K7jSXZArCq4OkzhJ9S/y', NULL, 'demo@mail.net', 1, 3),
(3, 'mof', 'pdw6JM5azks9n-Fkx9EYmPLobHQJkMV7', '$2y$13$XSNOyLiil07pBhh5RnNsxuHsvr21cO3HoqGtMs9rPe4xGr2L.RdUu', 'F7NFSAPun1hooVGJGpUGgaUpPcJ4iEEu_1444824168', 'zhenyast@yandex.ru', 2, 2),
(7, 'mof2', 'sBZlLkpEbikELmURWCopgN-lYiqU7UYu', '$2y$13$yLUJbUf98IMuPBuGO2lkwu87KYF0lJM.q0s8cA2wvNxOyPCT1p/92', NULL, 'zhenyast@yandex.ru', 1, 3),
(8, 'mof23', 'LTrS-nd6GOp4NAuWsqLPMGRmTXyhnRoR', '$2y$13$Ttwe62ORjJUriGFQoT9jkeFwzaQjXlAMEmPtKiy7JYbbjEmCf09V2', NULL, 'test@gmail.com', 1, 1),
(9, 'mof234', 'v0HLQsttxqamwDDszxTmGrio0KjVFASu', '$2y$13$sVfWSaKYBjCXRG.ipdGnBOG7IWZ5epKuRxcj43I.5TLlWaxU1Tfiq', NULL, 'test@gmail.com', 1, 1),
(10, 'mof4', 'nzns3KZbmVNEERTeqbyWSmiA8iIsZCuy', '$2y$13$x4P0BcqVrFjVSE8tVfbaZuFEHpwX9Llt6MEDWtpT3H35m/35I7xhq', NULL, 'test@gmail.com', 1, 1),
(11, 'mof5', 'D3Hwd61ihElNoSZqYdbm6tY7MiR9TKMN', '$2y$13$apiaxjG5M3k1MQ/IdxYM1ubbyaOglIdNoOymvuzkITKShbqhP.EW6', NULL, 'test@gmail.com', 1, 1),
(12, 'mof6', 'FEdVtOX6YBUSBDkGwBmlkRs7MvKS1rNS', '$2y$13$UW1VZ9hHTX5Vhnzw.uoQ7OUMu/GInWxGUN8CKFqE11hHkyE0VQuxe', NULL, 'test@gmail.com', 1, 1),
(14, 'mof9', 'CnJoAGaGgNUzWFs1douSRUhI-7nCQofg', '$2y$13$NGtRJrUMsGHIrqrKdWq2kercGlmyyjwOgpm8ZxYfSey6Y0Gk0Dtfu', NULL, 'test@gmail.com', 1, 1),
(15, 'mof10', 'iWVndxR_sQaVRTNgvgKNsgLlJB1pNzDk', '$2y$13$GyFd0cLsWEqsoY31QSynBexJhzntmrB6yGu.Tk2kTsSsq09uybWwC', NULL, 'test@gmail.com', 2, 1),
(16, 'mof11', 'J9pL0T5YDbPSK7mn0O0FRYndbFFxAgEX', '$2y$13$O4Hid6PLW2BGi.Y4IlX2c.XBVWk.SPul8pWrD6XgYxxQgRXtRHdpC', NULL, 'test@gmail.com', 2, 1),
(17, 'mof12', '2b1-_u4Gb-BcDIlQTwwxOFSXypfeLuMP', '$2y$13$ffgOz/IhD8Jb2r0vX/Z44uA9u0QP2aRDlxdxokeVdK18z76yPo7RO', NULL, 'personalDataModel@ya.ru', 2, 1),
(18, 'mof17', 'ecuUkIjIbI-a_JL3dk5clnLTBu6NMPxm', '$2y$13$Wqc8FH7coO.n/iyc/l4nHecWTJlQQujSFcnBeX1n7MhwmcsvPZ00m', NULL, 'test@mail.ru', 2, 1),
(20, 'mof18', 'vLNM1wxWKgQN27Ggot6mt2i08QxEI1dk', '$2y$13$LcGAfRrqIZDUwtdECiOKreh5XUAL106odA5Zj89sd034r3WJxdvBe', NULL, 'vasya@ya.ru', 2, 1),
(21, 'test36', 'ucDnNXLbL4cqo6EEezyEeUoC37NuU47n', '$2y$13$g00nLVE8.hcc1yAXCJeO.uzaTouLi4QxGh0YSDP8WMFnxKovaMEWO', NULL, 'test36@mail.ru', 94, 1),
(22, 'test37', '0hRs_b4To10q9QejQ3wS0ATzNMUKmSHy', '$2y$13$27YSO6O3fFH62.S2hIPWHuwuYzVyMfLx1iVex.oB5oJKvrd2I.Gfa', NULL, 'test37@mail.ru', 97, 1),
(23, 'test38', 'eJWSGRi2nyz9wPviMJw0lH1ixy5IrtMi', '$2y$13$54dopM1dbO6totckC8dtF.akY7Wr6XBWBx47KFU/rUm2cjt6HvmSO', NULL, 'vitashev@bk.ru', 98, 1),
(24, 'test385', 'ODBf-XUPupYGk4iss935XhIECg-nbwok', '$2y$13$xaKAJKmtQveX.TAIYmBun.PY60neU.6v1cfKz2Ujq59B/Bne3ZE/G', NULL, 'rerse@ya.ri', 101, 1),
(25, 'user4', 'VYNlikVL5ZSiCPZp3XL6NZ_nr4cl9Pr3', '$2y$13$ZXQ6T/TwSILVwPqTvPU3.uour0NolMMiVxE0jtuXAknR9hW7jieue', NULL, 'registerresource@gmail.com', 107, 2),
(26, 'user5', 'AE5fW3PCbNY3D5jGAtAiAGXd0ezMdy-q', '$2y$13$KuiNKwLYUfFdmvzfDhrBiuhiPADovcohyE72peEoaven2EsohU2wK', NULL, 'registerresource@gmail.com', 108, 2),
(27, 'grgrgrt', 'Fxl0xfdMGVrzpPj8c1_uNtAwAAf5t90T', '$2y$13$pddF4JoxuVGVm.gVWl.KJ.HpBYzvE4s4Fbwv9CUJUqHUzMgu3gF8.', NULL, 'gtrgrt@ya.ru', 109, 2),
(28, 'username1', 'kq1OSpQweIhZ3kfF5f6fAM2_kM9H5h3E', '$2y$13$EDFwkXrlujw3YdzlOG708up.2piJ5aN8sduhaTKYF0tpeeFiQ2Iqu', NULL, 'registerresource@gmail.com', 112, 2),
(29, 'registrar', 'nh1R7g-MHLNcBOFuP_Jn8N0q_9E3K50z', '$2y$13$/qKMqvRxreJoaI2Zpqee2.TjYGI57vsSbkzGOAZSYUp.DyoerZrEO', NULL, 'test69@mail.ru', 113, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user2`
--

CREATE TABLE IF NOT EXISTS `user2` (
  `user_id` int(11) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_data_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user3`
--

CREATE TABLE IF NOT EXISTS `user3` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `user_data_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user3`
--

INSERT INTO `user3` (`user_id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `user_data_id`, `role_id`) VALUES
(1, 'demo', 'mPLobHQJkMV7pdw6JM5azks9n-Fkx9EY', '$2y$13$U7aE6gaP1JKEkcs9s2/noe7s67hai99quOU68qtuTWw4lrnxBm3EW', NULL, 'vitashev@bk.ru', 1, 3),
(3, 'mof', 'pdw6JM5azks9n-Fkx9EYmPLobHQJkMV7', '$2y$13$1ITX13jNtmsBik3knIxHBuFTdi91mbslnlcjOwrCkgHTB0GUrb1J6', NULL, 'zhenyast@yandex.ru', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user_role_view`
--

CREATE TABLE IF NOT EXISTS `user_role_view` (
  `view_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_class_view`
--
ALTER TABLE `attribute_class_view`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `fk_attribute_class_view_resource_attribute1_idx` (`attribute_id`),
  ADD KEY `fk_attribute_class_view_resource_class1_idx` (`class_id`);

--
-- Индексы таблицы `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`operation_id`),
  ADD KEY `fk_transactions_transaction_type1_idx` (`type_id`),
  ADD KEY `fk_transactions_users1_idx` (`user_id`),
  ADD KEY `fk_operation_resource1_idx` (`resource_id`);

--
-- Индексы таблицы `operation_type`
--
ALTER TABLE `operation_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Индексы таблицы `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`parameter_id`),
  ADD KEY `fk_stats_resources1_idx` (`resource_id`),
  ADD KEY `fk_stats_resource_attributes1_idx` (`attribute_id`);

--
-- Индексы таблицы `personal_data`
--
ALTER TABLE `personal_data`
  ADD PRIMARY KEY (`personal_data_id`);

--
-- Индексы таблицы `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`resource_id`),
  ADD KEY `fk_resource_resource_class1_idx` (`class_id`),
  ADD KEY `fk_resource_personal_data1_idx` (`owner_data_id`);

--
-- Индексы таблицы `resource_attribute`
--
ALTER TABLE `resource_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`user_data_id`),
  ADD KEY `role_id_2` (`role_id`);

--
-- Индексы таблицы `user2`
--
ALTER TABLE `user2`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_user_data1_idx` (`user_data_id`);

--
-- Индексы таблицы `user3`
--
ALTER TABLE `user3`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`user_data_id`),
  ADD KEY `role_id_2` (`role_id`);

--
-- Индексы таблицы `user_role_view`
--
ALTER TABLE `user_role_view`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `fk_user_role_view_role1_idx` (`role_id`),
  ADD KEY `fk_user_role_view_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attribute_class_view`
--
ALTER TABLE `attribute_class_view`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `operation`
--
ALTER TABLE `operation`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT для таблицы `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `parameter`
--
ALTER TABLE `parameter`
  MODIFY `parameter_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT для таблицы `personal_data`
--
ALTER TABLE `personal_data`
  MODIFY `personal_data_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=114;
--
-- AUTO_INCREMENT для таблицы `resource`
--
ALTER TABLE `resource`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT для таблицы `resource_attribute`
--
ALTER TABLE `resource_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `user2`
--
ALTER TABLE `user2`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user3`
--
ALTER TABLE `user3`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user_role_view`
--
ALTER TABLE `user_role_view`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `attribute_class_view`
--
ALTER TABLE `attribute_class_view`
  ADD CONSTRAINT `fk_attribute_class_view_resource_attribute1` FOREIGN KEY (`attribute_id`) REFERENCES `resource_attribute` (`attribute_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attribute_class_view_resource_class1` FOREIGN KEY (`class_id`) REFERENCES `resource_class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `fk_transactions_transaction_type1` FOREIGN KEY (`type_id`) REFERENCES `operation_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `parameter`
--
ALTER TABLE `parameter`
  ADD CONSTRAINT `fk_stats_resource_attributes1` FOREIGN KEY (`attribute_id`) REFERENCES `resource_attribute` (`attribute_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stats_resources1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `fk_resource_personal_data1` FOREIGN KEY (`owner_data_id`) REFERENCES `personal_data` (`personal_data_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_resource_resource_class1` FOREIGN KEY (`class_id`) REFERENCES `resource_class` (`class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_data_id`) REFERENCES `personal_data` (`personal_data_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user3`
--
ALTER TABLE `user3`
  ADD CONSTRAINT `user3_ibfk_1` FOREIGN KEY (`user_data_id`) REFERENCES `personal_data` (`personal_data_id`);

--
-- Ограничения внешнего ключа таблицы `user_role_view`
--
ALTER TABLE `user_role_view`
  ADD CONSTRAINT `fk_user_role_view_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_role_view_user1` FOREIGN KEY (`user_id`) REFERENCES `user2` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
