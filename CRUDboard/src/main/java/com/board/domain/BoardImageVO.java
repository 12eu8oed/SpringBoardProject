package com.board.domain;

import java.util.Date;

public class BoardImageVO { 
//	CREATE TABLE `tbl_board_image` (
//			  `imageId` INT AUTO_INCREMENT PRIMARY KEY,
//			  `bno` INT NOT NULL,
//			  `filePath` VARCHAR(255) NOT NULL,
//			  `regDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//			  FOREIGN KEY (`bno`) REFERENCES tbl_board (bno) ON DELETE CASCADE
//			);
	private int imageId;
	private int bno;
	private String filePath;
	private Date regDate;
	
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
