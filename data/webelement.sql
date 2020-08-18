-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2020 at 12:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webelement`
--

-- --------------------------------------------------------

--
-- Table structure for table `bodytype`
--

CREATE TABLE `bodytype` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bodytype`
--

INSERT INTO `bodytype` (`id`, `name`, `date_add`) VALUES
(2, 'Хэтчбэк', 1597609891),
(3, 'Седан', 1597737624),
(4, 'Универсал', 1597741036);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `bodytype_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `mark_id`, `model_id`, `bodytype_id`, `price`, `description`, `date_add`) VALUES
(14, 2, 5, 2, 3000000, 'Toyota RAV4 стал «знаковой моделью» не только для японского производителя «Toyota Motor Corporation», но и для мирового автопрома в целом – этот «автомобиль для активного отдыха» (именно такой смысл заложен в аббревиатуре «RAV4») положил начало классу «компактных кроссоверов»… С самого своего появления и по сей день, эта машина твёрдо удерживает звание «одного из самых продаваемых паркетников в мире», и это неспроста… Свою «славную серийную историю» автомобиль начал в 1994 году, произведя «настоящий фурор» – т.к. подобной техники никто доселе не предлагал. Правда, впервые с «прародителем» паркетника общественность познакомилась ещё в 1989-м, когда на Токийской выставке дебютировал концепт «RAV Four»… Далее, с каждой «сменой поколений» автомобиль становился «крупнее, современнее и пижонистей», впрочем он и сейчас во многом «диктует тенденции» в своем классе.', 1597739328),
(15, 7, 10, 2, 3500000, 'Новый BMW X5 — лидер модельного ряда, который расставляет все по местам. Этот высокий, элегантный и сильный автомобиль невозможно не заметить. Мощная цельная двойная решетка радиатора словно намекает на то, что произойдет при запуске двигателя. Великолепный дизайн фар в стиле X не отставляет сомнений в том, кто же лидер. Благодаря инновационным технологиям для максимальной динамики и большей безопасности на любых покрытиях новый BMW X5 знает куда двигаться. И как оказаться там первым.', 1597739496),
(16, 2, 3, 3, 2500000, 'Это поколение Camry выпускалось в кузове седан с 1991 по 1996 год под маркой Toyota Scepter. С 1992 года также выпускалось в кузове универсал. С 1993 года начало производиться на экспорт под маркой Toyota Camry и получалась ситуация, когда в одно и то же время существовало две разных Camry. Camry для японского рынка и более крупная для экспорта.\r\n\r\nЭто поколение выпускалось на нескольких заводах, которые располагались в Германии, США и в самой Японии. Было выпущено около 100 000 автомобилей. Имела дизайн похожий на оригинальную Camry, но в отличие от неё, имела больший размер и оснащалась более мощными двигателями, объёмом 2,2 и 3,0 литра.\r\n\r\nБольшая часть продаж данной модели пришлись на северо-американский рынок более 60-63 % остальные 40 — 37/35 % пришлись на рынок Японии, Европы, СНГ, и т. д. При этом аналогичный более крупный аналог Vista - Toyota Windom, поставлялся на экспорт как Lexus ES и в результате не перенял имя исходной модели, как это сделал Scepter.', 1597740721),
(18, 2, 4, 4, 2500000, 'Первый автомобиль Toyota Corolla увидел свет в 1966 году. Он имел задний привод, продольное расположение двигателя и имел отличительную черту — круглые фары. Такая компоновка сохранялась до 1984 года, когда была выпущена первая Corolla с передним приводом. С 1966 по 1997 гг. Corolla выпускалась в пяти кузовных решениях — седан, трёхдверный хетчбэк, пятидверный хетчбек, лифтбэк и универсал. Выпущенное в 1984 году пятое поколение Corolla сохранило задний привод для трёхдверного хэтчбека «купе GT» и для универсала, остальные же модификации обрели передние ведущие колеса. В 1987 году было представлено шестое поколение Toyota Corolla с кузовом E90. Несмотря на морально устаревший дизайн, высокое качество сборки, хорошее антикоррозийное покрытие сделало это поколение Corolla достаточно популярным. Восьмое поколение Toyota Corolla было представлено в 1997 году. Кузов EE110 имел варианты: седан, лифтбэки (трех- и пяти- дверные), универсалы.', 1597741036),
(19, 1, 12, 2, 4500000, 'Lexus LX — полноразмерный внедорожник компании Lexus выпускающийся с 1996 года. Настоящее поколение построено на базе автомобиля Toyota Land Cruiser 200. Основные рынки сбыта — Северная Америка, Ближний Восток, Китай, Индонезия, Филиппины, Россия, Австралия и Новая Зеландия.\r\n\r\nДанное поколение внедорожника премиум-класса Lexus LX было представлено на автосалоне в Нью-Йорке еще в 2007 году. Но в Японии продажи Lexus LX, причём только флагманской модели LX570, начались в августе 2015 года, когда автомобиль прошел основательное омоложение. Будучи еще не самой дорогой моделью в ряду Lexus (есть еще Lexus LS гибрид), LX570 занимает только пятую строчку в рейтинге популярности на внутреннем японском рынке[источник не указан 186 дней].', 1597741301),
(20, 1, 1, 3, 4000000, 'Lexus ES / Toyota Windom — автомобиль бизнес-класса с кузовом типа седан, выпускаемый японским автопроизводителем Lexus с 1989 года. Автомобиль собирается на заводе в Японии, расположенном на острове Кюсю. Автомобиль имеет общую платформу с моделью Toyota Avalon.\r\n\r\nАббревиатура \"ES\" происходит от словосочетания \"Executive sedan\" (представительский седан).\r\n\r\nПервоначально сборка данного автомобиля была рассчитана исключительно на авторынок Соединённых Штатов Америки. Впоследствии ввиду большого коммерческого успеха автомобиль стал продаваться в европейских и других странах мира. В Россию седан Lexus ES поставляется из Японии начиная с 5 ноября 2010 года. Модель Lexus ES на российском рынке представлена японским производителем в переднеприводном исполнении с мощными атмосферными двигателями объемом 2.0, 2.5 и 3.5 тыс. куб. см.', 1597741525),
(21, 1, 2, 2, 5000000, 'Премьера нового внедорожника Lexus GX состоялась в 2002 году на автошоу в Детройте.\r\n\r\nВ конце 2004 года, а точнее с ноября начали ставить двигатели с системой VVTI, была увеличена мощность с 238 л.с до 272 л.с, крутящий момент с 434 Н*м до 447 Н*м, но с 2006 года по некоторым причинам были снижены мощность с 272 л.с до 263 л.с. и крутящий момент с 447 Н*м до 437 Н*м вплоть до окончания производства в 2009 году. Благодаря новому двигателю расход топлива понизился на 2-3 литра.\r\n\r\nВ 2006-2007 году GX 470 получил обновление: модернизация электроники кабины, включая навигационную систему нового поколения, дополнительный входной разъем для таких устройств, как iPod, воспроизведение DVD-видео и более широкий дополнительный видео-экран сзади.', 1597741848);

-- --------------------------------------------------------

--
-- Table structure for table `car_ref_color`
--

CREATE TABLE `car_ref_color` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_ref_color`
--

