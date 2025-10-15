-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2025 at 05:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aics_bicutan_system_db`
--
CREATE DATABASE IF NOT EXISTS `aics_bicutan_system_db`;
USE `aics_bicutan_system_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `rfid` bigint(20) UNSIGNED NOT NULL,
  `role` enum('Guidance Admin','Guard') NOT NULL DEFAULT 'Guard',
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`rfid`, `role`, `name`, `email`, `password`, `image`, `created_at`) VALUES
(9876334570, 'Guard', 'Joshua P. Basco', 'joshuapbasco@aics.edu.ph', '$2y$10$QTCOZkSIWQZZfCenGNRB7uUiVCG6gMPQQ2xGPIiZFpJYhrruFLGFe', NULL, '2025-10-13 13:08:22'),
(9876334571, 'Guard', 'Josh And', 'joshand@aics.edu.ph', '$2y$10$z28hQJz.tsosPx.NIikOLODmuC05TcWQkRw.Ln4nnzAdC59GQA1X2', NULL, '2025-10-13 17:53:33'),
(9876334572, 'Guard', 'Bro', 'bro@aics.edu.ph', '$2y$10$RalxtsBKhxIlf83YNuk5V.Ddag6N9FcOmL4EZMm4GsnYaXKWqVr0K', NULL, '2025-10-13 18:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late') NOT NULL DEFAULT 'Present',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guards`
--

CREATE TABLE `guards` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guards`
--

