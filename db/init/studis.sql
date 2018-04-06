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

DROP USER IF EXISTS 'studis'@'localhost';

CREATE USER 'studis'@'localhost' IDENTIFIED BY 'studisIS';
GRANT EXECUTE, SELECT, ALTER, CREATE, DELETE, INSERT, REFERENCES, UPDATE, DROP, INDEX ON *.* TO 'studis'@'localhost';

-- Dumping database structure for studis
DROP DATABASE IF EXISTS `studis`;
CREATE DATABASE IF NOT EXISTS `studis` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_slovenian_ci */;
USE `studis`;

-- Dumping structure for tabela studis.del_predmetnika
DROP TABLE IF EXISTS `del_predmetnika`;
CREATE TABLE IF NOT EXISTS `del_predmetnika` (
  `sifra` int(11) NOT NULL,
  `tip` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.drzava
DROP TABLE IF EXISTS `drzava`;
CREATE TABLE IF NOT EXISTS `drzava` (
  `iso_koda` varchar(2) COLLATE utf8_slovenian_ci NOT NULL,
  `iso_naziv` varchar(255) COLLATE utf8_slovenian_ci NOT NULL,
  `numericna_oznaka` int(11) NOT NULL,
  `opombe` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `slovenski_naziv` varchar(255) COLLATE utf8_slovenian_ci NOT NULL,
  `iso_3_koda` varchar(3) COLLATE utf8_slovenian_ci NOT NULL,
  PRIMARY KEY (`iso_koda`),
  UNIQUE KEY `iso_3_koda` (`iso_3_koda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.kandidat
DROP TABLE IF EXISTS `kandidat`;
CREATE TABLE IF NOT EXISTS `kandidat` (
  `id_uporabnik` int(11) NOT NULL,
  `geslo_plain` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `izkoriscen` tinyint(1) DEFAULT 0,
  `vpisna_stevilka` int(11) DEFAULT NULL,
  `studijski_program` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uporabnik`),
  KEY `FK_kandidat_studijski_program` (`studijski_program`),
  CONSTRAINT `FK_kandidat_id_uporabnik` FOREIGN KEY (`id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_kandidat_studijski_program` FOREIGN KEY (`studijski_program`) REFERENCES `studijski_program` (`sifra_evs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.klasius
DROP TABLE IF EXISTS `klasius`;
CREATE TABLE IF NOT EXISTS `klasius` (
  `sifra` int(11) NOT NULL,
  `opis` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `raven_izobrazbe` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `strokovni_naslov` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.letnik
DROP TABLE IF EXISTS `letnik`;
CREATE TABLE IF NOT EXISTS `letnik` (
  `letnik` int(11) NOT NULL,
  PRIMARY KEY (`letnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.nacin_studija
DROP TABLE IF EXISTS `nacin_studija`;
CREATE TABLE IF NOT EXISTS `nacin_studija` (
  `sifra` int(11) NOT NULL,
  `opis` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `opis_ang` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.obcina
DROP TABLE IF EXISTS `obcina`;
CREATE TABLE IF NOT EXISTS `obcina` (
  `sifra` int(11) NOT NULL,
  `ime` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.oblika_studija
DROP TABLE IF EXISTS `oblika_studija`;
CREATE TABLE IF NOT EXISTS `oblika_studija` (
  `sifra` int(11) NOT NULL,
  `opis` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `opis_ang` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.posta
DROP TABLE IF EXISTS `posta`;
CREATE TABLE IF NOT EXISTS `posta` (
  `postna_stevilka` int(11) NOT NULL,
  `naziv_poste` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`postna_stevilka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.predmet
DROP TABLE IF EXISTS `predmet`;
CREATE TABLE IF NOT EXISTS `predmet` (
  `sifra` int(11) NOT NULL,
  `ects` int(11) DEFAULT NULL,
  `naziv` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.predmetnik
DROP TABLE IF EXISTS `predmetnik`;
CREATE TABLE IF NOT EXISTS `predmetnik` (
  `LETNIK` int(11) NOT NULL,
  `STUDIJSKOLETO` int(11) NOT NULL,
  `PREDMET` int(11) NOT NULL,
  `STUDIJSKIPROGRAM` int(11) NOT NULL,
  `DELPREDMETNIKA` int(11) NOT NULL,
  PRIMARY KEY (`LETNIK`,`STUDIJSKOLETO`,`PREDMET`,`STUDIJSKIPROGRAM`,`DELPREDMETNIKA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.referent
DROP TABLE IF EXISTS `referent`;
CREATE TABLE IF NOT EXISTS `referent` (
  `id_uporabnik` int(11) NOT NULL,
  PRIMARY KEY (`id_uporabnik`),
  CONSTRAINT `FK_referent_id_uporabnik` FOREIGN KEY (`id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.sequence
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.skrbnik
DROP TABLE IF EXISTS `skrbnik`;
CREATE TABLE IF NOT EXISTS `skrbnik` (
  `id_uporabnik` int(11) NOT NULL,
  PRIMARY KEY (`id_uporabnik`),
  CONSTRAINT `FK_skrbnik_id_uporabnik` FOREIGN KEY (`id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id_uporabnik` int(11) NOT NULL,
  `datum_rojstva` date DEFAULT NULL,
  `drzava_rojstva` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `kraj_rojstva` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `naslov_stalno` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `naslov_zacasno` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `obcina_rojstva` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `spol` int(11) DEFAULT NULL,
  `tel_stevilka` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `vpisna_stevilka` int(11) DEFAULT NULL,
  `drzava_stalno` varchar(2) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `drzava_zacasno` varchar(2) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `obcina_stalno` int(11) DEFAULT NULL,
  `obcina_zacasno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uporabnik`),
  KEY `FK_student_drzava_zacasno` (`drzava_zacasno`),
  KEY `FK_student_obcina_stalno` (`obcina_stalno`),
  KEY `FK_student_obcina_zacasno` (`obcina_zacasno`),
  KEY `FK_student_drzava_stalno` (`drzava_stalno`),
  CONSTRAINT `FK_student_drzava_stalno` FOREIGN KEY (`drzava_stalno`) REFERENCES `drzava` (`iso_koda`),
  CONSTRAINT `FK_student_drzava_zacasno` FOREIGN KEY (`drzava_zacasno`) REFERENCES `drzava` (`iso_koda`),
  CONSTRAINT `FK_student_id_uporabnik` FOREIGN KEY (`id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_student_obcina_stalno` FOREIGN KEY (`obcina_stalno`) REFERENCES `obcina` (`sifra`),
  CONSTRAINT `FK_student_obcina_zacasno` FOREIGN KEY (`obcina_zacasno`) REFERENCES `obcina` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.student_vpis
DROP TABLE IF EXISTS `student_vpis`;
CREATE TABLE IF NOT EXISTS `student_vpis` (
  `Student_id_uporabnik` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `studijsko_leto` int(11) NOT NULL,
  PRIMARY KEY (`Student_id_uporabnik`,`student`,`studijsko_leto`),
  KEY `FK_student_vpis_student` (`student`,`studijsko_leto`),
  CONSTRAINT `FK_student_vpis_Student_id_uporabnik` FOREIGN KEY (`Student_id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_student_vpis_student` FOREIGN KEY (`student`, `studijsko_leto`) REFERENCES `vpis` (`student`, `studijsko_leto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.studijski_program
DROP TABLE IF EXISTS `studijski_program`;
CREATE TABLE IF NOT EXISTS `studijski_program` (
  `sifra_evs` int(11) NOT NULL,
  `naziv` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `sifra` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `stevilo_semestrov` int(11) DEFAULT NULL,
  `stopnja` int(11) DEFAULT NULL,
  `klasius` int(11) DEFAULT NULL,
  PRIMARY KEY (`sifra_evs`),
  KEY `FK_studijski_program_klasius` (`klasius`),
  CONSTRAINT `FK_studijski_program_klasius` FOREIGN KEY (`klasius`) REFERENCES `klasius` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.studijsko_leto
DROP TABLE IF EXISTS `studijsko_leto`;
CREATE TABLE IF NOT EXISTS `studijsko_leto` (
  `sifra` int(11) NOT NULL AUTO_INCREMENT,
  `studijsko_leto` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.ucitelj
DROP TABLE IF EXISTS `ucitelj`;
CREATE TABLE IF NOT EXISTS `ucitelj` (
  `id_uporabnik` int(11) NOT NULL,
  PRIMARY KEY (`id_uporabnik`),
  CONSTRAINT `FK_ucitelj_id_uporabnik` FOREIGN KEY (`id_uporabnik`) REFERENCES `uporabnik` (`id_uporabnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.uporabnik
DROP TABLE IF EXISTS `uporabnik`;
CREATE TABLE IF NOT EXISTS `uporabnik` (
  `id_uporabnik` int(11) NOT NULL AUTO_INCREMENT,
  `tip` varchar(31) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `davcna_stevilka` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_slovenian_ci NOT NULL,
  `emso` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `geslo` varchar(255) COLLATE utf8_slovenian_ci NOT NULL,
  `ime` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `priimek` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `spremenjeno` datetime DEFAULT NULL,
  `uporabnisko_ime` varchar(255) COLLATE utf8_slovenian_ci NOT NULL,
  `ustvarjeno` datetime DEFAULT NULL,
  `zadnja_prijava` datetime DEFAULT NULL,
  PRIMARY KEY (`id_uporabnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.vpis
DROP TABLE IF EXISTS `vpis`;
CREATE TABLE IF NOT EXISTS `vpis` (
  `letnik` int(11) DEFAULT NULL,
  `nacin_studija` int(11) DEFAULT NULL,
  `oblika_studija` int(11) DEFAULT NULL,
  `student` int(11) NOT NULL,
  `studijski_program` int(11) DEFAULT NULL,
  `studijsko_leto` int(11) NOT NULL,
  `vrsta_vpisa` int(11) NOT NULL,
  PRIMARY KEY (`student`,`studijsko_leto`),
  KEY `FK_vpis_oblika_studija` (`oblika_studija`),
  KEY `FK_vpis_vrsta_vpisa` (`vrsta_vpisa`),
  KEY `FK_vpis_nacin_studija` (`nacin_studija`),
  KEY `FK_vpis_letnik` (`letnik`),
  KEY `FK_vpis_studijsko_leto` (`studijsko_leto`),
  KEY `FK_vpis_studijski_program` (`studijski_program`),
  CONSTRAINT `FK_vpis_letnik` FOREIGN KEY (`letnik`) REFERENCES `letnik` (`letnik`),
  CONSTRAINT `FK_vpis_nacin_studija` FOREIGN KEY (`nacin_studija`) REFERENCES `nacin_studija` (`sifra`),
  CONSTRAINT `FK_vpis_oblika_studija` FOREIGN KEY (`oblika_studija`) REFERENCES `oblika_studija` (`sifra`),
  CONSTRAINT `FK_vpis_student` FOREIGN KEY (`student`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_vpis_studijski_program` FOREIGN KEY (`studijski_program`) REFERENCES `studijski_program` (`sifra_evs`),
  CONSTRAINT `FK_vpis_studijsko_leto` FOREIGN KEY (`studijsko_leto`) REFERENCES `studijsko_leto` (`sifra`),
  CONSTRAINT `FK_vpis_vrsta_vpisa` FOREIGN KEY (`vrsta_vpisa`) REFERENCES `vrsta_vpisa` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.vrsta_vpisa
DROP TABLE IF EXISTS `vrsta_vpisa`;
CREATE TABLE IF NOT EXISTS `vrsta_vpisa` (
  `sifra` int(11) NOT NULL,
  `vrsta_vpisa` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  PRIMARY KEY (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
-- Dumping structure for tabela studis.zeton
DROP TABLE IF EXISTS `zeton`;
CREATE TABLE IF NOT EXISTS `zeton` (
  `izkoriscen` tinyint(1) DEFAULT 0,
  `prosta_izbira` tinyint(1) DEFAULT 0,
  `letnik` int(11) DEFAULT NULL,
  `nacin_studija` int(11) DEFAULT NULL,
  `oblika_studija` int(11) DEFAULT NULL,
  `student` int(11) NOT NULL,
  `studijski_program` int(11) DEFAULT NULL,
  `studijsko_leto` int(11) DEFAULT NULL,
  `vrsta_vpisa` int(11) NOT NULL,
  PRIMARY KEY (`student`,`vrsta_vpisa`),
  KEY `FK_zeton_studijsko_leto` (`studijsko_leto`),
  KEY `FK_zeton_nacin_studija` (`nacin_studija`),
  KEY `FK_zeton_letnik` (`letnik`),
  KEY `FK_zeton_studijski_program` (`studijski_program`),
  KEY `FK_zeton_oblika_studija` (`oblika_studija`),
  KEY `FK_zeton_vrsta_vpisa` (`vrsta_vpisa`),
  CONSTRAINT `FK_zeton_letnik` FOREIGN KEY (`letnik`) REFERENCES `letnik` (`letnik`),
  CONSTRAINT `FK_zeton_nacin_studija` FOREIGN KEY (`nacin_studija`) REFERENCES `nacin_studija` (`sifra`),
  CONSTRAINT `FK_zeton_oblika_studija` FOREIGN KEY (`oblika_studija`) REFERENCES `oblika_studija` (`sifra`),
  CONSTRAINT `FK_zeton_student` FOREIGN KEY (`student`) REFERENCES `uporabnik` (`id_uporabnik`),
  CONSTRAINT `FK_zeton_studijski_program` FOREIGN KEY (`studijski_program`) REFERENCES `studijski_program` (`sifra_evs`),
  CONSTRAINT `FK_zeton_studijsko_leto` FOREIGN KEY (`studijsko_leto`) REFERENCES `studijsko_leto` (`sifra`),
  CONSTRAINT `FK_zeton_vrsta_vpisa` FOREIGN KEY (`vrsta_vpisa`) REFERENCES `vrsta_vpisa` (`sifra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
