package com.board.domain;

import java.util.Date;

public class BoardVO { //Value Object의 첫 글자를 딴 약자로 VO는 그냥 값 그 자체
	/* 테이블 입니다.
	create table tbl_board(
		  bno int not null auto_increment,
		  title varchar(50) not null,
		  content text not null,
		  writer varchar(30) not null,
		  regDate timestamp not null default now(),
		  viewCnt int default 0,
		  primary key(bno)
		);
	*/
	
	private int bno;
	private String title;
	private String content;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
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
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	private String writer;
	private Date regDate;
	private int viewCnt;
}
