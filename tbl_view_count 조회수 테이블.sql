CREATE TABLE `tbl_view_count` (
	`bno` INT(11) NOT NULL,
	`viewCnt` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`bno`),
	CONSTRAINT `fk_view_count_board` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON UPDATE CASCADE ON DELETE CASCADE
);
