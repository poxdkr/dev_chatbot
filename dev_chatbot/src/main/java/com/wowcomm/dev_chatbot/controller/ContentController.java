package com.wowcomm.dev_chatbot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentController {
	
	
	//content.qa.comment 요청에따른 페이지 연결
	@GetMapping("/content.qa.comment")
	public String openContentQaComment(HttpServletRequest request){
		
		return "admin/content.qa.comment";
	}
	
	@GetMapping("/inc_chat")
	public String openInc_chat(HttpServletRequest request,Model model) {
		
		String mode = request.getParameter("mode");
		String cnt1 = request.getParameter("cnt1");
		String cnt2 = request.getParameter("cnt2");
		String cnt3 = request.getParameter("cnt3");
		String cnt4 = request.getParameter("cnt4");
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		
		model.addAttribute("mode",mode);
		model.addAttribute("cnt1",cnt1);
		model.addAttribute("cnt2",cnt2);
		model.addAttribute("cnt3",cnt3);
		model.addAttribute("cnt4",cnt4);
		model.addAttribute("sday",sday);
		model.addAttribute("eday",eday);
		
		
		return "admin/include/inc_chat";
	}
	
}
