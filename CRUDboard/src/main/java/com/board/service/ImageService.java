package com.board.service;

import org.springframework.web.multipart.MultipartFile;

import com.board.domain.BoardImageVO;

//사진 첨부 로직
public interface ImageService {
	
	public String saveBoardImage(MultipartFile file) throws Exception;
	
	public void insertBoardImage(BoardImageVO boardImageVO) throws Exception;
}
