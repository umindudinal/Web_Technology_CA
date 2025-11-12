-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2025 at 05:10 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itum_event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_events`
--

DROP TABLE IF EXISTS `all_events`;
CREATE TABLE IF NOT EXISTS `all_events` (
  `event_code` varchar(250) NOT NULL,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(250) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `all_events`
--

INSERT INTO `all_events` (`event_code`, `title`, `date`, `venue`, `description`, `image`, `created_at`) VALUES
('E1', 'Civil Padura', '2026-01-13', 'Main Auditorium', 'A lively musical showcase organized for the students of ITUM, celebrating creativity and talent.', 'event1.png', '2025-11-11 12:22:12'),
('E2', 'Yaye Padura', '2025-02-12', 'Open-Air Stage', 'An energetic musical evening featuring performances by ITUM artists.', 'event2.png', '2025-11-11 12:22:12'),
('E3', 'Spandana', '2025-11-12', '500 Auditorium', 'A vibrant concert connecting hearts through music, exclusively for ITUM students.', 'event3.png', '2025-11-11 12:22:12'),
('E4', 'Devthon', '2025-06-18', 'IT Lab', 'A platform for ITUM students to showcase their web designing skills and creativity.', 'event6.png', '2025-11-11 12:22:12'),
('E5', 'SLIOT', '2025-08-19', 'Seminar Room', 'A competition for ITUM innovators to present fresh and groundbreaking ideas.', 'event5.png', '2025-11-11 12:22:12'),
('E6', 'CSE 40', '2025-04-24', 'IT Lab', 'A coding contest to challenge and sharpen the programming skills of ITUM students.', 'event4.png', '2025-11-11 12:22:12'),
('E7', 'Nethrawani', '2025-07-08', 'Grounds', 'A spectacular live concert experience for the ITUM community.', 'event7.png', '2025-11-11 12:22:12'),
('E8', 'Asani', '2025-05-21', 'Main Auditorium', 'A fusion of music and dance to entertain and inspire ITUM students.', 'IMG_8140.jpeg', '2025-11-11 12:22:12'),
('E9', 'Sarasavi Damsara', '2025-03-18', 'Main Auditorium', 'An enchanting musical night for the ITUM community filled with soulful performances.', 'IMG_8128.jpeg', '2025-11-11 12:22:12'),
('E10', 'Ranhiru Abhiman', '2026-03-20', 'Ground', 'A colorful celebration of the Sinhala and Tamil New Year with traditional games, dances, and cultural performances.', 'IMG_8169.jpeg', '2025-11-11 12:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
CREATE TABLE IF NOT EXISTS `event_users` (
  `registration_no` varchar(8) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('Admin','Student') NOT NULL DEFAULT 'Student',
  PRIMARY KEY (`registration_no`),
  UNIQUE KEY `UNIQUE EMAIL` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `event_users`
--

INSERT INTO `event_users` (`registration_no`, `full_name`, `email`, `phone`, `password`, `role`) VALUES
('23IT0470', 'Umindu Dinal', 'umindu@gmail.com', '0782763757', '$2y$10$Dd2hswEDgCsE/vGapd16qOoTNkDachCdfXioF./eNl7b4T1h/nEX6', 'Admin'),
('23IT0527', 'Imasha Samodee', 'imasha@gmail.com', '0771234567', '$2y$10$09cT5NW5zzJCc4AbWJ32JeRfZD0nQ0KdrENnfuIkqm6Gf01gksHge', 'Student'),
('23CI0320', 'Dumindu Shenath', 'dumindushenath@gmail.com', '077334787', '$2y$10$JCZiM.njhjmj9tBkDXVqmeFtMqZmDOr36wVU/LFtk851G3XWW66eG', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `event_code` varchar(50) NOT NULL,
  `title` varchar(250) NOT NULL,
  `registration_no` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`event_code`, `title`, `registration_no`, `created_at`) VALUES
('', 'Nethrawani', '23IT0470', '2025-11-09 21:51:18'),
('', 'SLIOT', '23IT0470', '2025-11-09 21:51:29'),
('', 'Sarasavi Damsara', '23IT0470', '2025-11-09 21:51:06'),
('', 'CSE 40', '23CI0320', '2025-11-09 21:52:54'),
('E9', 'Sarasavi Damsara', '23CI0320', '2025-11-09 21:54:11'),
('E4', 'Devthon', '23CI0320', '2025-11-09 21:54:19'),
('E9', 'Sarasavi Damsara', '23IT0470', '2025-11-09 21:55:40'),
('E8', 'Asani', '23it0470', '2025-11-10 16:19:11'),
('E6', 'CSE 40', '23IT0470', '2025-11-09 21:56:20'),
('E4', 'Devthon', '23IT0470', '2025-11-09 21:56:54'),
('E6', 'CSE 40', '23IT0527', '2025-11-11 15:55:11'),
('E7', 'Nethrawani', '23IT0527', '2025-11-11 15:56:56'),
('E10', 'Ranhiru Abhiman', '23IT0527', '2025-11-11 16:06:58'),
('E1', 'Civil Padura', '23IT0527', '2025-11-11 16:17:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
