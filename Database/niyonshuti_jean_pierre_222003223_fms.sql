-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2024 at 10:47 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `niyonshuti_jean_pierre_222003223_fms`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_info`
-- (See below for the actual view)
--
CREATE TABLE `all_info` (
`playeer_id` int(11)
,`player_first_name` varchar(50)
,`player_last_name` varchar(50)
,`player_position` varchar(15)
,`player_date_of_birth` varchar(255)
,`coacher_id` int(11)
,`coach_first_name` varchar(40)
,`coach_last_name` varchar(20)
,`club_id` int(11)
,`name` varchar(15)
,`club_stadium_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  `location` varchar(30) NOT NULL,
  `website` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `bank_account` varchar(50) NOT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_name`, `location`, `website`, `contact`, `bank_account`, `club_id`) VALUES
(1, 'Rwanda National Bank', 'Kigali', 'www.rwandanationalbank.rw', '+250123456', 'RW1234567890', 6),
(2, 'Kigali Commercial Ba', 'Kigali', 'www.kigalicommercialbank.rw', '+250234567', 'KC4567890123', NULL),
(3, 'Rubavu Savings Bank', 'Rubavu', 'www.rubavusavingsbank.rw', '+250345678', 'RSB5678901234', NULL),
(4, 'Nyagatare Cooperativ', 'Nyagatare', 'www.nyagatarecoopbank.rw', '+250456789', 'NCB6789012345', NULL),
(5, 'Huye Development Ban', 'Huye', 'www.huyedevelopmentbank.rw', '+250567890', 'HDB7890123456', NULL),
(6, 'Rwanda National Bank', 'Kigali', 'www.rwandanationalbank.rw', '+250123456', 'RW1234567890', NULL),
(7, 'Kigali Commercial Ba', 'Kigali', 'www.kigalicommercialbank.rw', '+250234567', 'KC4567890123', NULL),
(8, 'Rubavu Savings Bank', 'Rubavu', 'www.rubavusavingsbank.rw', '+250345678', 'RSB5678901234', NULL),
(9, 'Nyagatare Cooperativ', 'Nyagatare', 'www.nyagatarecoopbank.rw', '+250456789', 'NCB6789012345', NULL),
(10, 'Huye Development Ban', 'Huye', 'www.huyedevelopmentbank.rw', '+250567890', 'HDB7890123456', NULL),
(11, 'Rwanda National Bank', 'Kigali', 'www.rwandanationalbank.rw', '+250123456', 'RW1234567890', NULL),
(12, 'Kigali Commercial Ba', 'Kigali', 'www.kigalicommercialbank.rw', '+250234567', 'KC4567890123', NULL),
(13, 'Rubavu Savings Bank', 'Rubavu', 'www.rubavusavingsbank.rw', '+250345678', 'RSB5678901234', NULL),
(14, 'Nyagatare Cooperativ', 'Nyagatare', 'www.nyagatarecoopbank.rw', '+250456789', 'NCB6789012345', NULL),
(15, 'Huye Development Ban', 'Huye', 'www.huyedevelopmentbank.rw', '+250567890', 'HDB7890123456', NULL),
(17, 'Eqity bank', 'Huye', 'www.uruba.com', '0780000000', 'EQ000012345', 1),
(18, 'BK', 'Huye', 'www.gasogifunclub.com', '0729554144', 'BK000012345', 5),
(19, 'BK', 'Muhanga', 'www.muhangabank.com', '0786407569', 'BK000012345', 3),
(20, 'Eqity bank', 'Huye', 'www.uruba.com', '0780000000', 'EQ000012345', 1),
(21, 'Eqity bank', 'Muhanga', 'www.agahebuzo.com', '0786407569', 'BK000012345', 19),
(22, 'Bank of Africa', 'Huye', 'www.bankofafrica.uc.rw.com', '0786407569', 'BA0000000344', 5),
(23, 'Bank of Africa', 'Muhanga', 'www.agahebuzo.com', '0729554144', 'BA0000000344', 6);

--
-- Triggers `bank`
--
DELIMITER $$
CREATE TRIGGER `AfterInsertBank` AFTER INSERT ON `bank` FOR EACH ROW BEGIN
    INSERT INTO bank_audit (bank_id, action, audit_timestamp)
    VALUES (NEW.bank_id, 'INSERT', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bank_audit`