INSERT INTO `car_ref_color` (`id`, `car_id`, `color_id`) VALUES
(32, 14, 1),
(33, 14, 10),
(34, 15, 1),
(35, 15, 10),
(36, 16, 2),
(37, 17, 2),
(38, 18, 2),
(39, 18, 9),
(40, 18, 10),
(41, 19, 2),
(42, 19, 10),
(43, 20, 4),
(44, 20, 6),
(45, 20, 10),
(46, 21, 1),
(47, 21, 9),
(48, 21, 10);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `date_add`) VALUES
(1, 'Красный', 1597342535),
(2, 'Белый', 1597342535),
(3, 'Зеленый', 1597342535),
(4, 'Черный', 1597342535),
(5, 'Желтый', 1597342535),
(6, 'Синий', 1597342535),
(7, 'Малиновый', 1597342535),
(8, 'Голубой', 1597342535),
(9, 'Бежевый', 1597342535),
(10, 'Серебристый', 1597342535);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`id`, `name`, `date_add`) VALUES
(1, 'Lexus', 1597349110),
(2, 'Toyota', 1597349110),
(7, 'BMW', 1597609891);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `mark_id`, `name`, `date_add`) VALUES
(1, 1, 'ES', 1597349110),
(2, 1, 'GX', 1597349110),
(3, 2, 'Camry', 1597349162),
(4, 2, 'Corolla', 1597349162),
(5, 2, 'RAV4', 1597349162),
(10, 7, 'X5', 1597609891),
(12, 1, 'LX', 1597741301);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bodytype`
--
ALTER TABLE `bodytype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mark_id` (`mark_id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `price` (`price`),
  ADD KEY `bodytype_id` (`bodytype_id`);

--
-- Indexes for table `car_ref_color`
--
ALTER TABLE `car_ref_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_id` (`car_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mark_id` (`mark_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bodytype`
--
ALTER TABLE `bodytype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `car_ref_color`
--
ALTER TABLE `car_ref_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
