-- --------------------------------------------------------
-- Strežnik:                     127.0.0.1
-- Verzija strežnika:            10.2.9-MariaDB - mariadb.org binary distribution
-- Operacijski sistem strežnika: Win64
-- HeidiSQL Različica:           9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for tabela studis.predmet_izvajanje
DROP TABLE IF EXISTS `predmet_izvajanje`;
CREATE TABLE IF NOT EXISTS `predmet_izvajanje` (
  `nosilec1` int(11) DEFAULT NULL,
  `nosilec2` int(11) DEFAULT NULL,
  `nosilec3` int(11) DEFAULT NULL,
  `predmet` int(11) NOT NULL,
  `studijsko_leto` int(11) NOT NULL,
  PRIMARY KEY (`predmet`,`studijsko_leto`),
  KEY `FK_predmet_izvajanje_studijsko_leto` (`studijsko_leto`),
  KEY `FK_predmet_izvajanje_nosilec1` (`nosilec1`),
  KEY `FK_predmet_izvajanje_nosilec3` (`nosilec3`),
  KEY `FK_predmet_izvajanje_nosilec2` (`nosilec2`),
  CONSTRAINT `FK_predmet_izvajanje_nosilec1` FOREIGN KEY (`nosilec1`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_predmet_izvajanje_nosilec2` FOREIGN KEY (`nosilec2`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_predmet_izvajanje_nosilec3` FOREIGN KEY (`nosilec3`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_predmet_izvajanje_predmet` FOREIGN KEY (`predmet`) REFERENCES `predmet` (`sifra`),
  CONSTRAINT `FK_predmet_izvajanje_studijsko_leto` FOREIGN KEY (`studijsko_leto`) REFERENCES `studijsko_leto` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Dumping data for table studis.predmet_izvajanje: ~305 rows (približno)
/*!40000 ALTER TABLE `predmet_izvajanje` DISABLE KEYS */;
INSERT INTO `predmet_izvajanje` (`nosilec1`, `nosilec2`, `nosilec3`, `predmet`, `studijsko_leto`) VALUES
	(20, 43, 32, 63202, 2014),
	(20, 43, 32, 63202, 2015),
	(20, 43, NULL, 63202, 2016),
	(20, 43, NULL, 63202, 2017),
	(20, 43, 32, 63202, 2018),
	(15, NULL, NULL, 63203, 2014),
	(15, NULL, NULL, 63203, 2015),
	(15, NULL, NULL, 63203, 2016),
	(15, NULL, NULL, 63203, 2017),
	(15, NULL, NULL, 63203, 2018),
	(21, NULL, NULL, 63204, 2014),
	(21, NULL, NULL, 63204, 2015),
	(21, NULL, NULL, 63204, 2016),
	(21, NULL, NULL, 63204, 2017),
	(21, NULL, NULL, 63204, 2018),
	(22, NULL, NULL, 63205, 2014),
	(22, NULL, NULL, 63205, 2015),
	(22, NULL, NULL, 63205, 2016),
	(22, NULL, NULL, 63205, 2017),
	(22, NULL, NULL, 63205, 2018),
	(25, NULL, NULL, 63207, 2014),
	(25, NULL, NULL, 63207, 2015),
	(25, NULL, NULL, 63207, 2016),
	(25, NULL, NULL, 63207, 2017),
	(25, NULL, NULL, 63207, 2018),
	(6, NULL, NULL, 63208, 2014),
	(6, NULL, NULL, 63208, 2015),
	(6, NULL, NULL, 63208, 2016),
	(6, NULL, NULL, 63208, 2017),
	(6, NULL, NULL, 63208, 2018),
	(8, NULL, NULL, 63209, 2014),
	(8, NULL, NULL, 63209, 2015),
	(8, NULL, NULL, 63209, 2016),
	(8, NULL, NULL, 63209, 2017),
	(8, NULL, NULL, 63209, 2018),
	(26, NULL, NULL, 63212, 2014),
	(26, NULL, NULL, 63212, 2015),
	(26, NULL, NULL, 63212, 2016),
	(26, NULL, NULL, 63212, 2017),
	(26, NULL, NULL, 63212, 2018),
	(18, NULL, NULL, 63213, 2014),
	(18, NULL, NULL, 63213, 2015),
	(18, NULL, NULL, 63213, 2016),
	(18, NULL, NULL, 63213, 2017),
	(18, NULL, NULL, 63213, 2018),
	(8, NULL, NULL, 63214, 2014),
	(8, NULL, NULL, 63214, 2015),
	(8, NULL, NULL, 63214, 2016),
	(8, NULL, NULL, 63214, 2017),
	(8, NULL, NULL, 63214, 2018),
	(24, NULL, NULL, 63215, 2014),
	(24, NULL, NULL, 63215, 2015),
	(24, NULL, NULL, 63215, 2016),
	(24, NULL, NULL, 63215, 2017),
	(24, NULL, NULL, 63215, 2018),
	(29, NULL, NULL, 63216, 2014),
	(29, NULL, NULL, 63216, 2015),
	(29, NULL, NULL, 63216, 2016),
	(29, NULL, NULL, 63216, 2017),
	(29, NULL, NULL, 63216, 2018),
	(28, NULL, NULL, 63217, 2014),
	(28, NULL, NULL, 63217, 2015),
	(28, NULL, NULL, 63217, 2016),
	(28, NULL, NULL, 63217, 2017),
	(28, NULL, NULL, 63217, 2018),
	(10, NULL, NULL, 63218, 2014),
	(10, NULL, NULL, 63218, 2015),
	(10, NULL, NULL, 63218, 2016),
	(10, NULL, NULL, 63218, 2017),
	(10, NULL, NULL, 63218, 2018),
	(20, NULL, NULL, 63219, 2014),
	(20, NULL, NULL, 63219, 2015),
	(20, NULL, NULL, 63219, 2016),
	(20, NULL, NULL, 63219, 2017),
	(20, NULL, NULL, 63219, 2018),
	(7, NULL, NULL, 63220, 2014),
	(7, NULL, NULL, 63220, 2015),
	(7, NULL, NULL, 63220, 2016),
	(7, NULL, NULL, 63220, 2017),
	(7, NULL, NULL, 63220, 2018),
	(31, NULL, NULL, 63221, 2014),
	(31, NULL, NULL, 63221, 2015),
	(31, NULL, NULL, 63221, 2016),
	(31, NULL, NULL, 63221, 2017),
	(31, NULL, NULL, 63221, 2018),
	(11, NULL, NULL, 63222, 2014),
	(11, NULL, NULL, 63222, 2015),
	(11, NULL, NULL, 63222, 2016),
	(11, NULL, NULL, 63222, 2017),
	(11, NULL, NULL, 63222, 2018),
	(11, NULL, NULL, 63223, 2014),
	(11, NULL, NULL, 63223, 2015),
	(11, NULL, NULL, 63223, 2016),
	(11, NULL, NULL, 63223, 2017),
	(11, NULL, NULL, 63223, 2018),
	(11, NULL, NULL, 63224, 2014),
	(11, NULL, NULL, 63224, 2015),
	(11, NULL, NULL, 63224, 2016),
	(11, NULL, NULL, 63224, 2017),
	(11, NULL, NULL, 63224, 2018),
	(29, NULL, NULL, 63225, 2014),
	(12, NULL, NULL, 63225, 2015),
	(22, NULL, NULL, 63225, 2016),
	(25, NULL, NULL, 63225, 2017),
	(22, NULL, NULL, 63225, 2018),
	(34, NULL, NULL, 63226, 2014),
	(34, NULL, NULL, 63226, 2015),
	(34, NULL, NULL, 63226, 2016),
	(34, NULL, NULL, 63226, 2017),
	(34, NULL, NULL, 63226, 2018),
	(41, NULL, NULL, 63241, 2014),
	(41, NULL, NULL, 63241, 2015),
	(41, NULL, NULL, 63241, 2016),
	(41, NULL, NULL, 63241, 2017),
	(41, NULL, NULL, 63241, 2018),
	(15, NULL, NULL, 63242, 2014),
	(15, NULL, NULL, 63242, 2015),
	(15, NULL, NULL, 63242, 2016),
	(15, NULL, NULL, 63242, 2017),
	(15, NULL, NULL, 63242, 2018),
	(14, NULL, NULL, 63248, 2014),
	(14, NULL, NULL, 63248, 2015),
	(14, NULL, NULL, 63248, 2016),
	(14, NULL, NULL, 63248, 2017),
	(14, NULL, NULL, 63248, 2018),
	(32, NULL, NULL, 63249, 2014),
	(32, NULL, NULL, 63249, 2015),
	(32, NULL, NULL, 63249, 2016),
	(32, NULL, NULL, 63249, 2017),
	(32, NULL, NULL, 63249, 2018),
	(16, NULL, NULL, 63250, 2014),
	(16, NULL, NULL, 63250, 2015),
	(16, NULL, NULL, 63250, 2016),
	(16, NULL, NULL, 63250, 2017),
	(16, NULL, NULL, 63250, 2018),
	(33, NULL, NULL, 63251, 2014),
	(33, NULL, NULL, 63251, 2015),
	(33, NULL, NULL, 63251, 2016),
	(33, NULL, NULL, 63251, 2017),
	(33, NULL, NULL, 63251, 2018),
	(6, NULL, NULL, 63252, 2014),
	(6, NULL, NULL, 63252, 2015),
	(6, NULL, NULL, 63252, 2016),
	(6, NULL, NULL, 63252, 2017),
	(6, NULL, NULL, 63252, 2018),
	(35, NULL, NULL, 63253, 2014),
	(35, NULL, NULL, 63253, 2015),
	(35, NULL, NULL, 63253, 2016),
	(35, NULL, NULL, 63253, 2017),
	(35, NULL, NULL, 63253, 2018),
	(17, NULL, NULL, 63254, 2014),
	(17, NULL, NULL, 63254, 2015),
	(17, NULL, NULL, 63254, 2016),
	(17, NULL, NULL, 63254, 2017),
	(17, NULL, NULL, 63254, 2018),
	(24, NULL, NULL, 63255, 2014),
	(24, NULL, NULL, 63255, 2015),
	(24, NULL, NULL, 63255, 2016),
	(24, NULL, NULL, 63255, 2017),
	(24, NULL, NULL, 63255, 2018),
	(19, NULL, NULL, 63256, 2014),
	(19, NULL, NULL, 63256, 2015),
	(19, NULL, NULL, 63256, 2016),
	(19, NULL, NULL, 63256, 2017),
	(19, NULL, NULL, 63256, 2018),
	(36, NULL, NULL, 63257, 2014),
	(36, NULL, NULL, 63257, 2015),
	(36, NULL, NULL, 63257, 2016),
	(36, NULL, NULL, 63257, 2017),
	(36, NULL, NULL, 63257, 2018),
	(12, NULL, NULL, 63258, 2014),
	(12, NULL, NULL, 63258, 2015),
	(12, NULL, NULL, 63258, 2016),
	(12, NULL, NULL, 63258, 2017),
	(12, NULL, NULL, 63258, 2018),
	(21, NULL, NULL, 63259, 2014),
	(21, NULL, NULL, 63259, 2015),
	(21, NULL, NULL, 63259, 2016),
	(21, NULL, NULL, 63259, 2017),
	(21, NULL, NULL, 63259, 2018),
	(10, NULL, NULL, 63260, 2014),
	(10, NULL, NULL, 63260, 2015),
	(10, NULL, NULL, 63260, 2016),
	(10, NULL, NULL, 63260, 2017),
	(10, NULL, NULL, 63260, 2018),
	(29, NULL, NULL, 63261, 2014),
	(29, NULL, NULL, 63261, 2015),
	(29, NULL, NULL, 63261, 2016),
	(29, NULL, NULL, 63261, 2017),
	(29, NULL, NULL, 63261, 2018),
	(36, NULL, NULL, 63262, 2014),
	(36, NULL, NULL, 63262, 2015),
	(36, NULL, NULL, 63262, 2016),
	(36, NULL, NULL, 63262, 2017),
	(36, NULL, NULL, 63262, 2018),
	(37, NULL, NULL, 63263, 2014),
	(37, NULL, NULL, 63263, 2015),
	(37, NULL, NULL, 63263, 2016),
	(37, NULL, NULL, 63263, 2017),
	(37, NULL, NULL, 63263, 2018),
	(13, NULL, NULL, 63264, 2014),
	(13, NULL, NULL, 63264, 2015),
	(13, NULL, NULL, 63264, 2016),
	(13, NULL, NULL, 63264, 2017),
	(13, NULL, NULL, 63264, 2018),
	(23, NULL, NULL, 63265, 2014),
	(23, NULL, NULL, 63265, 2015),
	(23, NULL, NULL, 63265, 2016),
	(23, NULL, NULL, 63265, 2017),
	(23, NULL, NULL, 63265, 2018),
	(27, NULL, NULL, 63266, 2014),
	(27, NULL, NULL, 63266, 2015),
	(27, NULL, NULL, 63266, 2016),
	(27, NULL, NULL, 63266, 2017),
	(27, NULL, NULL, 63266, 2018),
	(38, NULL, NULL, 63267, 2014),
	(38, NULL, NULL, 63267, 2015),
	(38, NULL, NULL, 63267, 2016),
	(38, NULL, NULL, 63267, 2017),
	(38, NULL, NULL, 63267, 2018),
	(39, NULL, NULL, 63268, 2014),
	(39, NULL, NULL, 63268, 2015),
	(39, NULL, NULL, 63268, 2016),
	(39, NULL, NULL, 63268, 2017),
	(39, NULL, NULL, 63268, 2018),
	(40, 43, NULL, 63269, 2014),
	(40, 43, NULL, 63269, 2015),
	(40, NULL, NULL, 63269, 2016),
	(40, 43, NULL, 63269, 2017),
	(40, 43, NULL, 63269, 2018),
	(38, NULL, NULL, 63270, 2014),
	(38, NULL, NULL, 63270, 2015),
	(38, NULL, NULL, 63270, 2016),
	(38, NULL, NULL, 63270, 2017),
	(38, NULL, NULL, 63270, 2018),
	(9, NULL, NULL, 63271, 2014),
	(9, NULL, NULL, 63271, 2015),
	(9, NULL, NULL, 63271, 2016),
	(9, NULL, NULL, 63271, 2017),
	(9, NULL, NULL, 63271, 2018),
	(19, NULL, NULL, 63277, 2014),
	(19, NULL, NULL, 63277, 2015),
	(19, NULL, NULL, 63277, 2016),
	(19, NULL, NULL, 63277, 2017),
	(19, NULL, NULL, 63277, 2018),
	(23, NULL, NULL, 63278, 2014),
	(23, NULL, NULL, 63278, 2015),
	(23, NULL, NULL, 63278, 2016),
	(23, NULL, NULL, 63278, 2017),
	(23, NULL, NULL, 63278, 2018),
	(27, NULL, NULL, 63279, 2014),
	(27, NULL, NULL, 63279, 2015),
	(27, NULL, NULL, 63279, 2016),
	(27, NULL, NULL, 63279, 2017),
	(27, NULL, NULL, 63279, 2018),
	(28, NULL, NULL, 63280, 2014),
	(28, NULL, NULL, 63280, 2015),
	(28, NULL, NULL, 63280, 2016),
	(28, NULL, NULL, 63280, 2017),
	(28, NULL, NULL, 63280, 2018),
	(30, NULL, NULL, 63281, 2014),
	(30, NULL, NULL, 63281, 2015),
	(30, NULL, NULL, 63281, 2016),
	(30, NULL, NULL, 63281, 2017),
	(30, NULL, NULL, 63281, 2018),
	(28, NULL, NULL, 63283, 2014),
	(28, NULL, NULL, 63283, 2015),
	(28, NULL, NULL, 63283, 2016),
	(28, NULL, NULL, 63283, 2017),
	(28, NULL, NULL, 63283, 2018),
	(27, NULL, NULL, 63284, 2014),
	(27, NULL, NULL, 63284, 2015),
	(22, NULL, NULL, 63284, 2016),
	(27, NULL, NULL, 63284, 2017),
	(27, NULL, NULL, 63284, 2018),
	(8, NULL, NULL, 63287, 2014),
	(8, NULL, NULL, 63287, 2015),
	(8, NULL, NULL, 63287, 2016),
	(8, NULL, NULL, 63287, 2017),
	(8, NULL, NULL, 63287, 2018),
	(39, NULL, NULL, 63701, 2014),
	(39, NULL, NULL, 63701, 2015),
	(39, NULL, NULL, 63701, 2018),
	(41, NULL, NULL, 63702, 2014),
	(41, NULL, NULL, 63702, 2015),
	(41, NULL, NULL, 63702, 2018),
	(42, NULL, NULL, 63703, 2014),
	(42, NULL, NULL, 63703, 2015),
	(42, NULL, NULL, 63703, 2018),
	(43, NULL, NULL, 63704, 2014),
	(43, NULL, NULL, 63704, 2015),
	(43, NULL, NULL, 63704, 2018),
	(15, NULL, NULL, 63705, 2014),
	(15, NULL, NULL, 63705, 2015),
	(15, NULL, NULL, 63705, 2018),
	(13, NULL, NULL, 63706, 2014),
	(13, NULL, NULL, 63706, 2015),
	(13, NULL, NULL, 63706, 2018),
	(34, NULL, NULL, 63707, 2014),
	(34, NULL, NULL, 63707, 2015),
	(34, NULL, NULL, 63707, 2018),
	(12, NULL, NULL, 63708, 2014),
	(12, NULL, NULL, 63708, 2015),
	(12, NULL, NULL, 63708, 2018),
	(44, NULL, NULL, 63709, 2014),
	(44, NULL, NULL, 63709, 2015),
	(44, NULL, NULL, 63709, 2018),
	(18, NULL, NULL, 63710, 2014),
	(18, NULL, NULL, 63710, 2015),
	(18, NULL, NULL, 63710, 2018);
/*!40000 ALTER TABLE `predmet_izvajanje` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
