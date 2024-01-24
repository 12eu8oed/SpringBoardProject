package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.service.LoginService;

@Controller
@RequestMapping("/board/*")
public class LoginController {

	@Inject
	private LoginService loginService;
	
	// 사용자 로그인
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String postLogin(Model model, @RequestParam("id") String id, @RequestParam("password") String password) throws Exception {
		
		loginService.Login(id, password);
		
		return "redirect:/board/listPageSearch?num=1"; // 모든 작업을 마치고 /board/list, 즉 게시물 목록 화면으로 이동하겠다는 의미
		
	}
	

}
