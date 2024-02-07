package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.service.ImageService;

@Controller
//@RequestMapping("/board/*")
public class ImageController {
	
	
	@Autowired
	private ImageService imageservice;
	
	@RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public String insertBoardImage(@RequestParam("filePath") MultipartFile file, Model model) {
		
		System.out.println("ImageController Log");
		
		return "redirect:/board/listPageSearch?num=1";

	}

}
