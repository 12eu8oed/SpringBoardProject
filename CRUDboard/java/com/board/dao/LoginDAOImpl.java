package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class LoginDAOImpl implements LoginDAO { // Implement 구현하다 BoardDAO의 구현클래스 이다, DB쪽 구현체
	
	// 로그인 
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.board.mappers.login";
	
}
