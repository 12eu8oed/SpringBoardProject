package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.BoardVO;
import com.board.service.ImageService;

@Controller
@RequestMapping("/board/*")
public class ImageController {

	@Inject
	private ImageService imageservice;


}
