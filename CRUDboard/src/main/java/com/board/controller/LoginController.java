package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.LoginService;

@Controller
@RequestMapping("/board")
public class LoginController {

	@Inject
	private LoginService loginService;

	// 사용자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(@RequestParam("id") String id, @RequestParam("password") String password,
				HttpSession httpsession, Model model, HttpSession session, RedirectAttributes redirectAttributes)
					throws Exception {

		try {
			MemberVO vo = loginService.login(id, password);
			if (vo != null) {
				
				session.setAttribute("vo", vo);
				redirectAttributes.addFlashAttribute("welcomeMessage", vo.getWriter() + "님, 반갑습니다!");
				return "redirect:/board/listPageSearch?num=1";
				
			} else {
				
				redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
				return "redirect:/board/login";
				
			}
		} catch (Exception e) {
			
			redirectAttributes.addFlashAttribute("loginError", "로그인 처리 중 오류가 발생했습니다.");
			return "redirect:/board/login";
			
		}
	}

//		MemberVO vo = loginService.login(id, password);
//		System.out.println("Login attempt with id: " + id); // 로그 출력
//		System.out.println("Login attempt with password: " + password); // 로그 출력
//		loginService.login(id, password);
//		
//        return "redirect:/board/listPageSearch?num=1";
}
