package com.board.domain;

import java.util.Date;

public class MemberVO { 
//	CREATE TABLE `tbl_member` (
//			`mno` INT(11) NOT NULL AUTO_INCREMENT,
//			`id` VARCHAR(50) NOT NULL, 
//			`password` VARCHAR(255) NOT NULL,
//			`writer` VARCHAR(30) NOT NULL,
//			`profileImage` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci', //프로필 사진 저장되는 경로
//			`regDate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
//			PRIMARY KEY (mno)
//		);
	private int mno;
	private String id;
	private String password;
	private String writer;
	private String profileImage;
	private Date regDate;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfileImage() {
		return writer;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
