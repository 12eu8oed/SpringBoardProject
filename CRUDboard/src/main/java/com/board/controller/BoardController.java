package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;
	
	// 게시물 목록
	// GET 방식은 서버에서 정보를 조회할 때 주로 쓰이고, POST 방식은 정보를 수정하거나 입력할 때 사용
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model, BoardVO vo) throws Exception { // Model은 컨트롤러(Controller)와 뷰(View)를 연결해주는 역할을 합니다.
		List list = null;
		list = service.list();
		model.addAttribute("list", list);
	}
	
//	// 새 게시물이  등록 되고 게시글 목록으로 돌아갈 때 새 글번호를 viewCount에 넣어준다.
//	@RequestMapping(value = "/list", method = RequestMethod.POST)
//	public String newviewCountGolist(Model model, BoardVO vo) throws Exception {
//		
//		service.newviewCountGolist(vo);
//
//		return "redirect:/board/listPageSearch?num=1"; // 모든 작업을 마치고 /board/list, 즉 게시물 목록 화면으로 이동하겠다는 의미
//		// 왜 그냥 url 쓰면 안되나? redirect를 사용해야 하는 이유는?
//	}

	// 게시글 작성 
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
  
	}

	// 스프링 게시판 만들기 #5. 무작정 베끼면 골로 간다.
	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(Model model, BoardVO vo) throws Exception {
		
		// 줄바꿈 문자를 <br/>로 변환합니다.
		String content = vo.getContent().replace("\n", "<br/>");
		
		// 변환한 내용을 다시 vo에 설정합니다.
		vo.setContent(content);
		
		service.write(vo);
		service.newviewCountGolist(vo);
		return "redirect:/board/listPageSearch?num=1"; // 모든 작업을 마치고 /board/list, 즉 게시물 목록 화면으로 이동하겠다는 의미
		// 왜 그냥 url 쓰면 안되나? redirect를 사용해야 하는 이유는?
	}

	// 게시물 조회
	// BoardVO를 이용하여 서비스(service)에서 데이터를 받고, 모델(model)을 이용하여 뷰(view)에 데이터를 넘겨줍니다. 이때, 넘겨주는 모델의 이름은 view입니다.
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	// service.modify(vo); 에서 뷰에서 컨트롤러로 넘어온 데이터(BoardVO)를 이용해 수정을 끝내고,
	// return "redirect:/board/view?bno=" + vo.getBno();에서 현재 bno에 해당되는 조회 페이지로 이동되도록 했습니다.
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

		service.modify(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		
		service.delete(bno);
		return "redirect:/board/listPageSearch?num=1";
		
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)  //알고리즘 짜는 느낌이구만 
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {

		Page page = new Page();

		page.setNum(num);
		page.setCount(service.count());

		List<BoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);
		
		/* 모두 page의 데이터입니다.
		model.addAttribute("pageNum", page.getPageNum());
		
		//시작 및 끝번호
		model.addAttribute("startPageNum", page.getStartPageNum());
		model.addAttribute("endPageNum", page.getEndPageNum());

		// 이전 및 다음
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());
		 */
		
		//page 데이터 전부를 view로 전달한다.
		model.addAttribute("page", page);
		
		//현재 페이지
		model.addAttribute("select", num);
		
		/*
		// 게시물 총 갯수
		int count = service.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;

		// 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int) Math.ceil((double) count / postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;
		
		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		
		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {  //1차계산과 2차 계산값 비교
			endPageNum = endPageNum_tmp;
		}
		
		//조건문 ? 참 : 거짓 ; 삼항 조건 연산자
		boolean prev = startPageNum == 1 ? false : true;  //이전 번호
		boolean next = endPageNum * pageNum_cnt >= count ? false : true; //다음 번호
		
		// 마지막 페이지 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의 갯수)) * 한번에 표시할 페이지 번호의 갯수
		// 시작 페이지 = 마지막 페이지 번호 - 한번에 표시할 페이지 번호의 갯수 + 1

		List<BoardVO> list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		//현재 페이지
		model.addAttribute("select", num);
		*/
		
	}
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception {
		//value 받고자할 데이터의 키 required는 해당 데이터의 필수여부, defaultValue는 만약 데이터가 들어오지 않았을 경우 대신하는 기본값
		
		Page page = new Page();

		page.setNum(num);
//		page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));

		// 검색 타입과 검색어
//		page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = null;
//		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);

		// page 데이터 전부를 view로 전달한다.
		model.addAttribute("page", page);

		// 현재 페이지
		model.addAttribute("select", num);

//		// 검색할 타입
//		model.addAttribute("searchType", searchType);
//
//		// 검색어
//		model.addAttribute("keyword", keyword);

	}

}
