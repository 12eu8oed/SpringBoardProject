package com.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.dao.ImageDAO;
import com.board.domain.BoardImageVO;

//사진 첨부
@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	ImageDAO dao;
	
	@Override
	@Transactional
	public void insertBoardImage(BoardImageVO boardImageVO) throws Exception {
		dao.insertBoardImage(boardImageVO);
	}

}
