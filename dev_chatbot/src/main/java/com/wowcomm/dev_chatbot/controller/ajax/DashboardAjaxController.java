package com.wowcomm.dev_chatbot.controller.ajax;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.mapper.Chatting_log_Mapper;

@Controller
public class DashboardAjaxController {
	
	@Autowired
	private Chatting_log_Mapper chatting_log_Mapper; 
	
	@RequestMapping("getUser_cnt")
	@ResponseBody
	public int getUser_cnt(HttpServletRequest request) {
		
		int sday = Integer.parseInt(request.getParameter("sday"));
		int eday = Integer.parseInt(request.getParameter("eday"));
		
		HashMap<String, Integer> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int user_cnt = chatting_log_Mapper.getUser_cnt(days);
		
		return user_cnt;
	}
	
	@RequestMapping("getChat_cnt")
	@ResponseBody
	public int getChat_cnt(HttpServletRequest request) {
		
		int sday = Integer.parseInt(request.getParameter("sday"));
		int eday = Integer.parseInt(request.getParameter("eday"));
		
		HashMap<String, Integer> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int chat_cnt = chatting_log_Mapper.getChat_cnt(days);
		
		return chat_cnt;
	}
	
	@RequestMapping("getTotalUser_cnt")
	@ResponseBody
	public int getTotalUser_cnt(HttpServletRequest request) {
		
		int t_user_cnt = chatting_log_Mapper.getTotalUser_cnt();
		
		return t_user_cnt;
	}
	
	
}
