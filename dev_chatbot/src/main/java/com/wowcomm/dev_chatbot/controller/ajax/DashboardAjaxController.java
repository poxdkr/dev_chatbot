package com.wowcomm.dev_chatbot.controller.ajax;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.mapper.Chatting_log_Mapper;
import com.wowcomm.dev_chatbot.mapper.Customer_info_visit_time_Mapper;

@Controller
public class DashboardAjaxController {
	
	@Autowired
	private Chatting_log_Mapper chatting_log_Mapper; 
	
	@Autowired
	private Customer_info_visit_time_Mapper customer_info_visit_time_Mapper; 
	
	@RequestMapping("getUser_cnt")
	@ResponseBody
	public int getUser_cnt(HttpServletRequest request) {
		
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		String dayofweek = request.getParameter("dayofweek");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		days.put("dayofweek", dayofweek);
		
		int user_cnt = chatting_log_Mapper.getUser_cnt(days);
		
		return user_cnt;
	}
	
	@RequestMapping("getChat_cnt")
	@ResponseBody
	public int getChat_cnt(HttpServletRequest request) {
		
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		String dayofweek = request.getParameter("dayofweek");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		days.put("dayofweek", dayofweek);
		
		int chat_cnt = chatting_log_Mapper.getChat_cnt(days);
		
		return chat_cnt;
	}
	
	@RequestMapping("getTotalUser_cnt")
	@ResponseBody
	public int getTotalUser_cnt(HttpServletRequest request) {
		
		int t_user_cnt = chatting_log_Mapper.getTotalUser_cnt();
		
		return t_user_cnt;
	}
	
	@RequestMapping("getMiss_cnt")
	@ResponseBody
	public int getMiss_cnt(HttpServletRequest request) {
		
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		String dayofweek = request.getParameter("dayofweek");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		days.put("dayofweek", dayofweek);
		
		int miss_cnt = chatting_log_Mapper.getMiss_cnt(days);
		
		return miss_cnt;
	}
	
	@RequestMapping("getSum_visit_time")
	@ResponseBody
	public int getSum_visit_time(HttpServletRequest request) {
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int stime = customer_info_visit_time_Mapper.getSum_visit_time(days);
		
		return stime;
	}
	
	@RequestMapping("getWeekUser_cnt")
	@ResponseBody
	public int getWeekUser_cnt(HttpServletRequest request) {
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int w_user_cnt = chatting_log_Mapper.getWeekUser_cnt(days);
		
		return w_user_cnt;
	}
	@RequestMapping("getWeekChat_cnt")
	@ResponseBody
	public int getWeekChat_cnt(HttpServletRequest request) {
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int w_chat_cnt = chatting_log_Mapper.getWeekChat_cnt(days);
		
		return w_chat_cnt;
	}
	
	@RequestMapping("getWeekMiss_cnt")
	@ResponseBody
	public int getWeekMiss_cnt(HttpServletRequest request) {
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		
		HashMap<String, String> days = new HashMap<>();
		days.put("sday", sday);
		days.put("eday", eday);
		
		int w_miss_cnt = chatting_log_Mapper.getWeekMiss_cnt(days);
		
		return w_miss_cnt;
	}
	
	@RequestMapping("getCountByKeyword_week")
	@ResponseBody
	public int getCountByKeyword_week(HttpServletRequest request) {
		String sday = request.getParameter("sday");
		String eday = request.getParameter("eday");
		String keyword = request.getParameter("keyword");
		
		HashMap<String, String> maps = new HashMap<>();
		maps.put("sday", sday);
		maps.put("eday", eday);
		maps.put("keyword", keyword);
		
		int cnt = chatting_log_Mapper.getCountByKeyword_week(maps);
		
		return cnt;
	}
	
	
}
