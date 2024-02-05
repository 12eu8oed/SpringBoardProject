package com.board.service;

import com.board.domain.BoardImageVO;

//사진 첨부 로직
public interface ImageService {
	public void insertBoardImage(BoardImageVO boardImageVO) throws Exception;
}
