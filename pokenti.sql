-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2021 at 04:29 PM
-- Server version: 10.1.45-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pokenti`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `howItFeelsToCew5Gum` (IN `id` INT)  BEGIN
    INSERT INTO slots (hp)
    SELECT hp
    FROM pokemons
    WHERE pokemons.name=slots.name AND id_slot = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `slotToStorage` (IN `id` INT)  BEGIN
INSERT INTO storages (name, img, cry, hp, lvl)
SELECT name, img, cry, hp, lvl
FROM slots
WHERE id_slot = id;
DELETE FROM slots
WHERE id_slot = id;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `storageToSlot` (IN `id` INT)  BEGIN
INSERT INTO slots (name, img, cry, hp, lvl)
SELECT name, img, cry, hp, lvl
FROM storages
WHERE id_storage = id;
DELETE FROM storages
WHERE id_storage=id;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `evolutions`
--

CREATE TABLE `evolutions` (
  `id_evolution` int(10) UNSIGNED NOT NULL,
  `evo_stage` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokemons`
--

CREATE TABLE `pokemons` (
  `id_pokemon` int(10) UNSIGNED NOT NULL,
  `name` varchar(16) NOT NULL,
  `img` varchar(24) NOT NULL,
  `cry` varchar(24) NOT NULL,
  `hp` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pokemons`
--

INSERT INTO `pokemons` (`id_pokemon`, `name`, `img`, `cry`, `hp`, `level`) VALUES
(1, 'Streamoid', 'strmd', 'scrii', 10, 1),
(2, 'Riverant', 'rvrnt', 'scree', 50, 15),
(3, 'Torrentoid', 'trrntd', 'scraa', 100, 23),
(4, 'Charmonk', 'chrmnk', 'interimus', 5, 2),
(5, 'Charmage', 'chrmg', 'agapare', 20, 10),
(6, 'Charwizard', 'chrwzrd', 'dorime', 50, 18),
(7, 'Hojarion', 'hjrn', 'aueu', 15, 3),
(8, 'Paloid', 'pld', 'euau', 75, 17),
(9, 'Arboltron', 'arbltrn', 'uuuu', 200, 28),
(10, 'Pagafantor', 'pgfntr', 'jhonmadden', 80, 18),
(11, 'Vegeman', 'vgmn', 'mamamiapapapia', 60, 11),
(12, 'Edgeotto', 'dgtt', 'yapitop', 90, 26),
(13, 'Pichaku', 'pchk', 'tortilla', 120, 29),
(14, 'Snek', 'snk', 'keptyouwaitinghuh', 140, 26),
(15, 'Krobopop', 'krbpp', 'mikewashere', 125, 25),
(16, 'Ultramon', 'ltrmn', 'aeiou', 500, 30);

-- --------------------------------------------------------

--
-- Table structure for table `pokemons_evolutions`
--

CREATE TABLE `pokemons_evolutions` (
  `id_pokemon_evolution` int(10) UNSIGNED NOT NULL,
  `id_pokemon` int(10) UNSIGNED NOT NULL,
  `id_evolution` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokemons_slots`
--

CREATE TABLE `pokemons_slots` (
  `id_pokemon_slot` int(10) UNSIGNED NOT NULL,
  `id_pokemon` int(10) UNSIGNED NOT NULL,
  `id_slot` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokemons_storages`
--

CREATE TABLE `pokemons_storages` (
  `id_pokemon_evolution` int(10) UNSIGNED NOT NULL,
  `id_pokemon` int(10) UNSIGNED NOT NULL,
  `id_storage` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokemons_types`
--

CREATE TABLE `pokemons_types` (
  `id_pokemon_type` int(10) UNSIGNED NOT NULL,
  `id_pokemon` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `id_slot` int(10) UNSIGNED NOT NULL,
  `name` varchar(16) NOT NULL,
  `img` varchar(24) NOT NULL,
  `cry` varchar(24) NOT NULL,
  `hp` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id_storage` int(10) UNSIGNED NOT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(16) NOT NULL,
  `img` varchar(24) NOT NULL,
  `cry` varchar(24) NOT NULL,
  `hp` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id_type` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id_type`, `type`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `evolutions`
--
ALTER TABLE `evolutions`
  ADD PRIMARY KEY (`id_evolution`);

--
-- Indexes for table `pokemons`
--
ALTER TABLE `pokemons`
  ADD PRIMARY KEY (`id_pokemon`);

--
-- Indexes for table `pokemons_evolutions`
--
ALTER TABLE `pokemons_evolutions`
  ADD PRIMARY KEY (`id_pokemon_evolution`),
  ADD KEY `id_pokemon` (`id_pokemon`),
  ADD KEY `id_evolution` (`id_evolution`);

--
-- Indexes for table `pokemons_slots`
--
ALTER TABLE `pokemons_slots`
  ADD PRIMARY KEY (`id_pokemon_slot`),
  ADD KEY `id_pokemon` (`id_pokemon`),
  ADD KEY `id_slot` (`id_slot`);

--
-- Indexes for table `pokemons_storages`
--
ALTER TABLE `pokemons_storages`
  ADD PRIMARY KEY (`id_pokemon_evolution`),
  ADD KEY `id_pokemon` (`id_pokemon`),
  ADD KEY `id_storage` (`id_storage`);

--
-- Indexes for table `pokemons_types`
--
ALTER TABLE `pokemons_types`
  ADD PRIMARY KEY (`id_pokemon_type`),
  ADD KEY `id_pokemon` (`id_pokemon`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id_slot`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id_storage`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evolutions`
--
ALTER TABLE `evolutions`
  MODIFY `id_evolution` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokemons`
--
ALTER TABLE `pokemons`
  MODIFY `id_pokemon` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pokemons_evolutions`
--
ALTER TABLE `pokemons_evolutions`
  MODIFY `id_pokemon_evolution` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokemons_slots`
--
ALTER TABLE `pokemons_slots`
  MODIFY `id_pokemon_slot` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokemons_storages`
--
ALTER TABLE `pokemons_storages`
  MODIFY `id_pokemon_evolution` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokemons_types`
--
ALTER TABLE `pokemons_types`
  MODIFY `id_pokemon_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slots`
--
ALTER TABLE `slots`
  MODIFY `id_slot` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id_storage` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemons_evolutions`
--
ALTER TABLE `pokemons_evolutions`
  ADD CONSTRAINT `pokemons_evolutions_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  ADD CONSTRAINT `pokemons_evolutions_ibfk_2` FOREIGN KEY (`id_evolution`) REFERENCES `evolutions` (`id_evolution`);

--
-- Constraints for table `pokemons_slots`
--
ALTER TABLE `pokemons_slots`
  ADD CONSTRAINT `pokemons_slots_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  ADD CONSTRAINT `pokemons_slots_ibfk_2` FOREIGN KEY (`id_slot`) REFERENCES `slots` (`id_slot`) ON DELETE CASCADE;

--
-- Constraints for table `pokemons_storages`
--
ALTER TABLE `pokemons_storages`
  ADD CONSTRAINT `pokemons_storages_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  ADD CONSTRAINT `pokemons_storages_ibfk_2` FOREIGN KEY (`id_storage`) REFERENCES `storages` (`id_storage`);

--
-- Constraints for table `pokemons_types`
--
ALTER TABLE `pokemons_types`
  ADD CONSTRAINT `pokemons_types_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  ADD CONSTRAINT `pokemons_types_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
