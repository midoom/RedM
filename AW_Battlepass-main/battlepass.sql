CREATE TABLE IF NOT EXISTS `aw_battlepass` (
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `playtime` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
