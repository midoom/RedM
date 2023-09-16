CREATE TABLE IF NOT EXISTS `mail` (
  `adress` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `charidentifier` int(11) DEFAULT NULL,
  `adressbook` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`adress`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `mail_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adress` int(11) DEFAULT NULL,
  `msgs` longtext DEFAULT NULL,
  `date` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `unred` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;