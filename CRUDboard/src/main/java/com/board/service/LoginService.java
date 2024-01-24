package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.MemberVO;

public interface LoginService {
	
	// 로그인
	public MemberVO login(String id, String password) throws Exception;
}
