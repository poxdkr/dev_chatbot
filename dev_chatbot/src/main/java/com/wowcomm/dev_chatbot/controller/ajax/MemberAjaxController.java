package com.wowcomm.dev_chatbot.controller.ajax;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.mapper.G5_member_Mapper;

@Controller
public class MemberAjaxController {
	
	@Autowired
	private G5_member_Mapper g5_member_Mapper; 
	
	@PostMapping("password_change")
	@ResponseBody
	public int password_changeAjax(HttpSession session, HttpServletRequest request) {
		String mb_Id = (String) session.getAttribute("mb_Id");
		String mb_password = new BCryptPasswordEncoder().encode(request.getParameter("pw1"));
		
		System.out.println(mb_Id);
		System.out.println(mb_password);
		
		HashMap<String, String> infoMaps = new HashMap<>(); 
		
		infoMaps.put("mb_id", mb_Id);
		infoMaps.put("mb_password", mb_password);
		try {
			g5_member_Mapper.password_change(infoMaps);
			return 1;
		}catch(Exception e) {
			System.out.println("정보변경에 실패");
			return 0;
		}
	}
	
}
