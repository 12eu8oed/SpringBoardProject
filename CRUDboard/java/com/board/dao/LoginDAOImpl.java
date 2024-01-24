package com.board.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

//로그인 및 회원가입
@Repository
public class LoginDAOImpl implements LoginDAO { // Implement 구현하다 BoardDAO의 구현클래스 이다, DB쪽 구현체
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.login";

	//로그인
	@Override
	public MemberVO Login(String id, String password) throws Exception {
		HashMap<String, Object> data = new HashMap<>();
		data.put("id", id);
		data.put("password", password);

		return sql.selectOne(namespace + ".login", data);
	}
	
}
