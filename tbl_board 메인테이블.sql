CREATE TABLE `tbl_board` (
	`bno` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NOT NULL COLLATE,
	`content` TEXT NOT NULL COLLATE,
	`writer` VARCHAR(30) NOT NULL COLLATE,
	`regDate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`bno`)
);
