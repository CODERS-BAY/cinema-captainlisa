-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:43
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cinema`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `actor`
--

CREATE TABLE `actor` (
  `actor_id` int(11) NOT NULL,
  `cast_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `further_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cast_list`
--

CREATE TABLE `cast_list` (
  `cast_id` int(11) NOT NULL,
  `film_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cinema`
--

CREATE TABLE `cinema` (
  `cinema_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `cinema_name` varchar(20) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `number_of_halls` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `director`
--

CREATE TABLE `director` (
  `director_id` int(11) NOT NULL,
  `cast_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `further_comment` text DEFAULT NULL,
  `is_acting` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `cast_id` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL,
  `year_of_production` year(4) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `distribution` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hall`
--

CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `number_of_rows` int(11) DEFAULT NULL,
  `number_of_seats` int(11) DEFAULT NULL,
  `feature` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `row`
--

CREATE TABLE `row` (
  `row_nr` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `is_box` tinyint(1) DEFAULT NULL,
  `standard_price` double DEFAULT NULL,
  `special_price` double DEFAULT NULL,
  `number_of_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  `screening_date` date DEFAULT NULL,
  `starting_time` time DEFAULT NULL,
  `tickets_reserved` int(11) DEFAULT NULL,
  `tickets_purchased` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seating_plan`
--

CREATE TABLE `seating_plan` (
  `plan_id` int(11) NOT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `row_nr` int(11) DEFAULT NULL,
  `seat_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` varchar(20) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `cinema` varchar(20) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `screening_date` date DEFAULT NULL,
  `starting_time` time DEFAULT NULL,
  `row_nr` int(11) DEFAULT NULL,
  `seat` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`),
  ADD KEY `cast_id` (`cast_id`);

--
-- Indizes für die Tabelle `cast_list`
--
ALTER TABLE `cast_list`
  ADD PRIMARY KEY (`cast_id`);

--
-- Indizes für die Tabelle `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`cinema_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indizes für die Tabelle `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`director_id`),
  ADD KEY `cast_id` (`cast_id`);

--
-- Indizes für die Tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `cast_id` (`cast_id`);

--
-- Indizes für die Tabelle `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`hall_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indizes für die Tabelle `row`
--
ALTER TABLE `row`
  ADD PRIMARY KEY (`row_nr`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indizes für die Tabelle `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indizes für die Tabelle `seating_plan`
--
ALTER TABLE `seating_plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actor_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_list` (`cast_id`);

--
-- Constraints der Tabelle `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`);

--
-- Constraints der Tabelle `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_list` (`cast_id`);

--
-- Constraints der Tabelle `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`cast_id`) REFERENCES `cast_list` (`cast_id`);

--
-- Constraints der Tabelle `hall`
--
ALTER TABLE `hall`
  ADD CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `seating_plan` (`plan_id`),
  ADD CONSTRAINT `hall_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`);

--
-- Constraints der Tabelle `row`
--
ALTER TABLE `row`
  ADD CONSTRAINT `row_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `seating_plan` (`plan_id`);

--
-- Constraints der Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
