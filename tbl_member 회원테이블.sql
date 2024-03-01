CREATE TABLE `tbl_member` (
	`mno` INT(11) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(50) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`writer` VARCHAR(30) NOT NULL,
	`profileImage` VARCHAR(255) NULL DEFAULT NULL,
	`regDate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`mno`)
);