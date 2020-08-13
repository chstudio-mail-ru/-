-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2020 at 12:37 AM
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
  `name` int(11) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `photo` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_ref_color`
--

CREATE TABLE `car_ref_color` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'Toyota', 1597349110);

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
(5, 2, 'RAV4', 1597349162);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_ref_color`
--
ALTER TABLE `car_ref_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
