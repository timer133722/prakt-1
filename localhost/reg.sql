-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2015 at 12:24 PM
-- Server version: 5.1.40
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `reg`
--

-- --------------------------------------------------------

--
-- Table structure for table `bez_content`
--

CREATE TABLE IF NOT EXISTS `bez_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bez_content`
--

INSERT INTO `bez_content` (`id`, `content`, `role`) VALUES
(1, 'Добрый день!Сегодня прогноз погоды:будет солнечно

Будет довольно прохладно

Новости на неделе:в городе произошел небольшой пожар в районе ГринПарк

Был построен новый жилой комплекс "Дубовый"

Сегодня сообщили точную дату выхода всеми ожидаемой игры Spore 2

Следующее в программе:60 секунд вместе с Томом

Это были новости недели -всего доброго!\r\n', '1,2'),
(2, 'Добрый день!Сегодня прогноз погоды:будет пасмурно

Будет довольно холодно

Новости на неделе:сегодня был пойман преступник Симон Черманко который больше 7 лет скрывался от полиции

Началось долгожданное открытие торгового центра "Радуга"

Сегодня торжественная дата - День Города!

Следующее в программе:60 секунд вместе с Томом

Это были новости недели -всего доброго!\r\n', '1,3'),
(3, 'Добрый день!Сегодня прогноз погоды:будет дождливо

Будет довольно холодно

Новости на неделе:сегодня была авария на Шоссе 43 по данным 4 пострадавших

Началось долгожданное открытие торгового центра "Радуга"

Новый фильм "Рвущий" рвёт все кинотеатры города и сборы фильма превысили 120 миллионов долларов

Следующее в программе:60 секунд вместе с Томом

Это были новости недели -всего доброго!\r\n', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bez_reg`
--

CREATE TABLE IF NOT EXISTS `bez_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(200) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `active_hex` varchar(32) NOT NULL,
  `status` int(1) NOT NULL,
  `role` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bez_reg`
--

INSERT INTO `bez_reg` (`id`, `login`, `pass`, `salt`, `active_hex`, `status`, `role`) VALUES
(1, 'admin@mail.ru', 'c77fc3fe8ecc690e77471292b5230df7', '2c7aeb79', '1cb2061e07decece820a6ec617a20309', 1, 1),
(2, 'moderator@mail.ru', '895d793af1a4b2bdee2c0316e20cc6ea', '56b3c0d8', 'dd0d89e0770bbfb39ab42e28b403fe24', 1, 2),
(3, 'user@mail.ru', '89345bf81dfff60cb6766ab875586085', 'eee3d058', '0e482e1de1739f39f6a0da52d982d53c', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bez_role`
--

CREATE TABLE IF NOT EXISTS `bez_role` (
  `id_role` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bez_role`
--

INSERT INTO `bez_role` (`id_role`, `name`) VALUES
(1, 'Администратор'),
(2, 'Модератор'),
(3, 'Пользователь');
