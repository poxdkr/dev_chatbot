package com.wowcomm.dev_chatbot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentController {
	
	
	//content.qa.comment 요청에따른 페이지 연결
	@GetMapping("/content.qa.comment")
	public String openContentQaComment(HttpServletRequest request){
		
		return "admin/content.qa.comment";
	}
	
}
