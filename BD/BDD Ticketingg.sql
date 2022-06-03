-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `T_COMMENTAIRE`;
CREATE TABLE `T_COMMENTAIRE` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_DATE` datetime NOT NULL,
  `COM_AUTEUR` varchar(100) NOT NULL,
  `COM_CONTENU` varchar(200) NOT NULL,
  `TIC_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `fk_com_bil` (`TIC_ID`),
  CONSTRAINT `fk_com_bil` FOREIGN KEY (`TIC_ID`) REFERENCES `T_TICKET` (`TIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `T_COMMENTAIRE` (`COM_ID`, `COM_DATE`, `COM_AUTEUR`, `COM_CONTENU`, `TIC_ID`) VALUES
(3,	'2029-09-21 03:56:06',	'Albert',	'Bon début',	3),
(4,	'2005-03-22 05:00:33',	'Albert',	'bien joué',	1),
(5,	'2024-05-22 10:24:41',	'Albert',	'Bon travail\r\n',	2),
(6,	'2022-06-03 19:34:13',	'Julie',	'Bon travail',	4),
(7,	'2022-06-03 19:34:31',	'Emma',	'Bon travail',	5),
(8,	'2022-06-03 19:34:51',	'Jérôme',	'Bon travail',	6);

DROP TABLE IF EXISTS `T_TICKET`;
CREATE TABLE `T_TICKET` (
  `ETA_ID` int(11) NOT NULL,
  `TIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIC_DATE` datetime NOT NULL,
  `TIC_TITRE` varchar(100) NOT NULL,
  `TIC_CONTENU` varchar(400) NOT NULL,
  PRIMARY KEY (`TIC_ID`),
  KEY `ETA_ID` (`ETA_ID`),
  CONSTRAINT `T_TICKET_ibfk_1` FOREIGN KEY (`ETA_ID`) REFERENCES `T_ETAT` (`ETA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `T_TICKET` (`ETA_ID`, `TIC_ID`, `TIC_DATE`, `TIC_TITRE`, `TIC_CONTENU`) VALUES
(3,	1,	'2021-09-29 15:55:05',	'Panne',	'Panne du périphérique'),
(1,	2,	'2021-09-29 15:55:18',	'Couleur écran ',	'Modifier la couleur de l\'écran'),
(2,	3,	'2021-09-29 15:55:46',	'Affichage',	'Aucun affichage'),
(2,	4,	'2022-06-03 19:02:00',	'Périphérique en panne',	'Ne s\'allume plus'),
(1,	5,	'2022-06-03 19:02:18',	'Problème de couleur',	'Nuance de gris'),
(2,	6,	'2022-06-03 19:02:37',	'Luminosité basse',	'Peu de luminosité');

-- 2022-06-03 17:36:08
