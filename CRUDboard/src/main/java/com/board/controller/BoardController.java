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
import com.board.domain.ReplyVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	private BoardService service;
	
	@Inject
	private ReplyService replyService; //게시물과 댓글을 함께 읽어오는 방식으로 진행
	
	
	// 게시물 목록
	// GET 방식은 서버에서 정보를 조회할 때 주로 쓰이고, POST 방식은 정보를 수정하거나 입력할 때 사용
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model, BoardVO vo) throws Exception { // Model은 컨트롤러(Controller)와 뷰(View)를 연결해주는 역할을 합니다.
		List list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시글 작성 
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}

	// 게시글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo) throws Exception {
		
		// 줄바꿈 문자를 <br/>로 변환합니다.
		String content = vo.getContent().replace("\n", "<br/>");
		
		// 변환한 내용을 다시 vo에 설정합니다.
		vo.setContent(content);
		
		service.write(vo);
		
		service.newviewCountGolist(vo); // 새 게시물이  등록 되고 게시글 목록으로 돌아갈를 viewCount에 넣어준다. xml에서 테이블 분리가 필요하다.
		return "redirect:/board/listPageSearch?num=1"; // 모든 작업을 마치고 /board/list, 즉 게시물 목록 화면으로 이동하겠다는 의미
	}

	// 게시물 조회 와 댓글 조회
	// BoardVO를 이용하여 서비스(service)에서 데이터를 받고, 모델(model)을 이용하여 뷰(view)에 데이터를 넘겨줍니다. 이때, 넘겨주는 모델의 이름은 view입니다.
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception { // 요청에서 'bno'라는 이름의 파라미터 값을 정수형으로 받아오고, 뷰에 데이터를 전달할 Model 객체를 메서드의 파라미터로 선언
		
		BoardVO vo = service.view(bno); // 게시글 번호(bno)를 매개변수로 하여 service의 view 메서드를 호출, 게시글 정보가 담긴 BoardVO 인스턴스를 반환받음
		model.addAttribute("view", vo); // Model 인스턴스에 'view'라는 키로 BoardVO 인스턴스를 저장. 이를 통해 뷰 페이지에서 'view' 키를 이용해 게시글 정보에 접근할 수 있음
		
		//댓글 조회
		List<ReplyVO> reply = null;
		reply = replyService.list(bno);
		model.addAttribute("reply", reply); // Model 인스턴스에 'reply'라는 키로 댓글 목록을 저장. 뷰 페이지에서 'reply' 키를 이용해 댓글 데이터에 접근할 수 있음
		
		service.AddviewCountOne(vo); // 조회 중인 게시글의 BoardVO 인스턴스를 매개변수로 하여 service의 AddviewCountOne 메서드를 호출, 게시글의 조회수를 1 증가시키는 로직 실행
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
		
		// 게시글 삭제
		service.deleteAllRepliesForPost(bno); //달려있는 모든 댓글 제거
		service.delete(bno); //게시글 삭제
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
		
		//page 데이터 전부를 view로 전달한다.
		model.addAttribute("page", page);
		
		//현재 페이지
		model.addAttribute("select", num);
		
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
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);

		// page 데이터 전부를 view로 전달한다.
		model.addAttribute("page", page);

		// 현재 페이지
		model.addAttribute("select", num);

	}

}
