package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

//로그인 및 회원가입
@Repository
public class LoginDAOImpl implements LoginDAO { // Implement 구현하다 BoardDAO의 구현클래스 이다, DB쪽 구현체
	
	@Autowired
	private SqlSession sql;
	private static String namespace = "com.board.mappers.loginSignUp";

	//로그인
	@Override
	public MemberVO login(String id) throws Exception {
		return sql.selectOne(namespace + ".login", id);
	}

	// 회원가입 부분, 회원 등록
	@Override
	public void signUp(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signUp", vo);
	}
	
}
