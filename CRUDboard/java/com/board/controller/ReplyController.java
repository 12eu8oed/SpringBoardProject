package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private ReplyService replyService; // 서비스 객체 주입
	
	// 댓글 조회
	
	// 댓글 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String postWrite(ReplyVO vo) throws Exception {
		
		replyService.write(vo);

		// 댓글을 작성했던 게시물로 다시 이동 
		// 동작순서 : 사용자가요청 => view.jsp에서 댓글 작성 => Controller => Service => DAO=> Mapper => DB 그후 조회중이였던 게시물로 이동
		return "redirect:/board/view?bno=" + vo.getBno();

	}
	// 댓글 수정
	
	// 댓글 삭제

}
