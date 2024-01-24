package com.board.dao;

import com.board.domain.MemberVO;

//로그인 및 회원가입
public interface LoginDAO {
	
	// 로그인
	public MemberVO Login(String id, String password) throws Exception;
}
