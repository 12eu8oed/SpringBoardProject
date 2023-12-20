package com.board.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

//	@Autowired
//	private BoardService service; // BoardService를 주입받습니다.

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

//		int DefaultPageNum = 1; // 첫번째 쪽을 기본페이지로 설정합니다.
//		getListPage(model, DefaultPageNum); // listPage 메소드를 호출합니다.

//		return "board/listPage";
//		return "board/listPage";
		return "redirect:/board/listPage?num=1";
//		return "board/listPage?num=" + DefaultPageNum;
	}

//	 기존의 listPage 메소드는 그대로 둡니다.
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
//		Page page = new Page();
//
//		page.setNum(num);
//		page.setCount(service.count());
//
//		List<BoardVO> list = null;
//		list = service.listPage(page.getDisplayPost(), page.getPostNum());
//
//		model.addAttribute("list", list);
//
//		// page 데이터 전부를 view로 전달한다.
//		model.addAttribute("page", page);
//
//		// 현재 페이지
//		model.addAttribute("select", num);
//
//	}
//
}