CREATE TABLE IF NOT EXISTS `notepad` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `charidentifier` int(11) NOT NULL,
  `message` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `charidentifier` (`charidentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;