--

CREATE TABLE `bank_audit` (
  `bank_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `audit_timestamp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_audit`
--

INSERT INTO `bank_audit` (`bank_id`, `action`, `audit_timestamp`) VALUES
(17, 'INSERT', '2024-04-09 16:26:46'),
(18, 'INSERT', '2024-04-09 16:28:10'),
(19, 'INSERT', '2024-04-09 16:37:09'),
(20, 'INSERT', '2024-04-09 16:37:58'),
(21, 'INSERT', '2024-04-10 10:39:49'),
(22, 'INSERT', '2024-04-13 14:50:04'),
(23, 'INSERT', '2024-04-13 15:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `city` varchar(20) NOT NULL,
  `league` varchar(15) NOT NULL,
  `stadium_name` varchar(255) DEFAULT NULL,
  `league_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`club_id`, `name`, `city`, `league`, `stadium_name`, `league_id`) VALUES
(1, 'APR FC', 'Kigali', 'rwanda primier ', 'Kigali pele studium', NULL),
(2, 'As Kigali FC', 'Kigali', 'rwanda primier ', 'Kigali pele studium', NULL),
(3, 'Police FC', 'Kigali', 'rwanda primier ', 'Kigali pele studium', NULL),
(4, 'Rayon Sport FC', 'Kigali', 'rwanda primier ', 'Kigali pele studium', NULL),
(5, 'Etoil De l Est ', 'Ngoma', 'rwanda primier ', 'Ngoma stadium', NULL),
(6, 'Musanze FC', 'Musanze', 'rwanda primier ', 'UBWOROHERANE stadium', NULL),
(7, 'Gorilla FC', 'Kigali', 'rwanda primier ', 'Kigali pere stadium', NULL),
(8, 'Sunrise FC', 'Nyagatare', 'rwanda primier ', 'Nyagatare stadium', NULL),
(9, 'Gasogi FC', 'kigali', 'rwanda primier ', 'Kigali pele studium', NULL),
(10, 'Mukura FC', 'Huye', 'rwanda primier ', 'Huye stadium', NULL),
(11, 'Marine FC', 'Rubavu', 'rwanda primier ', 'Umuganda stadium', NULL),
(12, 'Bugesera FC', 'Bugesera', 'rwanda primier ', 'Bugesera stadium', NULL),
(13, 'Amagaju FC', 'Kigali', 'rwanda primier ', 'Kigali pere stadium', NULL),
(14, 'Muhazi United F', 'Ngoma', 'rwanda primier ', 'Ngoma stadium', NULL),
(15, 'Kiyovu FC', 'Kigali', 'rwanda primier ', 'Kigali pere stadium', NULL),
(16, 'Etincelles FC', 'Rubavu', 'rwanda primier ', 'Umuganda stadium', NULL),
(17, 'Musanze FC', 'Musanze', 'Primus league', 'pere_stadium', 1),
(18, 'Muhazi FC', 'kirehe', 'Primus league', 'pere_stadium', 1),
(19, 'Sorwath FC', 'Kinihira', 'Primus league', 'kinihira_stadium', 1),
(20, 'APR FC', 'Musanze', 'Primus league', 'kinihira_stadium', 3);

