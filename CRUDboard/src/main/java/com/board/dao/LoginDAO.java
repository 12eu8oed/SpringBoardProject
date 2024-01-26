package com.board.dao;

import com.board.domain.MemberVO;

//로그인 및 회원가입
public interface LoginDAO {
	
	// 로그인
	public MemberVO login(String id) throws Exception;
	
	// 회원가입 부분, 회원 등록
	public void signUp(MemberVO vo) throws Exception;
}
