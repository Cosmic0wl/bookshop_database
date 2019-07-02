-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2019 at 09:14 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`) VALUES
(1, 'Dracula'),
(2, 'Carmilla'),
(3, 'Coraline');

-- --------------------------------------------------------

--
-- Table structure for table `books_to_store`
--

CREATE TABLE `books_to_store` (
  `fk_book` int(11) NOT NULL,
  `fk_store` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books_to_store`
--

INSERT INTO `books_to_store` (`fk_book`, `fk_store`, `quantity`) VALUES
(1, 1, 3),
(1, 2, 10),
(1, 3, 2),
(2, 2, 3),
(2, 3, 10),
(3, 1, 2),
(3, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(35) DEFAULT NULL,
  `fk_store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `fk_store_id`) VALUES
(1, 'Valentina', 1),
(2, 'Daniel', 1),
(3, 'Goran', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_to_books`
--

CREATE TABLE `customer_to_books` (
  `fk_customer` int(11) NOT NULL,
  `fk_book` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_to_books`
--

INSERT INTO `customer_to_books` (`fk_customer`, `fk_book`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `id` int(11) NOT NULL,
  `name` varchar(35) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `address`) VALUES
(1, 'Thalia', 'Mariahilferstrasse 47'),
(2, 'La Feltrinelli', 'Via del Borgo 47'),
(3, 'Giunti al Punto', 'Viale Druso 112');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books_to_store`
--
ALTER TABLE `books_to_store`
  ADD PRIMARY KEY (`fk_book`,`fk_store`),
  ADD KEY `store` (`fk_store`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_store_id` (`fk_store_id`);

--
-- Indexes for table `customer_to_books`
--
ALTER TABLE `customer_to_books`
  ADD PRIMARY KEY (`fk_customer`,`fk_book`),
  ADD KEY `book` (`fk_book`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books_to_store`
--
ALTER TABLE `books_to_store`
  ADD CONSTRAINT `books_to_store_ibfk_1` FOREIGN KEY (`fk_book`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `books_to_store_ibfk_2` FOREIGN KEY (`fk_store`) REFERENCES `store` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_store_id`) REFERENCES `store` (`id`);

--
-- Constraints for table `customer_to_books`
--
ALTER TABLE `customer_to_books`
  ADD CONSTRAINT `customer_to_books_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `customer_to_books_ibfk_2` FOREIGN KEY (`fk_book`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
