package com.board.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.LoginService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

	@Inject
	private LoginService loginService;

	// 사용자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception {

		MemberVO vo = loginService.login(id, password);
		String formattedNow = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //실시간 시간 표시
		
		if (vo != null) {
			session.setAttribute("vo", vo);
			log.info("사용자 로그인: " + vo.getId() + " " + formattedNow); //login log
			
			return "redirect:/board/listPageSearch?num=1"; // 로그인 성공후 메인 페이지로 리다이렉트

		} else {
			redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
			log.info("사용자 로그인 실패");
			
			return "redirect:/board/listPageSearch?num=1";
		}
	}
	
	// 사용자 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {		
		MemberVO vo = (MemberVO) session.getAttribute("vo");		
		String formattedNow = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //실시간 시간 표시
		
		if (vo != null) {
			log.info("사용자 로그아웃: " + vo.getId() + " " + formattedNow); //logout log
		}
		
		session.invalidate(); //logout
		return "redirect:/board/listPageSearch?num=1";
	}
	
	// 사용자 정보로 넘겨주는 메소드
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfoGet() {
		return "signUp/userInfo"; //회원가입 폼 경로
	}
	
	// 회원가입 폼으로 넘겨주는 메소드
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpGet() {
		return "signUp/signUp"; //회원가입 폼 경로
	}
	
	// 회원가입 처리를 하는 메소드
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPost(MemberVO vo, RedirectAttributes redirectAttributes) {
		try {
			loginService.signUp(vo);
			redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
			return "redirect:/board/listPageSearch?num=1"; // 회원가입 성공 페이지로 리다이렉트
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "회원가입 중 오류가 발생했습니다.");
			return "redirect:/signUp"; // 회원가입 폼으로 리다이렉트
		}
	}
}
