package com.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardImageVO;

//사진 첨부
@Repository
public class ImageDAOImpl implements ImageDAO{
	
	@Autowired
	private SqlSession sql;
	private static String namespace = "com.board.mappers.image"; 
	
	@Override
	public void insertBoardImage(BoardImageVO boardImagevo) throws Exception {
		sql.insert(namespace + ".insertBoardImage", boardImagevo);
	}
	
}