INSERT INTO `guards` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(2, 'Kupal', 'joshuapaviabasco@gmail.com', '$2y$10$pjt/w42u6CZtytVy8EtBu.QybT5nVSOIZLUIDaTyxbv803WgYl73C', '2025-10-13 18:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `penalty_matrix`
--

CREATE TABLE `penalty_matrix` (
  `id` int(11) NOT NULL,
  `violation_type_id` int(11) NOT NULL,
  `offense_count` tinyint(4) NOT NULL,
  `penalty_description` text DEFAULT NULL,
  `severity_level` enum('Minor','Major','Severe','Conduct','Dress Code','Miscellaneous') DEFAULT 'Minor',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penalty_matrix`
--

INSERT INTO `penalty_matrix` (`id`, `violation_type_id`, `offense_count`, `penalty_description`, `severity_level`, `created_at`) VALUES
(1, 7, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(2, 8, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(3, 9, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(4, 10, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(5, 11, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(6, 12, 1, 'Verbal/Written Warning', 'Minor', '2025-10-13 03:36:51'),
(7, 13, 1, 'Verbal/Written Warning', 'Major', '2025-10-13 03:36:51'),
(8, 14, 1, 'Verbal/Written Warning', 'Major', '2025-10-13 03:36:51'),
(9, 15, 1, 'Verbal/Written Warning', 'Major', '2025-10-13 03:36:51'),
(10, 16, 1, 'Verbal/Written Warning', 'Major', '2025-10-13 03:36:51'),
(11, 17, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(12, 18, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(13, 19, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(14, 20, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(15, 21, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(16, 22, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(17, 23, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(18, 24, 1, 'Verbal/Written Warning', 'Conduct', '2025-10-13 03:36:51'),
(19, 1, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(20, 2, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(21, 3, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(22, 4, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(23, 5, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(24, 6, 1, 'Verbal/Written Warning', 'Dress Code', '2025-10-13 03:36:51'),
(25, 25, 1, 'Verbal/Written Warning', 'Miscellaneous', '2025-10-13 03:36:51'),
(32, 7, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(33, 8, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(34, 9, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(35, 10, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(36, 11, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(37, 12, 2, 'Grounding / Guidance Consultation / Probation', 'Minor', '2025-10-13 03:36:51'),
(38, 13, 2, 'Grounding / Guidance Consultation / Probation', 'Major', '2025-10-13 03:36:51'),
(39, 14, 2, 'Grounding / Guidance Consultation / Probation', 'Major', '2025-10-13 03:36:51'),
(40, 15, 2, 'Grounding / Guidance Consultation / Probation', 'Major', '2025-10-13 03:36:51'),
(41, 16, 2, 'Grounding / Guidance Consultation / Probation', 'Major', '2025-10-13 03:36:51'),
(42, 17, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(43, 18, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(44, 19, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(45, 20, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(46, 21, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(47, 22, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(48, 23, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(49, 24, 2, 'Grounding / Guidance Consultation / Probation', 'Conduct', '2025-10-13 03:36:51'),
(50, 1, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(51, 2, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(52, 3, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(53, 4, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(54, 5, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(55, 6, 2, 'Grounding / Guidance Consultation / Probation', 'Dress Code', '2025-10-13 03:36:51'),
(56, 25, 2, 'Grounding / Guidance Consultation / Probation', 'Miscellaneous', '2025-10-13 03:36:51'),
(63, 7, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(64, 8, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(65, 9, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(66, 10, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(67, 11, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(68, 12, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Minor', '2025-10-13 03:36:51'),
(69, 13, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Major', '2025-10-13 03:36:51'),
(70, 14, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Major', '2025-10-13 03:36:51'),
(71, 15, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Major', '2025-10-13 03:36:51'),
(72, 16, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Major', '2025-10-13 03:36:51'),
(73, 17, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(74, 18, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(75, 19, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(76, 20, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(77, 21, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(78, 22, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(79, 23, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(80, 24, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Conduct', '2025-10-13 03:36:51'),
(81, 1, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(82, 2, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(83, 3, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(84, 4, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(85, 5, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(86, 6, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Dress Code', '2025-10-13 03:36:51'),
(87, 25, 3, 'Suspension / Community Service / Further Disciplinary Action', 'Miscellaneous', '2025-10-13 03:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `rfid_admin_scans`
--

CREATE TABLE `rfid_admin_scans` (
  `id` int(11) NOT NULL,
  `rfid_number` bigint(20) UNSIGNED NOT NULL,
  `user_type` enum('admin','guard') NOT NULL DEFAULT 'admin',
  `admin_username` varchar(50) DEFAULT NULL,
  `admin_role` enum('Guidance Admin','Guard') DEFAULT 'Guard',
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_registered` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rfid_registration_scans`
--

CREATE TABLE `rfid_registration_scans` (
  `scan_id` int(11) NOT NULL,
  `rfid_number` bigint(20) UNSIGNED NOT NULL,
  `user_type` enum('student') NOT NULL DEFAULT 'student',
  `time_scanned` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rfid_registration_scans`
--

INSERT INTO `rfid_registration_scans` (`scan_id`, `rfid_number`, `user_type`, `time_scanned`, `is_used`) VALUES
(13, 1234567899, 'student', '2025-10-14 02:39:51', 0);

-- --------------------------------------------------------


-- Create RFID Admin Confirmation Table
-- This table stores RFID numbers confirmed by Guidance Admin ONLY for guard/admin registration
-- RFIDs are deleted after successful registration to prevent reuse
-- IMPORTANT: Only Guidance Admin role can add entries to this table

CREATE TABLE IF NOT EXISTS `rfid_admin_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid_number` bigint(20) UNSIGNED NOT NULL,
  `confirmed_by` varchar(200) NOT NULL COMMENT 'Name of Guidance Admin who confirmed this RFID',
  `confirmed_by_role` enum('Guidance Admin') NOT NULL DEFAULT 'Guidance Admin' COMMENT 'Must be Guidance Admin only',
  `confirmed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL COMMENT 'Optional notes about the confirmation',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rfid` (`rfid_number`),
  KEY `idx_confirmed_at` (`confirmed_at`),
  KEY `idx_confirmed_by_role` (`confirmed_by_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
COMMENT='Stores confirmed RFID numbers for guard registration - Guidance Admin confirmations only';

--
-- Table structure for table `saved_attendance`
--

CREATE TABLE `saved_attendance` (
  `id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `student_number_display` varchar(50) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `saved_time_in` datetime DEFAULT NULL,
  `saved_time_out` datetime DEFAULT NULL,
  `saved_date` date NOT NULL,
  `status` enum('Present','Absent','Late') DEFAULT 'Present',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_number` int(11) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `firstname` varchar(120) NOT NULL,
  `middlename` varchar(120) DEFAULT NULL,
  `name` varchar(255) GENERATED ALWAYS AS (concat(`firstname`,' ',ifnull(concat(`middlename`,' '),''),`lastname`)) STORED,
  `course` varchar(100) DEFAULT NULL,
  `yearlevel` varchar(50) DEFAULT NULL,
  `section` varchar(80) DEFAULT NULL,
  `rfid` bigint(20) UNSIGNED DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(512) DEFAULT 'assets/default-profile.png',
  `archived` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_number`, `lastname`, `firstname`, `middlename`, `course`, `yearlevel`, `section`, `rfid`, `password`, `email`, `image`, `archived`, `created_at`, `updated_at`) VALUES
(220342, 'Basco', 'Joshua', 'Pavia', 'BSCS', '1st Year', 'BS2EA', 1234567890, '220342', 'joshuapaviabasco@aics.edu.ph', 'assets/default-profile.png', 1, '2025-10-13 04:25:11', '2025-10-14 02:21:35'),
(220343, 'Santos', 'Maria', 'Lopez', 'BSIT', '3rd Year', 'IT3A', 9876543212, '220343', 'mariasantos@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220344, 'Reyes', 'John', 'Emmanuel', 'BSCS', '2nd Year', 'CS2B', 9876543213, '220344', 'johnreyes@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220345, 'Dela Cruz', 'Angela', 'Marie', 'BSIS', '1st Year', 'IS1A', 9876543214, '220345', 'angeladelacruz@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220346, 'Villanueva', 'Carlos', 'Antonio', 'BSIT', '4th Year', 'IT4C', 9876543215, '220346', 'carlosvillanueva@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220347, 'Garcia', 'Elaine', 'Ramos', 'BSCS', '3rd Year', 'CS3C', 9876543216, '220347', 'elainegarcia@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220348, 'Fernandez', 'Mark', 'Joseph', 'BSIT', '2nd Year', 'IT2B', 9876543217, '220348', 'markfernandez@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220349, 'Rodriguez', 'Sophia', 'Grace', 'BSCS IS', '1st Year', 'BS1MA', 9876543218, '220349', 'sophiarodriguez@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220350, 'Torres', 'Nathaniel', 'Luis', 'BSIS', '4th Year', 'IS4B', 9876543219, '220350', 'nathanielltorres@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220351, 'Gutierrez', 'Patricia', 'Anne', 'BSIT', '3rd Year', 'IT3B', 9876543220, '220351', 'patriciagutierrez@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL),
(220352, 'Castillo', 'Miguel', 'Andres', 'BSCS', '2nd Year', 'CS2A', 9876543221, '220352', 'miguelcastillo@aics.edu.ph', 'assets/default-profile.png', 0, '2025-10-13 04:25:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_offense_counts`
--

CREATE TABLE `student_offense_counts` (
  `id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  `violation_type_id` int(11) NOT NULL,
  `offense_count` tinyint(4) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `violation_id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  `violation_type_id` int(11) NOT NULL,
  `violation_description` text DEFAULT NULL,
  `offense_count` tinyint(4) NOT NULL DEFAULT 1,
  `penalty` text DEFAULT NULL,
  `recorded_by_role` enum('admin','guard') NOT NULL,
  `recorded_by_id` bigint(20) UNSIGNED NOT NULL,
  `recorded_by_name` varchar(200) DEFAULT NULL,
  `acknowledged` tinyint(1) NOT NULL DEFAULT 0,
  `acknowledged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`violation_id`, `student_number`, `violation_type_id`, `violation_description`, `offense_count`, `penalty`, `recorded_by_role`, `recorded_by_id`, `recorded_by_name`, `acknowledged`, `acknowledged_at`, `created_at`) VALUES
(13, 220342, 1, NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:50:55'),
(14, 220342, 1, NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:51:13'),
(15, 220342, 1, NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 02:48:00');

--
-- Triggers `violations`
--
DELIMITER $$
CREATE TRIGGER `trg_violations_after_insert_history` AFTER INSERT ON `violations` FOR EACH ROW BEGIN
  DECLARE student_name_var VARCHAR(255);
  DECLARE student_yearlevel_var VARCHAR(50);
  DECLARE student_course_var VARCHAR(100);
  DECLARE student_section_var VARCHAR(80);
  DECLARE violation_type_name_var VARCHAR(255);
  
  -- Get current student information
  SELECT name, yearlevel, course, section
  INTO student_name_var, student_yearlevel_var, student_course_var, student_section_var
  FROM students 
  WHERE student_number = NEW.student_number;
  
  -- Get violation type name
  SELECT violation_name
  INTO violation_type_name_var
  FROM violation_types
  WHERE id = NEW.violation_type_id;
  
  -- Insert complete violation history record
  INSERT INTO violations_history (
    violation_id,
    student_number,
    student_name,
    year_level,
    course,
    section,
    violation_type_id,
    violation_type_name,
    violation_description,
    offense_count,
    penalty,
    recorded_by_role,
    recorded_by_id,
    recorded_by_name,
    acknowledged,
    acknowledged_at,
    created_at
  ) VALUES (
    NEW.violation_id,
    NEW.student_number,
    student_name_var,
    student_yearlevel_var,
    student_course_var,
    student_section_var,
    NEW.violation_type_id,
    violation_type_name_var,
    NEW.violation_description,
    NEW.offense_count,
    NEW.penalty,
    NEW.recorded_by_role,
    NEW.recorded_by_id,
    NEW.recorded_by_name,
    NEW.acknowledged,
    NEW.acknowledged_at,
    NEW.created_at
  );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `violations_history`
--

CREATE TABLE `violations_history` (
  `id` int(11) NOT NULL,
  `violation_id` int(11) NOT NULL,
  `student_number` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `year_level` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `section` varchar(80) DEFAULT NULL,
  `violation_type_id` int(11) NOT NULL,
  `violation_type_name` varchar(255) NOT NULL,
  `violation_description` text DEFAULT NULL,
  `offense_count` tinyint(4) NOT NULL DEFAULT 1,
  `penalty` text DEFAULT NULL,
  `recorded_by_role` enum('admin','guard') NOT NULL,
  `recorded_by_id` bigint(20) UNSIGNED NOT NULL,
  `recorded_by_name` varchar(200) DEFAULT NULL,
  `acknowledged` tinyint(1) NOT NULL DEFAULT 0,
  `acknowledged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violations_history`
--

INSERT INTO `violations_history` (`id`, `violation_id`, `student_number`, `student_name`, `year_level`, `course`, `section`, `violation_type_id`, `violation_type_name`, `violation_description`, `offense_count`, `penalty`, `recorded_by_role`, `recorded_by_id`, `recorded_by_name`, `acknowledged`, `acknowledged_at`, `created_at`) VALUES
(1, 9, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-13 20:01:23'),
(2, 10, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 25, 'Others', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-13 20:01:58'),
(3, 11, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:49:26'),
(4, 12, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:49:37'),
(5, 13, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:50:55'),
(6, 14, 220342, 'Joshua Pavia Basco', 'Grade 11', 'ICT', 'IC1MA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 01:51:13'),
(7, 15, 220342, 'Joshua Pavia Basco', '1st Year', 'BSCS', 'BS2EA', 1, 'No ID', NULL, 1, NULL, 'guard', 2, 'Kupal', 0, NULL, '2025-10-14 02:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `violation_types`
--

CREATE TABLE `violation_types` (
  `id` int(11) NOT NULL,
  `violation_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `severity_level` enum('Minor','Major','Severe','Conduct','Dress Code','Miscellaneous') DEFAULT 'Minor',
  `default_penalty` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `violation_types`
--

INSERT INTO `violation_types` (`id`, `violation_name`, `category`, `severity_level`, `default_penalty`, `is_active`, `created_at`) VALUES
(1, 'No ID', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(2, 'Wearing of rubber slippers', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(3, 'Improper wearing of uniform', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(4, 'Non-prescribed haircut', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(5, 'Wearing of earrings', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(6, 'Wearing of multiple earrings', 'Dress Code', 'Dress Code', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(7, 'Using cellphones/ gadgets during class hours', 'Minor', 'Minor', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(8, 'Eating inside the laboratories', 'Minor', 'Minor', 'Warning/Grounding/Community Service', 1, '2025-10-13 03:36:51'),
(9, 'Improper not wearing/ tampering of ID', 'Minor', 'Minor', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(10, 'Improper/tampered ID', 'Minor', 'Minor', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(11, 'Improper hairstyle', 'Minor', 'Minor', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(12, 'Improper Uniform', 'Minor', 'Minor', 'Warning/Grounding/Suspension', 1, '2025-10-13 03:36:51'),
(13, 'Stealing', 'Major', 'Major', 'Suspension/Non-readmission/Expulsion', 1, '2025-10-13 03:36:51'),
(14, 'Vandalism', 'Major', 'Major', 'Community Service/Suspension/Non-readmission', 1, '2025-10-13 03:36:51'),
(15, 'Verbal assault', 'Major', 'Major', 'Grounding/Suspension/Non-readmission', 1, '2025-10-13 03:36:51'),
(16, 'Organizing/joining fraternity activities', 'Major', 'Major', 'Suspension/Non-readmission/Expulsion', 1, '2025-10-13 03:36:51'),
(17, 'Cutting Classes', 'Conduct', 'Conduct', 'Warning/Probation/Suspension', 1, '2025-10-13 03:36:51'),
(18, 'Cheating/Academic Dishonesty', 'Conduct', 'Conduct', 'Probation/Suspension/Non-readmission', 1, '2025-10-13 03:36:51'),
(19, 'Theft/Stealing', 'Conduct', 'Conduct', 'Suspension/Non-readmission/Expulsion', 1, '2025-10-13 03:36:51'),
(20, 'Inflicting/Direct Assault', 'Conduct', 'Conduct', 'Suspension/Non-readmission/Expulsion', 1, '2025-10-13 03:36:51'),
(21, 'Gambling', 'Conduct', 'Conduct', 'Suspension/Non-readmission/Expulsion', 1, '2025-10-13 03:36:51'),
(22, 'Smoking within the school vicinity', 'Conduct', 'Conduct', 'Grounding/Suspension/Non-readmission', 1, '2025-10-13 03:36:51'),
(23, 'Possession/Use of Prohibited Drugs', 'Conduct', 'Conduct', 'Suspension/Expulsion', 1, '2025-10-13 03:36:51'),
(24, 'Possession/Use of Liquor/Alcoholic Beverages', 'Conduct', 'Conduct', 'Suspension/Non-readmission', 1, '2025-10-13 03:36:51'),
(25, 'Others', 'Miscellaneous', 'Miscellaneous', 'Varies', 1, '2025-10-13 03:36:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`rfid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `student_date_unique` (`student_number`,`date`),
  ADD KEY `idx_date` (`date`);

--
-- Indexes for table `guards`
--
ALTER TABLE `guards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `penalty_matrix`
--
ALTER TABLE `penalty_matrix`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `violation_offense_unique` (`violation_type_id`,`offense_count`),
  ADD KEY `idx_violation_offense` (`violation_type_id`,`offense_count`);

--
-- Indexes for table `rfid_admin_scans`
--
ALTER TABLE `rfid_admin_scans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rfid` (`rfid_number`),
  ADD KEY `idx_username` (`admin_username`),
  ADD KEY `idx_time` (`scanned_at`),
  ADD KEY `idx_registered` (`is_registered`);

--
-- Indexes for table `rfid_registration_scans`
--
ALTER TABLE `rfid_registration_scans`
  ADD PRIMARY KEY (`scan_id`),
  ADD KEY `rfid_number` (`rfid_number`),
  ADD KEY `time_scanned` (`time_scanned`),
  ADD KEY `is_used` (`is_used`);

--
-- Indexes for table `saved_attendance`
--
ALTER TABLE `saved_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_student_date` (`student_number`,`saved_date`),
  ADD KEY `idx_saved_date` (`saved_date`),
  ADD KEY `idx_student_number_display` (`student_number_display`),
  ADD KEY `idx_student_number` (`student_number`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_number`),
  ADD UNIQUE KEY `rfid` (`rfid`),
  ADD KEY `idx_rfid` (`rfid`),
  ADD KEY `idx_name` (`lastname`,`firstname`);

--
-- Indexes for table `student_offense_counts`
--
ALTER TABLE `student_offense_counts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_violation_unique` (`student_number`,`violation_type_id`),
  ADD KEY `violation_type_id` (`violation_type_id`),
  ADD KEY `idx_student_violation` (`student_number`,`violation_type_id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`violation_id`),
  ADD KEY `idx_student_number` (`student_number`),
  ADD KEY `idx_violation_type` (`violation_type_id`),
  ADD KEY `idx_date` (`created_at`);

--
-- Indexes for table `violations_history`
--
ALTER TABLE `violations_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_violation_id` (`violation_id`),
  ADD KEY `idx_student_number` (`student_number`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_acknowledged` (`acknowledged`);

--
-- Indexes for table `violation_types`
--
ALTER TABLE `violation_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `violation_name` (`violation_name`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_severity` (`severity_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `rfid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9876334573;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guards`
--
ALTER TABLE `guards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penalty_matrix`
--
ALTER TABLE `penalty_matrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `rfid_admin_scans`
--
ALTER TABLE `rfid_admin_scans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfid_registration_scans`
--
ALTER TABLE `rfid_registration_scans`
  MODIFY `scan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `saved_attendance`
--
ALTER TABLE `saved_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220353;

--
-- AUTO_INCREMENT for table `student_offense_counts`
--
ALTER TABLE `student_offense_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `violation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `violations_history`
--
ALTER TABLE `violations_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `violation_types`
--
ALTER TABLE `violation_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`) ON DELETE CASCADE;

--
-- Constraints for table `penalty_matrix`
--
ALTER TABLE `penalty_matrix`
  ADD CONSTRAINT `penalty_matrix_ibfk_1` FOREIGN KEY (`violation_type_id`) REFERENCES `violation_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_offense_counts`
--
ALTER TABLE `student_offense_counts`
  ADD CONSTRAINT `student_offense_counts_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_offense_counts_ibfk_2` FOREIGN KEY (`violation_type_id`) REFERENCES `violation_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `violations`
--
ALTER TABLE `violations`
  ADD CONSTRAINT `violations_ibfk_1` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `violations_ibfk_2` FOREIGN KEY (`violation_type_id`) REFERENCES `violation_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
