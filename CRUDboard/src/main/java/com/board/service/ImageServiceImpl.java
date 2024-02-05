package com.board.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.board.dao.ImageDAO;
import com.board.domain.BoardImageVO;

//사진 첨부
@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	ImageDAO dao;
	
	@Value("${file.upload-dir}")
	String fileUploadDir;
	
	@Override
	@Transactional
	public void insertBoardImage(BoardImageVO boardImageVO) throws Exception {
		dao.insertBoardImage(boardImageVO);
	}

	@Override
	public String saveBoardImage(MultipartFile file) throws Exception {
		
		if (file.isEmpty()) {
			throw new Exception("파일이 비어 있습니다.");
		}
		String originalFileName = file.getOriginalFilename();
		String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-","") + fileExtension;
		Path copyLocation = Paths.get(fileUploadDir + File.separator + storedFileName);
		
		Files.copy(file.getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
        
		return copyLocation.toString();
	}
	

}
