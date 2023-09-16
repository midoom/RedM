CREATE DATABASE IF NOT EXISTS `vorp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vorp`;

-- Listage de la structure de la table vorp. injured
CREATE TABLE IF NOT EXISTS `injured` (
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `charidentifier` int(11) DEFAULT NULL,
  `injured` varchar(50) DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
