package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.dao.LoginDAO;
import com.board.domain.MemberVO;

@Service
public class LoginServiceImpl implements LoginService { // 정보 전달 용도

	@Autowired
    private LoginDAO dao;

    @Autowired
    private PasswordEncoder passwordEncoder;

	
	// 로그인 
	@Override
	public MemberVO login(String id, String rawpassword) throws Exception {
		MemberVO vo = dao.login(id);
		
		if (vo != null && passwordEncoder.matches(rawpassword, vo.getPassword())) {
            // 비밀번호 일치
            return vo;
        }
        // 비밀번호 불일치 또는 사용자 없음
        return null;
	
	}

	
}
