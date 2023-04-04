-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for joveska
CREATE DATABASE IF NOT EXISTS `joveska` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `joveska`;

-- Dumping structure for table joveska.doctors
CREATE TABLE IF NOT EXISTS `doctors` (
  `doctor_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `age` smallint(5) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `specialization` varchar(50) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.doctors: ~17 rows (approximately)
INSERT INTO `doctors` (`doctor_id`, `full_name`, `age`, `gender`, `specialization`) VALUES
	(1, 'Marija Stevanandzija', 38, 'f', 'Allergy and Immunology'),
	(2, 'Monika Graseska', 45, 'f', 'Anesthesiology'),
	(3, 'Boris Georgiev', 58, 'm', 'Dermatology'),
	(4, 'Vasil Todoroski', 47, 'm', 'Diagnostic radiology'),
	(5, 'Vesela Andreevska', 40, 'f', 'Emergency medicine'),
	(6, 'Maja Naumoska', 34, 'f', 'Family medicine'),
	(7, 'Lidija Atanasovska', 44, 'f', 'Internal medicine'),
	(8, 'Robert Aritonov', 41, 'm', 'Medical genetics'),
	(9, 'Bojan Vasileski', 33, 'm', 'Neurology'),
	(10, 'Acka Tuseska', 49, 'f', 'Psychiatry'),
	(11, 'Daniel Avramoski', 47, 'm', 'Obstetrics and gynecology'),
	(12, 'Menche Toskovska', 32, 'f', 'Ophthalmology'),
	(13, 'Dragan Temovski', 36, 'm', 'Pathology'),
	(14, 'Hristijan Risteski', 31, 'm', 'Pediatrics'),
	(15, 'Brankica Rizoska', 48, 'f', 'Physical medicine and rehabilitation'),
	(16, 'Monika Bozoska', 56, 'f', 'Preventive medicine'),
	(17, 'Tara Kyne', 35, 'f', 'Radiation oncology'),
	(18, 'Sote Apostolovski', 51, 'm', 'Surgery'),
	(19, 'Damir Kotevski', 40, 'm', 'Urology'),
	(20, 'Tiho Trajcevski', 58, 'm', 'Nuclear medicine');

-- Dumping structure for table joveska.laboratory
CREATE TABLE IF NOT EXISTS `laboratory` (
  `lab_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `lab_test` varchar(100) NOT NULL,
  `patients_id` smallint(5) unsigned NOT NULL,
  `doctor_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `FK1_lab_pat` (`patients_id`),
  KEY `FK2_lab_doc` (`doctor_id`),
  CONSTRAINT `FK1_lab_pat` FOREIGN KEY (`patients_id`) REFERENCES `patients` (`patients_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK2_lab_doc` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.laboratory: ~15 rows (approximately)
INSERT INTO `laboratory` (`lab_id`, `date`, `lab_test`, `patients_id`, `doctor_id`) VALUES
	(1, '2023-02-20', 'valid:Test:Seminal fructose test', 1, 19),
	(2, '2023-01-02', 'valid:Test:Colonoscopy', 2, 18),
	(3, '2022-09-13', 'valid:Test:Mammography(Breast Imaging)', 3, 17),
	(4, '2022-11-28', 'valid:Test:Glycated hemoglobin (A1C) test', 4, 16),
	(5, '2023-01-23', 'valid:Test:Interpreting Laboratory Tests', 5, 14),
	(6, '2023-02-12', 'valid:Test:Activated partial thromboplastin time (APTT)', 6, 15),
	(7, '2023-03-15', 'valid:Test:Chromosomal karyotype', 7, 13),
	(8, '2023-01-15', 'valid:Test:Eye pressure test', 8, 12),
	(9, '2022-06-09', 'valid:Test:Autoantibody Tests', 9, 20),
	(10, '2022-12-06', 'valid:Test:Cognitive, functional and behavorial tests', 10, 9),
	(11, '2022-11-23', 'valid:Test:Screening for AAAs', 11, 7),
	(12, '2023-03-10', 'valid:Test:Blood tests', 12, 6),
	(13, '2023-02-12', 'valid:Test:Detailed laboratory analysis', 13, 5),
	(14, '2023-02-17', 'valid:Test:Skin test(biopsy)', 14, 3),
	(15, '2022-12-17', 'valid:Test:Flexible sigmoidoscopy', 15, 2),
	(16, '2022-10-01', 'valid:Test:Percutaneous skin test and the allergen-specific immun', 16, 1);

-- Dumping structure for table joveska.marki
CREATE TABLE IF NOT EXISTS `marki` (
  `marki_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `marki_name` varchar(35) NOT NULL,
  `country` varchar(25) NOT NULL,
  `eu` enum('1','0') NOT NULL,
  PRIMARY KEY (`marki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.marki: ~23 rows (approximately)
INSERT INTO `marki` (`marki_id`, `marki_name`, `country`, `eu`) VALUES
	(1, 'AUDI', 'DE', '1'),
	(2, 'TOYOTA', 'JP', '1'),
	(3, 'JEEP', 'US', '0'),
	(4, 'CHRYSLER', 'US', '0'),
	(5, 'AUDI', 'US', '0'),
	(6, 'TESLA MOTORS', 'US', '0'),
	(7, 'HONDA', 'US', '0'),
	(8, 'LEXUS', 'US', '0'),
	(9, 'PORSCHE', 'DE', '1'),
	(10, 'BMW', 'DE', '1'),
	(11, 'OPEL', 'DE', '1'),
	(12, 'MERCEDES-BENZ', 'DE', '1'),
	(13, 'CITROEN', 'F', '1'),
	(14, 'BUGATTI', 'F', '1'),
	(15, 'MASERATI', 'IT', '1'),
	(16, 'FERRARI', 'IT', '1'),
	(17, 'DUCATI', 'TL', '0'),
	(18, 'FERRARI', 'IT', '1'),
	(19, 'FORD', 'UK', '0'),
	(25, 'OCTAVIA', 'CH', '0'),
	(26, 'OCTAVIA', 'CH', '1'),
	(27, 'POLO', 'US', '0'),
	(28, 'BMW', 'US', '0');

-- Dumping structure for table joveska.modeli
CREATE TABLE IF NOT EXISTS `modeli` (
  `modeli_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `modeli_name` varchar(50) NOT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `color` varchar(25) NOT NULL,
  `marki_id` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`modeli_id`),
  KEY `FK_modeli_marki` (`marki_id`),
  CONSTRAINT `FK_modeli_marki` FOREIGN KEY (`marki_id`) REFERENCES `marki` (`marki_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.modeli: ~18 rows (approximately)
INSERT INTO `modeli` (`modeli_id`, `modeli_name`, `price`, `color`, `marki_id`) VALUES
	(1, 'A4', 2400, '#ff00ff', 1),
	(2, 'A4', 2800, '#ff00ff', 5),
	(3, '300SL', 2400, '#f258AA', 12),
	(4, ' 3500GTs', 3500, '#235BB4', 15),
	(6, 'Berlingo', 2000, '#808080', 13),
	(7, 'X7', 40000, '#000000', 10),
	(8, 'Insignia', 65000, '#003300', 11),
	(9, 'LS', 65000, '#5523A8', 8),
	(10, 'Panamera', 75000, '#C0C0C0', 9),
	(11, 'S2000', 55000, '#CCFF25', 7),
	(12, 'Model A', 48000, '#990033', 19),
	(13, 'Compass', 66000, '#AA25CC', 3),
	(14, 'PT Cruiser', 56800, '#2233AA', 4),
	(15, 'Corolla', 3320, '#552255', 2),
	(18, 'OCTAVIA', 5600, '#55CC23', 25),
	(19, 'Monster 795', 80000, '#0000AB', 17),
	(20, '206', 25200, '#22BB31', 6),
	(21, 'Volkswagen-newsroom', 24000, '#ff00ff', 26),
	(22, 'M5', 65000, '#ff00AA', 28);

-- Dumping structure for table joveska.obuki
CREATE TABLE IF NOT EXISTS `obuki` (
  `obuki_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `mentor` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`obuki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.obuki: ~13 rows (approximately)
INSERT INTO `obuki` (`obuki_id`, `title`, `mentor`, `description`) VALUES
	(1, 'ST', 'Ljubisha Popovski', 'Software_testing'),
	(2, 'FE', 'Marija Stojanovska', 'Front-End Dev'),
	(3, 'SM', 'Ana Ristevska', 'Online Social Media Training'),
	(4, 'WP', 'Ljubisha Popovski', 'WordPress'),
	(5, 'JP', 'Ljubisha Popovski', 'JAVA Programming'),
	(6, 'DS', 'Ljubisha Popovski', 'Data Science & Visualization'),
	(7, 'PY', 'Ljubisha Popovski', 'Python'),
	(8, 'FW', 'Marija Stojanovska', 'Training for Freelance Work'),
	(9, 'AC', 'Marija Stojanovska', 'AutoCAD'),
	(10, 'BE', 'Ljubisha Popovski', 'Back-End Dev'),
	(11, 'C#', 'Ana Ristevska', '.NET Framework'),
	(12, 'BT', 'Ana Ristevska', 'Business Training'),
	(13, 'LP', 'Ljubisha Popovski', 'Laravel Programming');

-- Dumping structure for table joveska.patients
CREATE TABLE IF NOT EXISTS `patients` (
  `patients_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `age` smallint(6) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `address` varchar(50) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `diagnosis` varchar(10) NOT NULL,
  `doctor_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`patients_id`),
  KEY `FK1_pat_doc` (`doctor_id`),
  CONSTRAINT `FK1_pat_doc` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.patients: ~18 rows (approximately)
INSERT INTO `patients` (`patients_id`, `full_name`, `age`, `gender`, `address`, `disease`, `diagnosis`, `doctor_id`) VALUES
	(1, 'Dame Kostovski', 29, 'm', 'Borka Spirkoski 28-3', 'Male Infertility', 'N46.9', 19),
	(2, 'Toni Magdeski', 48, 'm', 'Trajko Zabrcanec 17', 'Typhlitis(inflammation of the cecum)', 'K51.40', 18),
	(3, 'Ljubica Gjoreva', 55, 'f', 'Borka Stevanoski 25', 'Malignant neoplasm of unspecified site of female breast', 'C50.919', 17),
	(4, 'Baljbona Karanfili', 45, 'f', 's.Novaci', 'Diabetes mellitus type 2', 'I10 ', 16),
	(5, 'Barbara Nikolovska', 12, 'f', 'Vardarska bb', 'Varicella-zoster virus (VZV)', 'B01 ', 14),
	(6, 'Kamelija Rizovska', 39, 'f', 'Popeto 18', 'Hip Fracture', 'M84.459A', 15),
	(7, 'Gligor Adamoski', 1, 'm', 'Pitu Guli 18', 'Down syndrome(trisomy 21)', 'Q90.2', 13),
	(8, 'Nenad Vasilevski', 72, 'm', 'Blagoj Gjoreski 22-8', 'Glaucoma', 'H40', 12),
	(9, 'Biljana Presilska', 80, 'f', 'Blaze Koneski 40', 'Thyrotoxicosis [hyperthyroidism]', 'E05', 20),
	(10, 'Marija Smugreska', 78, 'f', 'Lazar Kukoski 33', 'Alzheimer’s disease', 'G30', 9),
	(11, 'Bube Josevska', 68, 'f', 'Karaman 60/8', 'Abdominal aortic aneurysm', 'I71.40', 7),
	(12, 'Ilijan Jovevski', 8, 'm', 'Pere Tosev 55', 'Review of sports medicine', '/', 6),
	(13, 'Teona Jasmakoska', 26, 'f', 'Kuzma i Damjan 25', 'Toxic effect of detergents, accidental', 'T55.1X1', 5),
	(14, 'Zoran Negrevski', 66, 'm', 'Dragorova 15A', 'Psoriatic arthritis (PsA)', 'L40.52', 3),
	(15, 'Kiril Trencevski', 70, 'm', 'Sotka Gorgievski 18B', 'Volvulus', 'K56.2', 2),
	(16, 'Bozidar Sokovski', 50, 'm', 'Prvi braniteli 125', 'Allergic rhinitis', 'J30.4', 1),
	(17, 'Kole Koneski', 55, 'm', 'Narodna armija 110', 'Schizophrenia', 'F209', 10),
	(18, 'Meri Mrmkovska', 40, 'f', 'Narodna armija 110', 'Glaukoma', 'H40', 12);

-- Dumping structure for table joveska.studenti
CREATE TABLE IF NOT EXISTS `studenti` (
  `studenti_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `obuki_id` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`studenti_id`) USING BTREE,
  KEY `FK1_studenti_obuki` (`obuki_id`),
  CONSTRAINT `FK1_studenti_obuki` FOREIGN KEY (`obuki_id`) REFERENCES `obuki` (`obuki_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.studenti: ~23 rows (approximately)
INSERT INTO `studenti` (`studenti_id`, `first_name`, `last_name`, `obuki_id`) VALUES
	(1, 'Antonija', 'Pavlovska', 1),
	(2, 'Anelija', 'Nikolovska', 5),
	(3, 'Natali', 'Sokolova', 8),
	(4, 'Elmir', 'Jarifi', 6),
	(5, 'Ankica', 'Gjoreska', 3),
	(6, 'Anita', 'Stankoska', 3),
	(7, 'Toni', 'Josifovski', 1),
	(8, 'Kiril', 'Antov', 2),
	(9, 'Metodi', 'Iliovski', 9),
	(10, 'Katerina', 'Rosikopulos', 10),
	(11, 'Melina', 'Lefter', 6),
	(12, 'Anabela', 'Jakupi', 4),
	(13, 'Meri', 'Stojcevska', 7),
	(14, 'Meri', 'Svrtinovska', 10),
	(15, 'Tosko', 'Iliovski', 5),
	(16, 'Tihomir', 'Petkov', 3),
	(17, 'Gorgina', 'Nikolova', 2),
	(18, 'Maja', 'Naumovska', 1),
	(19, 'Ilija', 'Novevski', 9),
	(20, 'Milica', 'Zlatevska', 3),
	(21, 'Marie', 'Svekaroska', 7),
	(22, 'Melita', 'Ugrinovska', 7),
	(23, 'Mile', 'Tosheski', 12),
	(24, 'Mihail', 'Todorovski', 11);

-- Dumping structure for table joveska.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `date_of_last_login` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.users: ~4 rows (approximately)
INSERT INTO `users` (`id`, `user_name`, `password`, `date_of_last_login`) VALUES
	(1, 'admin12@yahoo.com', 'b521caa6e1db82e5a01c924a419870cb72b81635', '2023-02-22 00:00:00'),
	(2, 'admin012@yahoo.com', 'b521caa6e1db82e5a01c924a419870cb72b81635', '2023-02-22 00:00:00'),
	(5, 'admin1273@yahoo.com', '71e8172ca9b7d809bad28999baa188d6810cb8cd', '2023-01-23 00:00:00'),
	(6, 'admin1234@yahoo.com', 'f42017eb74f1d8300ec19cd1d0e196c7412571cd', '2023-02-28 00:00:00'),
	(8, 'admin12345@yahoo.com', '81572aa44533a0f7a7e8df4cb1919f1a311dbf32', '2023-03-01 21:52:03');

-- Dumping structure for table joveska.vraboteni
CREATE TABLE IF NOT EXISTS `vraboteni` (
  `vr_id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(25) NOT NULL,
  `prezime` varchar(35) NOT NULL,
  `godini` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`vr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table joveska.vraboteni: ~0 rows (approximately)

-- Dumping structure for procedure joveska._*delete_doctors_id
DELIMITER //
CREATE PROCEDURE `_*delete_doctors_id`(
	IN `doctors_id_param` SMALLINT(5)
)
BEGIN
DELETE FROM modeli WHERE doctors_id=doctors_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*delete_lab_date
DELIMITER //
CREATE PROCEDURE `_*delete_lab_date`(
	IN `date_param` DATE
)
BEGIN
DELETE FROM laboratory WHERE date=date_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*delete_lab_test
DELIMITER //
CREATE PROCEDURE `_*delete_lab_test`(
	IN `lab_test_param` VARCHAR(100)
)
BEGIN
DELETE FROM laboratory WHERE lab_test=lab_test_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*delete_lab_test_id
DELIMITER //
CREATE PROCEDURE `_*delete_lab_test_id`(
	IN `lab_id_param` SMALLINT(5)
)
BEGIN
DELETE FROM laboratory WHERE lab_id=lab_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*delete_patients_id
DELIMITER //
CREATE PROCEDURE `_*delete_patients_id`(
	IN `patients_id_param` SMALLINT(5)
)
BEGIN
DELETE FROM marki WHERE patients_id=patients_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*insert_doctors
DELIMITER //
CREATE PROCEDURE `_*insert_doctors`(
	IN `doctor_id_param` SMALLINT,
	IN `full_name_param` VARCHAR(50),
	IN `age_param` SMALLINT,
	IN `gender_param` ENUM('m','f'),
	IN `specialization_param` VARCHAR(50)
)
BEGIN
INSERT INTO doctors(doctor_id,full_name,age,gender,specialization)
VALUES (doctor_id_param,full_name_param,age_param,gender_param,specialization_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*insert_laboratory
DELIMITER //
CREATE PROCEDURE `_*insert_laboratory`(
	IN `lab_id_param` SMALLINT,
	IN `date_param` DATE,
	IN `lab_test_param` VARCHAR(50),
	IN `patients_id_param` SMALLINT,
	IN `doctor_id_param` SMALLINT
)
BEGIN
INSERT INTO laboratory(lab_id,date,lab_test,patients_id,doctor_id)
VALUES (lab_id_param,date_param,lab_test_param,patients_id_param,doctor_id_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*insert_patients
DELIMITER //
CREATE PROCEDURE `_*insert_patients`(
	IN `patients_id_param` SMALLINT,
	IN `full_name_param` VARCHAR(50),
	IN `age_param` SMALLINT,
	IN `gender_param` ENUM('m','f'),
	IN `address_param` VARCHAR(50),
	IN `disease_param` VARCHAR(50),
	IN `diagnosis_param` VARCHAR(100),
	IN `doctor_id_param` SMALLINT
)
BEGIN
INSERT INTO patients(patients_id,full_name,age,gender,address,disease,diagnosis,doctor_id)
VALUES (patients_id_param,full_name_param,age_param,gender_param,address_param,disease_param,diagnosis_param,doctor_id_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_adult_patients
DELIMITER //
CREATE PROCEDURE `_*join_adult_patients`()
BEGIN
SELECT doctors.full_name, doctors.specialization, patients.age, patients.full_name FROM doctors
INNER JOIN patients
ON patients.doctor_id = doctors.doctor_id
RIGHT JOIN laboratory
ON laboratory.patients_id = doctors.doctor_id
WHERE patients.age >=18;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_minors_patients
DELIMITER //
CREATE PROCEDURE `_*join_minors_patients`()
BEGIN
SELECT doctors.full_name, doctors.specialization, patients.age, patients.full_name FROM doctors
INNER JOIN patients
ON patients.doctor_id = doctors.doctor_id
RIGHT JOIN laboratory
ON laboratory.patients_id = doctors.doctor_id
WHERE patients.age NOT BETWEEN 18 AND 90;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_parients_specialization_department
DELIMITER //
CREATE PROCEDURE `_*join_parients_specialization_department`(
	IN `specialization_param` VARCHAR(50)
)
BEGIN
SELECT patients.full_name, address, laboratory.date FROM patients
RIGHT JOIN doctors
ON patients.doctor_id = doctors.doctor_id
RIGHT JOIN laboratory
ON laboratory.patients_id = doctors.doctor_id
WHERE doctors.specialization = specialization_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_patients_doctors
DELIMITER //
CREATE PROCEDURE `_*join_patients_doctors`()
BEGIN
SELECT * FROM patients
RIGHT JOIN doctors
ON patients.doctor_id = doctors.doctor_id;

END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_patients_doctors_laboratory
DELIMITER //
CREATE PROCEDURE `_*join_patients_doctors_laboratory`()
BEGIN
SELECT * FROM patients
RIGHT JOIN doctors
ON patients.doctor_id = doctors.doctor_id
RIGHT JOIN laboratory
ON laboratory.patients_id = doctors.doctor_id;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_tested_patients_after_date
DELIMITER //
CREATE PROCEDURE `_*join_tested_patients_after_date`(
	IN `date_param` DATE
)
BEGIN
SELECT patients.full_name, patients.gender, laboratory.date FROM patients
INNER JOIN laboratory
ON laboratory.patients_id = patients.patients_id
WHERE laboratory.date<date_param
ORDER BY laboratory.date ASC;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_tested_patients_before_date
DELIMITER //
CREATE PROCEDURE `_*join_tested_patients_before_date`(
	IN `date_param` DATE
)
BEGIN
SELECT patients.full_name, patients.gender, laboratory.date FROM patients
INNER JOIN laboratory
ON laboratory.patients_id = patients.patients_id
WHERE laboratory.date>date_param
ORDER BY laboratory.date ASC;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_tested_patient_between_2dates
DELIMITER //
CREATE PROCEDURE `_*join_tested_patient_between_2dates`(
	IN `date_param1` DATE,
	IN `date_param2` DATE
)
BEGIN
SELECT patients.full_name, patients.address FROM patients
INNER JOIN laboratory
ON laboratory.patients_id = patients.patients_id
WHERE laboratory.date BETWEEN date_param1 AND date_param2;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*join_verify_full_name_0
DELIMITER //
CREATE PROCEDURE `_*join_verify_full_name_0`()
BEGIN
SELECT doctors.full_name, doctors.specialization, patients.age, patients.full_name FROM doctors
inner JOIN patients
ON patients.doctor_id = doctors.doctor_id
RIGHT JOIN laboratory
ON laboratory.patients_id = doctors.doctor_id
WHERE patients.patients_id=NULL;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*selectpatient_diagnosis%K5%
DELIMITER //
CREATE PROCEDURE `_*selectpatient_diagnosis%K5%`()
BEGIN
SELECT patients_id,full_name,age,gender,address,disease,diagnosis,doctor_id
FROM patients
WHERE diagnosis LIKE '%K5%';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_count_patients_group_by_gender
DELIMITER //
CREATE PROCEDURE `_*select_count_patients_group_by_gender`()
BEGIN
SELECT patients_id, COUNT(*) AS 'Total patients'
FROM patients
GROUP BY gender;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_count_total_doctors
DELIMITER //
CREATE PROCEDURE `_*select_count_total_doctors`()
BEGIN
SELECT COUNT(doctor_id) AS 'Total Doctors'
FROM  doctors;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_diagnosis_code
DELIMITER //
CREATE PROCEDURE `_*select_diagnosis_code`(
	IN `diagnosis_param` VARCHAR(10)
)
BEGIN
SELECT patients_id,full_name,age,gender,address,disease,diagnosis,doctor_id
FROM patients
WHERE diagnosis LIKE diagnosis_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_doctors>40
DELIMITER //
CREATE PROCEDURE `_*select_doctors>40`()
BEGIN
SELECT * FROM doctors 
WHERE age>40;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_doc_specP%y
DELIMITER //
CREATE PROCEDURE `_*select_doc_specP%y`()
BEGIN
SELECT doctor_id,full_name,age,gender,specialization
FROM doctors
WHERE specialization LIKE 'P%y';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_lab_test
DELIMITER //
CREATE PROCEDURE `_*select_lab_test`(
	IN `lab_test_param` VARCHAR(100)
)
BEGIN
SELECT lab_id,date,lab_test,patients_id,doctor_id
FROM laboratory
WHERE lab_test LIKE lab_test_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_lab_test%Skin%
DELIMITER //
CREATE PROCEDURE `_*select_lab_test%Skin%`()
BEGIN
SELECT lab_id,date,lab_test,patients_id,doctor_id
FROM laboratory
WHERE lab_test LIKE '%Skin%';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_man_patients_age>=40
DELIMITER //
CREATE PROCEDURE `_*select_man_patients_age>=40`()
BEGIN
SELECT * FROM patients
WHERE gender='m' AND age>=40;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_patientsASC
DELIMITER //
CREATE PROCEDURE `_*select_patientsASC`()
BEGIN
SELECT DISTINCT full_name, disease
FROM patients
ORDER BY full_name ASC;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_patients_diagnosis
DELIMITER //
CREATE PROCEDURE `_*select_patients_diagnosis`(
	IN `diagnosis_param` VARCHAR(100)
)
BEGIN
SELECT * FROM patients 
WHERE diagnosis = diagnosis_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_patients_not_range18to25
DELIMITER //
CREATE PROCEDURE `_*select_patients_not_range18to25`()
BEGIN
SELECT patients_id,full_name,age,gender,address,disease,diagnosis,doctor_id AS 'Not in the range of 18 to 25'
FROM patients
WHERE (age NOT IN (18,19,20,21,22,23,24,25));
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_patients_no_diagnosis
DELIMITER //
CREATE PROCEDURE `_*select_patients_no_diagnosis`()
BEGIN
SELECT * FROM patients 
WHERE diagnosis='/';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_patients_where_doctors_id<>15ASC
DELIMITER //
CREATE PROCEDURE `_*select_patients_where_doctors_id<>15ASC`()
BEGIN
SELECT patients_id,full_name,age,gender,address,disease,diagnosis,doctor_id
FROM patients
WHERE doctor_id<>15
ORDER BY doctor_id ASC;
#SQL Not Equal Expression
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_total_patients
DELIMITER //
CREATE PROCEDURE `_*select_total_patients`()
BEGIN
SELECT COUNT(patients_id) AS 'Total patients'
FROM patients;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_total_patients_age>40
DELIMITER //
CREATE PROCEDURE `_*select_total_patients_age>40`()
BEGIN
SELECT COUNT(*) AS 'Total patients with age above 40'
FROM  patients
WHERE age > 40;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*select_women_age>=40
DELIMITER //
CREATE PROCEDURE `_*select_women_age>=40`()
BEGIN
SELECT * FROM patients
WHERE gender='f' AND age>=40;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*update_age_doct_with_spec
DELIMITER //
CREATE PROCEDURE `_*update_age_doct_with_spec`(
	IN `age_param` SMALLINT(5),
	IN `specialization_param` VARCHAR(50)
)
BEGIN
UPDATE doctors
SET age=age_param
WHERE specialization = specialization_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*update_desease_patients_id
DELIMITER //
CREATE PROCEDURE `_*update_desease_patients_id`(
	IN `disease_param` VARCHAR(50),
	IN `patients_id_param` SMALLINT(5)
)
BEGIN
UPDATE patients
SET disease=disease_param
WHERE patients_id=patients_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*update_fullname_patients_id
DELIMITER //
CREATE PROCEDURE `_*update_fullname_patients_id`(
	IN `full_name_param` VARCHAR(50),
	IN `patients_id_param` SMALLINT(5)
)
BEGIN
UPDATE patients 
SET full_name=full_name_param
WHERE patients_id=patients_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._*update_lab_test_regex
DELIMITER //
CREATE PROCEDURE `_*update_lab_test_regex`(
	IN `lab_test_param` VARCHAR(100)
)
BEGIN
UPDATE laboratory 
SET lab_test = { fn CONCAT (lab_test_param, lab_test) };
#SQL UPDATE Statement with RegEx!*/
END//
DELIMITER ;

-- Dumping structure for procedure joveska._count_group_by_fabriki
DELIMITER //
CREATE PROCEDURE `_count_group_by_fabriki`(
	IN `marki_id` SMALLINT(4)
)
BEGIN
SELECT country, COUNT(marki_id)
FROM marki
GROUP BY country
ORDER BY COUNT(marki_id) DESC
LIMIT 3; 
END//
DELIMITER ;

-- Dumping structure for procedure joveska._delete_marki
DELIMITER //
CREATE PROCEDURE `_delete_marki`(
	IN `marki_id_param` TINYINT
)
BEGIN
DELETE FROM marki WHERE marki_id=marki_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._delete_modeli
DELIMITER //
CREATE PROCEDURE `_delete_modeli`(
	IN `modeli_id_param` SMALLINT(3)
)
BEGIN
DELETE FROM modeli WHERE modeli_id=modeli_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._insert_marki
DELIMITER //
CREATE PROCEDURE `_insert_marki`(
	IN `marki_name_param` VARCHAR(35),
	IN `country_param` VARCHAR(25),
	IN `eu_param` ENUM('1','0')
)
BEGIN
INSERT INTO marki (marki_name,country,eu)
VALUES (marki_name_param, country_param,eu_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._insert_modeli
DELIMITER //
CREATE PROCEDURE `_insert_modeli`(
	IN `modeli_name_param` VARCHAR(50),
	IN `price_param` BIGINT,
	IN `color_param` VARCHAR(25)
)
BEGIN
INSERT INTO modeli (modeli_name, price, color)
VALUES (modeli_name_param, price_param,color_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_all_country_by_br_fabriki
DELIMITER //
CREATE PROCEDURE `_select_all_country_by_br_fabriki`()
BEGIN
SELECT country, COUNT(*) AS Br_fabriki
FROM marki;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_color_crna
DELIMITER //
CREATE PROCEDURE `_select_color_crna`()
BEGIN
SELECT * FROM modeli
WHERE color LIKE '#000000';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_country_EU
DELIMITER //
CREATE PROCEDURE `_select_country_EU`(
	IN `eu_param` ENUM('1','0')
)
BEGIN
SELECT * FROM marki
WHERE eu = eu_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_list_country_by_br_fabriki
DELIMITER //
CREATE PROCEDURE `_select_list_country_by_br_fabriki`()
BEGIN
SELECT country, COUNT(marki_id)
FROM marki
GROUP BY country
ORDER BY COUNT(marki_id) DESC;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_marki_by_1country
DELIMITER //
CREATE PROCEDURE `_select_marki_by_1country`(
	IN `country_param` VARCHAR(30)
)
BEGIN
SELECT * FROM marki
WHERE country LIKE country_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_marki_by_2country
DELIMITER //
CREATE PROCEDURE `_select_marki_by_2country`(
	IN `country_param1` VARCHAR(25),
	IN `country_param2` VARCHAR(25)
)
BEGIN
SELECT * FROM marki
WHERE country LIKE country_param1 OR country_param2;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_MAX_price
DELIMITER //
CREATE PROCEDURE `_select_MAX_price`()
BEGIN
SELECT * FROM modeli
WHERE price =(SELECT MAX(price)FROM modeli);
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_MIN_price
DELIMITER //
CREATE PROCEDURE `_select_MIN_price`()
BEGIN
SELECT * FROM modeli 
WHERE price =(SELECT MIN(price)FROM modeli);

END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_modeli
DELIMITER //
CREATE PROCEDURE `_select_modeli`()
BEGIN
SELECT * FROM modeli;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_modeli_cena3000_5000
DELIMITER //
CREATE PROCEDURE `_select_modeli_cena3000_5000`()
BEGIN
SELECT modeli_name, price AS CenaOd3000Do5000EU
FROM modeli
WHERE price BETWEEN '3000' AND'5000';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_modeli_clasaA
DELIMITER //
CREATE PROCEDURE `_select_modeli_clasaA`()
BEGIN
SELECT * FROM modeli 
WHERE modeli_name LIKE 'A%';
END//
DELIMITER ;

-- Dumping structure for procedure joveska._select_modeli_color_crni_poskapi_9000
DELIMITER //
CREATE PROCEDURE `_select_modeli_color_crni_poskapi_9000`()
BEGIN
SELECT * FROM modeli
WHERE color = '#000000' AND price>=9000;
END//
DELIMITER ;

-- Dumping structure for procedure joveska._update_marki
DELIMITER //
CREATE PROCEDURE `_update_marki`(
	IN `marki_name_param` VARCHAR(35),
	IN `country_param` VARCHAR(25),
	IN `eu_param` ENUM('1','0'),
	IN `marki_id_param` TINYINT
)
BEGIN
UPDATE marki
SET marki_name=marki_name_param, country=country_param, eu=eu_param
WHERE marki_id=marki_id_param;


END//
DELIMITER ;

-- Dumping structure for procedure joveska._update_modeli
DELIMITER //
CREATE PROCEDURE `_update_modeli`(
	IN `modeli_name_param` VARCHAR(50),
	IN `price_param` BIGINT(20),
	IN `color_param` VARCHAR(25),
	IN `modeli_id_param` SMALLINT(3)
)
BEGIN
UPDATE modeli
SET modeli_name=modeli_name_param, price=price_param, color=color_param
WHERE modeli_id=modeli_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__delete_obuki
DELIMITER //
CREATE PROCEDURE `__delete_obuki`(
	IN `obuki_id_param` SMALLINT
)
BEGIN
DELETE FROM obuki WHERE obuki_id=obuki_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__delete_studenti
DELIMITER //
CREATE PROCEDURE `__delete_studenti`(
	IN `studenti_id_param` SMALLINT
)
BEGIN
DELETE FROM studenti WHERE studenti_id=studenti_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__insert_obuki
DELIMITER //
CREATE PROCEDURE `__insert_obuki`(
	IN `obuki_id_param` INT,
	IN `title_param` VARCHAR(50),
	IN `mentor_param` VARCHAR(50),
	IN `description_param` VARCHAR(50)
)
BEGIN
INSERT INTO obuki (obuki_id,title,mentor,description)
VALUES (obuki_id_param,title_param, mentor_param,description_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__insert_studenti
DELIMITER //
CREATE PROCEDURE `__insert_studenti`(
	IN `studenti_id_param` SMALLINT,
	IN `first_name_param` VARCHAR(50),
	IN `last_name_param` VARCHAR(50),
	IN `obuki_id_param` SMALLINT
)
BEGIN
INSERT INTO studenti(studenti_id,first_name,last_name,obuki_id)
VALUES (studenti_id_param,first_name_param, last_name_param, obuki_id_param);
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__join_studenti_obuki
DELIMITER //
CREATE PROCEDURE `__join_studenti_obuki`()
BEGIN
SELECT * FROM studenti
RIGHT JOIN obuki
ON studenti.obuki_id=obuki.obuki_id;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__select_obuki_izbor_mentor
DELIMITER //
CREATE PROCEDURE `__select_obuki_izbor_mentor`(
	IN `mentor_param` VARCHAR(50)
)
BEGIN
SELECT title, description AS Kursevi 
FROM obuki
WHERE mentor=mentor_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__select_studenti_first_nameA_ASC
DELIMITER //
CREATE PROCEDURE `__select_studenti_first_nameA_ASC`()
BEGIN
SELECT studenti.*, studenti.first_name
FROM studenti
RIGHT JOIN obuki
ON studenti.obuki_id=obuki.obuki_id
WHERE studenti.first_name LIKE 'A%'
ORDER BY obuki.title ASC;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__update_obuki_mentor
DELIMITER //
CREATE PROCEDURE `__update_obuki_mentor`(
	IN `title_param` VARCHAR(50),
	IN `mentor_param` VARCHAR(50),
	IN `description_param` VARCHAR(50),
	IN `obuki_id_param` SMALLINT
)
BEGIN
UPDATE obuki
SET title=title_param,mentor=mentor_param,DESCRIPTION=description_param
WHERE obuki_id=obuki_id_param;
END//
DELIMITER ;

-- Dumping structure for procedure joveska.__update_studenti
DELIMITER //
CREATE PROCEDURE `__update_studenti`(
	IN `first_name_param` VARCHAR(50),
	IN `last_name_param` VARCHAR(50),
	IN `studenti_id_param` SMALLINT
)
BEGIN
UPDATE studenti
SET first_name=first_name_param,last_name=last_name_param
WHERE studenti_id=studenti_id_param;
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