--
-- Triggers `club`
--
DELIMITER $$
CREATE TRIGGER `AfterDeleteClub` AFTER DELETE ON `club` FOR EACH ROW BEGIN
    
    INSERT INTO club_audit (club_id, action, audit_timestamp)
    VALUES (OLD.club_id, 'DELETE', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterInsertClub` AFTER INSERT ON `club` FOR EACH ROW BEGIN
    
    INSERT INTO club_audit (club_id, action, audit_timestamp)
    VALUES (NEW.club_id, 'INSERT', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterUpdateClub` AFTER UPDATE ON `club` FOR EACH ROW BEGIN
    
    INSERT INTO club_audit (club_id, action, audit_timestamp)
    VALUES (NEW.club_id, 'UPDATE', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `clubupdate_view`
-- (See below for the actual view)
--
CREATE TABLE `clubupdate_view` (
`club_id` int(11)
,`name` varchar(15)
,`city` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `club_audit`
--

CREATE TABLE `club_audit` (
  `club_id` int(11) NOT NULL,
  `action` varchar(50) DEFAULT NULL,
  `audit_timestamp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club_audit`
--

INSERT INTO `club_audit` (`club_id`, `action`, `audit_timestamp`) VALUES
(17, 'INSERT', '2024-04-10 08:53:50'),
(18, 'INSERT', '2024-04-10 09:01:33'),
(19, 'INSERT', '2024-04-10 09:08:16'),
(20, 'INSERT', '2024-04-12 16:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `coacher`
--

CREATE TABLE `coacher` (
  `coacher_id` int(11) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coacher`
--

INSERT INTO `coacher` (`coacher_id`, `last_name`, `first_name`, `nationality`, `email`, `contact`, `club_id`) VALUES
(1, 'Vencent', 'Mashami', 'Rwandan', 'john.smith@example.com', '+250123456', 3),
(2, 'Christian', 'Thiery Froger ', 'France', 'thieryfrogerchristian@example.com', '+245234567', 1),
(3, 'Williams', 'Robert', 'Rwandan', 'robert.williams@example.com', '+250345678', 5),
(4, 'Jones', 'Emily', 'Rwandan', 'emily.jones@example.com', '+250456700', 12),
(5, 'Brown', 'Michael', 'Rwandan', 'michael.brown@example.com', '+250565690', 15),
(6, 'Davis', 'Jessica', 'Rwandan', 'jessica.davis@example.com', '+250675401', 9),
(7, 'Brown', 'Michael', 'Rwandan', 'michael.brown@example.com', '+250565690', 16),
(8, 'Davis', 'Jessica', 'Rwandan', 'jessica.davis@example.com', '+250740040', 10),
(9, 'Miller', 'David', 'Rwandan', 'david.miller@example.com', '+250789007', 11),
(10, 'Wilson', 'Sarah', 'Rwandan', 'sarah.wilson@example.com', '+250789990', 8),
(11, 'Moore', 'James', 'Rwandan', 'james.moore@example.com', '+250790112', 7),
(12, 'Taylor', 'Linda', 'Rwandan', 'linda.taylor@example.com', '+250788006', 4),
(13, 'Vencent', 'Mashami', 'Rwandan', 'john.smith@example.com', '+250123456', 3),
(14, 'Christian', 'Thiery Froger ', 'France', 'thieryfrogerchristian@example.com', '+245234567', 1),
(15, 'Williams', 'Robert', 'Rwandan', 'robert.williams@example.com', '+250345678', 5),
(16, 'Jones', 'Emily', 'Rwandan', 'emily.jones@example.com', '+250456700', 12),
(17, 'Brown', 'Michael', 'Rwandan', 'michael.brown@example.com', '+250565690', 15),
(18, 'Davis', 'Jessica', 'Rwandan', 'jessica.davis@example.com', '+250675401', 9),
(19, 'NIYONSHUTI', 'Jean Pierre', 'Rwandan', 'hello@gmail.com', '0786407569', 19),
(20, 'NIYONSHUTI', 'Jean Pierre', 'Rwandan', 'jeanpierreniyonshuti71@gmail.com', '0786407569', 19);

-- --------------------------------------------------------

--
-- Stand-in structure for view `delete_view`
-- (See below for the actual view)
--
CREATE TABLE `delete_view` (
`bank_id` int(11)
,`bank_name` varchar(30)
,`location` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `fun_club`
--

CREATE TABLE `fun_club` (
  `funclub_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `website` varchar(50) NOT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fun_club`
--

INSERT INTO `fun_club` (`funclub_id`, `name`, `description`, `contact`, `website`, `club_id`) VALUES
(2, 'URUBABYINGWE FUN', 'A club for passionate football fans in Gasogi FC', '+250123456', 'www.gasogifunclub.com', 9),
(3, 'GITINYIRO FUN', 'Supporting local and national football teams in APR FC', '+250234567', 'www.kigalisupporters.com', 1),
(4, 'Rubavu Football Lovers', 'Bringing football fans together in Marine FC', '+250345678', 'www.rubavulovers.com', 16),
(5, 'Nyagatare Soccer Fans', 'Uniting soccer enthusiasts in Sunrise FC', '+250456789', 'www.nyagatarefans.com', 8),
(6, 'Huye Football Enclave', 'A community of football lovers in Mukura FC', '+250567890', 'www.huyeenclave.com', 10),
(7, 'URUMANURACUPA Fun Club', 'A club for passionate football fans in Gasogi FC', '0786407569', 'TechSavvyHub.com', 19),
(8, 'AGAHEBUZO FunClub', 'A club for passionate football fans in Gasogi FC', '0786407569', 'www.agahebuzo.com', 19),
(9, 'AGAHEBUZO FunClub', 'A club for passionate football fans in Gasogi FC', '0786407569', 'www.agahebuzo.com', 19),
(10, 'AGAHEBUZO FunClub', 'A club for passionate football fans in Gasogi FC', '0786407569', 'www.agahebuzo.com', 19),
(12, 'Habiyaremye Daniel', 'A club for passionate football fans in Gasogi FC', '0729554144', 'www.agahebuzo.com', 19),
(13, 'URUBABYINGWE', 'A club for passionate football fans in Gasogi FC', '0780000000', 'www.gasogifunclub.com', 5),
(14, 'URUBABYINGWE', 'A club for passionate football fans in Gasogi FC', '0780000000', 'www.gasogifunclub.com', 5),
(15, 'URUBABYINGWEmu', 'A club for passionate football fans in Gasogi FC', '078000098', 'www.gasogi.com', 5),
(16, 'URUBABYINGWEmu', 'A club for passionate football fans in Gasogi FC', '078000090', 'www.gasogi.com', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_clubview`
-- (See below for the actual view)
--
CREATE TABLE `insert_clubview` (
`club_id` int(11)
,`name` varchar(15)
,`city` varchar(20)
,`league` varchar(15)
,`stadium_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_coacherview`
-- (See below for the actual view)
--
CREATE TABLE `insert_coacherview` (
`coacher_id` int(11)
,`last_name` varchar(20)
,`first_name` varchar(40)
,`nationality` varchar(20)
,`email` varchar(100)
,`contact` varchar(10)
,`club_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_funclubview`
-- (See below for the actual view)
--
CREATE TABLE `insert_funclubview` (
`funclub_id` int(11)
,`name` varchar(50)
,`description` varchar(100)
,`contact` varchar(10)
,`website` varchar(50)
,`club_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_leagueview`
-- (See below for the actual view)
--
CREATE TABLE `insert_leagueview` (
`league_id` int(11)
,`league_name` varchar(200)
,`country` varchar(20)
,`season` varchar(150)
,`start_date` date
,`end_date` date
,`number_club` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_managerview`
-- (See below for the actual view)
--
CREATE TABLE `insert_managerview` (
`manager_id` int(11)
,`last_name` varchar(20)
,`first_name` varchar(20)
,`email` varchar(50)
,`contact` varchar(10)
,`club_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_matchsview`
-- (See below for the actual view)
--
CREATE TABLE `insert_matchsview` (
`match_id` int(11)
,`match_date` date
,`home_club` varchar(10)
,`away_club` varchar(10)
,`referee_names` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_playerview`
-- (See below for the actual view)
--
CREATE TABLE `insert_playerview` (
`playeer_id` int(11)
,`last_name` varchar(50)
,`first_name` varchar(50)
,`email` varchar(100)
,`contact` varchar(10)
,`position` varchar(15)
,`Club_id` int(11)
,`country` varchar(255)
,`date_of_birth` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_stadiumview`
-- (See below for the actual view)
--
CREATE TABLE `insert_stadiumview` (
`studium_id` int(11)
,`studium_name` varchar(30)
,`capacity` int(11)
,`club_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `insert_user_adminview`
-- (See below for the actual view)
--
CREATE TABLE `insert_user_adminview` (
`User_id` int(11)
,`last_name` varchar(30)
,`first_name` varchar(30)
,`email` varchar(50)
,`password` varchar(10)
,`contact` varchar(10)
,`Manager_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `league`
--

CREATE TABLE `league` (
  `league_id` int(11) NOT NULL,
  `league_name` varchar(200) NOT NULL,
  `country` varchar(20) NOT NULL,
  `season` varchar(150) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `number_club` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `league`
--

INSERT INTO `league` (`league_id`, `league_name`, `country`, `season`, `start_date`, `end_date`, `number_club`) VALUES
(1, 'Rwanda Premier League', 'Rwanda', '2023-2024', '2023-08-01', '2024-05-31', 16),
(2, 'Amahoro cup', 'Rwanda', '2023-2024', '2023-08-01', '2024-05-31', 32),
(3, 'Rwanda Premier League', 'Rwanda', '2023-2024', '2023-08-01', '2024-05-31', 16),
(4, 'Amahoro cup', 'Rwanda', '2023-2024', '2023-08-01', '2024-05-31', 32);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `last_name`, `first_name`, `email`, `contact`, `club_id`) VALUES
(2, 'Smith', 'John', 'john.smith@example.com', '+250123456', 1),
(3, 'Johnson', 'Alice', 'mugeni@gmail.com', '+250234567', 12),
(4, 'Williams', 'Robert', 'robert.williams@example.com', '+250345678', 3),
(5, 'Jones', 'Emily', 'emily.jones@example.com', '+250456789', 5),
(6, 'Brown', 'Michael', 'michael.brown@example.com', '+250567890', 2);

-- --------------------------------------------------------

--
-- Table structure for table `matchs`
--

CREATE TABLE `matchs` (
  `match_id` int(11) NOT NULL,
  `match_date` date NOT NULL,
  `home_club` varchar(10) NOT NULL,
  `away_club` varchar(10) NOT NULL,
  `referee_names` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matchs`
--

INSERT INTO `matchs` (`match_id`, `match_date`, `home_club`, `away_club`, `referee_names`) VALUES
(1, '2023-08-10', 'APR FC', 'Rayon Spor', 'MUKANSANGA'),
(2, '2023-08-11', 'AS Kigali ', 'Police FC', 'Alice Johnson'),
(3, '2023-08-12', 'Mukura FC', 'Gasogi FC', 'Robert Williams'),
(4, '2023-08-13', 'Marine FC', 'Sunrise FC', 'Emily Jones'),
(5, '2023-08-14', 'Bugesera F', 'Kiyovu FC', 'Michael Brown'),
(6, '2023-08-10', 'APR FC', 'Rayon Spor', 'MUKANSANGA'),
(7, '2023-08-11', 'AS Kigali ', 'Police FC', 'Alice Johnson'),
(8, '2023-08-12', 'Mukura FC', 'Gasogi FC', 'Robert Williams'),
(9, '2023-08-13', 'Marine FC', 'Sunrise FC', 'Emily Jones'),
(10, '2023-08-14', 'Bugesera F', 'Kiyovu FC', 'Michael Brown'),
(11, '2023-08-10', 'APR FC', 'Rayon Spor', 'MUKANSANGA'),
(12, '2023-08-11', 'AS Kigali ', 'Police FC', 'Alice Johnson'),
(13, '2023-08-12', 'Mukura FC', 'Gasogi FC', 'Robert Williams'),
(14, '2023-08-13', 'Marine FC', 'Sunrise FC', 'Emily Jones'),
(15, '2023-08-14', 'Bugesera F', 'Kiyovu FC', 'Michael Brown');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `playeer_id` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `position` varchar(15) NOT NULL,
  `Club_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`playeer_id`, `last_name`, `first_name`, `email`, `contact`, `position`, `Club_id`, `country`, `date_of_birth`) VALUES
(1, 'Victor', 'Mbaoma', 'mbaoma@gmail.com', '078666', 'defender', 1, 'Rwanda', '1996-20-10'),
(2, 'Innocent', 'Nshuti', 'nshuti@gmail.com', '', 'Forward', 1, 'Nigeria', '1999-01-01'),
(3, 'Gilbert', 'Mugisha', 'mugisha@gmail.com', '', 'Forward', 1, 'Rwanda', '2000-01-01'),
(4, 'Yannick', 'Bizimana', 'bizimana@gmail.com', '', 'Forward', 1, 'Rwanda', '2001-01-01'),
(5, 'Yves', 'Mugunga', 'mugunga@gmail.com', '', 'Forward', 1, 'Rwanda', '1997-01-01'),
(6, 'Maxime', 'Sekamana', 'sekamana@gmail.com', '', 'Forward', 1, 'Rwanda', '1996-01-01'),
(7, 'Victor', 'Mbaoma', 'mbaoma@gmail.com', '078666', 'defender', 1, 'Rwanda', '1996-20-10'),
(8, 'Innocent', 'Nshuti', 'nshuti@gmail.com', '', 'defender', 1, 'Nigeria', '1999-01-01');

--
-- Triggers `player`
--
DELIMITER $$
CREATE TRIGGER `AfterDeletePlayer` AFTER DELETE ON `player` FOR EACH ROW BEGIN
    
    UPDATE club SET total_players = total_players - 1 WHERE club_id = OLD.club_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterUpdateplayer` AFTER UPDATE ON `player` FOR EACH ROW BEGIN
    INSERT INTO player_audit (playeer_id, action, action_date)
    VALUES (NEW.playeer_id, 'UPDATE', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `player_audit`
--

CREATE TABLE `player_audit` (
  `id` int(11) NOT NULL,
  `playeer_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `action_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player_audit`
--

INSERT INTO `player_audit` (`id`, `playeer_id`, `action`, `action_date`) VALUES
(1, 1, 'UPDATE', '2024-02-16 08:12:33'),
(2, 1, 'UPDATE', '2024-02-17 22:46:36'),
(3, 1, 'UPDATE', '2024-02-17 22:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `studium_id` int(11) NOT NULL,
  `studium_name` varchar(30) NOT NULL,
  `capacity` int(11) NOT NULL,
  `club_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`studium_id`, `studium_name`, `capacity`, `club_id`) VALUES
(9, 'Kigali Pele Stadium', 15000, 1),
(10, 'Umuganda Stadium', 12000, 11),
(11, 'Huye Stadium', 7500, 10),
(12, 'UBWOROHERANE stadium Stadium', 9000, 6),
(13, 'Nyagatare Stadium', 8000, 9),
(14, 'Ngoma Stadium', 8000, 14),
(15, 'Bugesera Stadium', 8000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `User_id` int(11) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `Manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`User_id`, `last_name`, `first_name`, `email`, `password`, `contact`, `Manager_id`) VALUES
(16, 'jean', 'NSHUTI', 'john.smith@example.com', 'password12', '+250123432', 6),
(17, 'Johnson', 'KABERA', 'alice.johnson@example.com', 'securepass', '+250234437', 2),
(18, 'Williams', 'RUSANGANWA', 'robert.williams@example.com', 'secret123!', '+250346578', 3),
(19, 'Jones', 'RUBAYITA', 'emily.jones@example.com', 'mypassword', '+250456789', 4),
(20, 'Brown', 'MUREKATETE', 'michael.brown@example.com', 'adminpass@', '+250567896', 5),
(23, 'Niyonshuti', 'jean pierre', 'jeanpierreniyonshuti71@gmail.com', 'Jean@2020', '0786453', 6),
(24, 'niyonshuti', 'jean pierre', 'jeahfgh@gmail.com', '221334', '078654670', 2),
(25, 'NIYONSHUTI', 'Jean Pierre', 'jeanniyo@gmail.com', '$2y$10$Un7', '0786407569', 3),
(26, 'NIYONSHUTI', 'Jean Pierre', 'jeanniyo@gmail.com', '$2y$10$xvO', '0786407569', 3),
(27, 'NIYONSHUTI', 'Jean Pierre', 'jeanniyo@gmail.com', '$2y$10$V8o', '0786407569', 3),
(28, 'NIYONSHUTI', 'Jean Pierre', 'Jean@Pierre', '$2y$10$sDn', '0786407569', 3),
(30, 'NIYONSHUTI', 'Jean Pierre', 'ghhhhh@gmail.com', '$2y$10$.d8', '0786407569', 5);

-- --------------------------------------------------------

--
-- Structure for view `all_info`
--
DROP TABLE IF EXISTS `all_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_info`  AS SELECT `p`.`playeer_id` AS `playeer_id`, `p`.`first_name` AS `player_first_name`, `p`.`last_name` AS `player_last_name`, `p`.`position` AS `player_position`, `p`.`date_of_birth` AS `player_date_of_birth`, `c`.`coacher_id` AS `coacher_id`, `c`.`first_name` AS `coach_first_name`, `c`.`last_name` AS `coach_last_name`, `cl`.`club_id` AS `club_id`, `cl`.`name` AS `name`, `cl`.`stadium_name` AS `club_stadium_name` FROM ((`player` `p` left join `coacher` `c` on(`p`.`Club_id` = `c`.`club_id`)) left join `club` `cl` on(`p`.`Club_id` = `cl`.`club_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `clubupdate_view`
--
DROP TABLE IF EXISTS `clubupdate_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clubupdate_view`  AS SELECT `club`.`club_id` AS `club_id`, `club`.`name` AS `name`, `club`.`city` AS `city` FROM `club` WHERE `club`.`city` = 'Kigali\'Kigali''Kigali\'Kigali'  ;

-- --------------------------------------------------------

--
-- Structure for view `delete_view`
--
DROP TABLE IF EXISTS `delete_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `delete_view`  AS SELECT `bank`.`bank_id` AS `bank_id`, `bank`.`bank_name` AS `bank_name`, `bank`.`location` AS `location` FROM `bank` WHERE `bank`.`location` = 'Rubavu' union all select `stadium`.`studium_id` AS `studium_id`,`stadium`.`studium_name` AS `studium_name`,`stadium`.`capacity` AS `capacity` from `stadium` where `stadium`.`capacity` < 10000  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_clubview`
--
DROP TABLE IF EXISTS `insert_clubview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_clubview`  AS SELECT `club`.`club_id` AS `club_id`, `club`.`name` AS `name`, `club`.`city` AS `city`, `club`.`league` AS `league`, `club`.`stadium_name` AS `stadium_name` FROM `club` WHERE 1 = 00  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_coacherview`
--
DROP TABLE IF EXISTS `insert_coacherview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_coacherview`  AS SELECT `coacher`.`coacher_id` AS `coacher_id`, `coacher`.`last_name` AS `last_name`, `coacher`.`first_name` AS `first_name`, `coacher`.`nationality` AS `nationality`, `coacher`.`email` AS `email`, `coacher`.`contact` AS `contact`, `coacher`.`club_id` AS `club_id` FROM `coacher` WHERE `coacher`.`coacher_id` = 3333  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_funclubview`
--
DROP TABLE IF EXISTS `insert_funclubview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_funclubview`  AS SELECT `fun_club`.`funclub_id` AS `funclub_id`, `fun_club`.`name` AS `name`, `fun_club`.`description` AS `description`, `fun_club`.`contact` AS `contact`, `fun_club`.`website` AS `website`, `fun_club`.`club_id` AS `club_id` FROM `fun_club` WHERE `fun_club`.`funclub_id` = 2222  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_leagueview`
--
DROP TABLE IF EXISTS `insert_leagueview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_leagueview`  AS SELECT `league`.`league_id` AS `league_id`, `league`.`league_name` AS `league_name`, `league`.`country` AS `country`, `league`.`season` AS `season`, `league`.`start_date` AS `start_date`, `league`.`end_date` AS `end_date`, `league`.`number_club` AS `number_club` FROM `league` WHERE `league`.`league_id` = 4444  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_managerview`
--
DROP TABLE IF EXISTS `insert_managerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_managerview`  AS SELECT `manager`.`manager_id` AS `manager_id`, `manager`.`last_name` AS `last_name`, `manager`.`first_name` AS `first_name`, `manager`.`email` AS `email`, `manager`.`contact` AS `contact`, `manager`.`club_id` AS `club_id` FROM `manager` WHERE 1 = 5555  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_matchsview`
--
DROP TABLE IF EXISTS `insert_matchsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_matchsview`  AS SELECT `matchs`.`match_id` AS `match_id`, `matchs`.`match_date` AS `match_date`, `matchs`.`home_club` AS `home_club`, `matchs`.`away_club` AS `away_club`, `matchs`.`referee_names` AS `referee_names` FROM `matchs` WHERE `matchs`.`match_id` = 3333  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_playerview`
--
DROP TABLE IF EXISTS `insert_playerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_playerview`  AS SELECT `player`.`playeer_id` AS `playeer_id`, `player`.`last_name` AS `last_name`, `player`.`first_name` AS `first_name`, `player`.`email` AS `email`, `player`.`contact` AS `contact`, `player`.`position` AS `position`, `player`.`Club_id` AS `Club_id`, `player`.`country` AS `country`, `player`.`date_of_birth` AS `date_of_birth` FROM `player` WHERE `player`.`playeer_id` = 5555  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_stadiumview`
--
DROP TABLE IF EXISTS `insert_stadiumview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_stadiumview`  AS SELECT `stadium`.`studium_id` AS `studium_id`, `stadium`.`studium_name` AS `studium_name`, `stadium`.`capacity` AS `capacity`, `stadium`.`club_id` AS `club_id` FROM `stadium` WHERE `stadium`.`studium_id` = 2222  ;

-- --------------------------------------------------------

--
-- Structure for view `insert_user_adminview`
--
DROP TABLE IF EXISTS `insert_user_adminview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `insert_user_adminview`  AS SELECT `user_admin`.`User_id` AS `User_id`, `user_admin`.`last_name` AS `last_name`, `user_admin`.`first_name` AS `first_name`, `user_admin`.`email` AS `email`, `user_admin`.`password` AS `password`, `user_admin`.`contact` AS `contact`, `user_admin`.`Manager_id` AS `Manager_id` FROM `user_admin` WHERE `user_admin`.`User_id` = 5555  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`),
  ADD KEY `fk_bank_club` (`club_id`);

--
-- Indexes for table `bank_audit`
--
ALTER TABLE `bank_audit`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`),
  ADD KEY `fk_club_league` (`league_id`);

--
-- Indexes for table `club_audit`
--
ALTER TABLE `club_audit`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexes for table `coacher`
--
ALTER TABLE `coacher`
  ADD PRIMARY KEY (`coacher_id`),
  ADD KEY `fk_coacher_club` (`club_id`);

--
-- Indexes for table `fun_club`
--
ALTER TABLE `fun_club`
  ADD PRIMARY KEY (`funclub_id`),
  ADD KEY `fk_fun_club_clun` (`club_id`);

--
-- Indexes for table `league`
--
ALTER TABLE `league`
  ADD PRIMARY KEY (`league_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `fk_manager_club` (`club_id`);

--
-- Indexes for table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`match_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`playeer_id`),
  ADD KEY `fk_player_club` (`Club_id`);

--
-- Indexes for table `player_audit`
--
ALTER TABLE `player_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`studium_id`),
  ADD KEY `fk_stadium_club` (`club_id`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `fk_user_admin_manager` (`Manager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bank_audit`
--
ALTER TABLE `bank_audit`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `club_audit`
--
ALTER TABLE `club_audit`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `coacher`
--
ALTER TABLE `coacher`
  MODIFY `coacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `fun_club`
--
ALTER TABLE `fun_club`
  MODIFY `funclub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `league`
--
ALTER TABLE `league`
  MODIFY `league_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `playeer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `player_audit`
--
ALTER TABLE `player_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stadium`
--
ALTER TABLE `stadium`
  MODIFY `studium_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `fk_bank_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `club`
--
ALTER TABLE `club`
  ADD CONSTRAINT `fk_club_league` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`);

--
-- Constraints for table `coacher`
--
ALTER TABLE `coacher`
  ADD CONSTRAINT `fk_coacher_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `fun_club`
--
ALTER TABLE `fun_club`
  ADD CONSTRAINT `fk_fun_club_clun` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_manager_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `fk_player_club` FOREIGN KEY (`Club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `fk_stadium_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`);

--
-- Constraints for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD CONSTRAINT `fk_user_admin_manager` FOREIGN KEY (`Manager_id`) REFERENCES `manager` (`manager_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
