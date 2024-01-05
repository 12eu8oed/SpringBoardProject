CREATE TABLE tbl_reply ( # tbl_board 의 댓글 테이블
	rno 		int 			not null auto_increment,
	bno 		int 			not null,
	writer 	varchar(30) not null,
	content 	text 			not null,
	regDate 	timestamp 	not null default now(),
	PRIMARY KEY(rno, bno),
	FOREIGN KEY(bno) REFERENCES tbl_board(bno)
); 