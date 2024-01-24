package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.LoginDAO;
import com.board.domain.MemberVO;

@Service
public class LoginServiceImpl implements LoginService { // 정보 전달 용도

	@Inject
	private LoginDAO dao;

	// 로그인 
	@Override
	public MemberVO login(String id, String password) throws Exception {
		return dao.login(id, password);
	}

	
}
