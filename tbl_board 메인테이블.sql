CREATE TABLE `tbl_board` (
	`bno` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`content` TEXT NOT NULL COLLATE 'utf8mb3_general_ci',
	`writer` VARCHAR(30) NOT NULL COLLATE 'utf8mb3_general_ci',
	`regDate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`bno`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1723
;
