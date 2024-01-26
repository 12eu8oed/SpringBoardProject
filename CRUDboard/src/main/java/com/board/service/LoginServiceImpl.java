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
		System.out.println("로그인 시도: ID = " + id); // 디버깅 메시지 1
		MemberVO vo = dao.login(id);

		if (vo == null) {
			System.out.println("로그인 실패: 사용자를 찾을 수 없음"); // 디버깅 메시지 2
			return null;
		}

		if (passwordEncoder.matches(rawpassword, vo.getPassword())) {
			System.out.println("로그인 성공: 사용자 = " + vo.getWriter()); // 디버깅 메시지 3
			return vo;
		}

		System.out.println("로그인 실패: 비밀번호 불일치"); // 디버깅 메시지 4
		return null;

	}
	
	// 회원가입 부분, 회원 등록
	@Override
	public void signUp(MemberVO vo) throws Exception {
		// 비밀번호 해싱
		String encryptedPassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encryptedPassword);
		
		// 회원 정보 데이터베이스에 저장
		dao.signUp(vo);
	}
	

}
