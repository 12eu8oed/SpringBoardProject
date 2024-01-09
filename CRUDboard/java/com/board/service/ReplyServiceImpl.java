package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService { // 정보 전달 용도
	
	@Inject
	private ReplyDAO dao;

    // 댓글 조회
    @Override
    public List<ReplyVO> list(int bno) throws Exception {
        List<ReplyVO> replyList = dao.list(bno);
	    System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
        if (replyList.isEmpty()) {
            System.out.println("댓글이 없습니다.");
        } else {
            System.out.println("댓글 목록은 다음과 같습니다:");
            for (ReplyVO reply : replyList) {
                System.out.println(reply.toString());
            }
        }
        System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
	    System.out.println("============================================================");
        return replyList;
    }

	// 댓글 작성
	@Override
	public void write(ReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	// 댓글 작성
	@Override
	public void modify(ReplyVO vo) throws Exception {
	    dao.modify(vo);
	}

	// 댓글 작성
	@Override
	public void delete(ReplyVO vo) throws Exception {
	    dao.delete(vo);
	}
}
