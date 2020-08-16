-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Авг 16 2020 г., 22:40
-- Версия сервера: 10.1.32-MariaDB
-- Версия PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webelement`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bodytype`
--

CREATE TABLE `bodytype` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bodytype`
--

INSERT INTO `bodytype` (`id`, `name`, `date_add`) VALUES
(2, 'Хэтчбэк', 1597609891);

-- --------------------------------------------------------

--
-- Структура таблицы `car`
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
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`id`, `mark_id`, `model_id`, `bodytype_id`, `price`, `description`, `date_add`) VALUES
(11, 7, 10, 2, 3000000, 'В хорошем состоянии', 1597609891);

-- --------------------------------------------------------

--
-- Структура таблицы `car_ref_color`
--

CREATE TABLE `car_ref_color` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `car_ref_color`
--

INSERT INTO `car_ref_color` (`id`, `car_id`, `color_id`) VALUES
(27, 11, 4),
(28, 11, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `color`
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
-- Структура таблицы `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mark`
--

INSERT INTO `mark` (`id`, `name`, `date_add`) VALUES
(1, 'Lexus', 1597349110),
(2, 'Toyota', 1597349110),
(7, 'BMW', 1597609891);

-- --------------------------------------------------------

--
-- Структура таблицы `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `mark_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `model`
--

INSERT INTO `model` (`id`, `mark_id`, `name`, `date_add`) VALUES
(1, 1, 'ES', 1597349110),
(2, 1, 'GX', 1597349110),
(3, 2, 'Camry', 1597349162),
(4, 2, 'Corolla', 1597349162),
(5, 2, 'RAV4', 1597349162),
(10, 7, 'X5', 1597609891);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bodytype`
--
ALTER TABLE `bodytype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mark_id` (`mark_id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `price` (`price`),
  ADD KEY `bodytype_id` (`bodytype_id`);

--
-- Индексы таблицы `car_ref_color`
--
ALTER TABLE `car_ref_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_id` (`car_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Индексы таблицы `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mark_id` (`mark_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bodytype`
--
ALTER TABLE `bodytype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `car_ref_color`
--
ALTER TABLE `car_ref_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
