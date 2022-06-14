package com.wowcomm.dev_chatbot.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.wowcomm.dev_chatbot.VO.Admin_chatting_VO;
import com.wowcomm.dev_chatbot.VO.G5_member_VO;
import com.wowcomm.dev_chatbot.mapper.Admin_chatting_Mapper;
import com.wowcomm.dev_chatbot.mapper.G5_member_Mapper;

@Controller
public class TestController {
	
	@Autowired
	private Admin_chatting_Mapper admin_chatting_Mapper;
	
	@Autowired
	private G5_member_Mapper g5_member_mapper;
	
	@GetMapping("tester")
	public String openTestPage(ArrayList<Admin_chatting_VO> acList, ArrayList<G5_member_VO> mList) {
		//list select
		acList = admin_chatting_Mapper.getList_admin_Chatting();
		
		mList = g5_member_mapper.Member_List();
		
		System.out.println(acList);
		System.out.println(mList);
		
		return "admin/tester";
	}
	
	@PostMapping("testWrite_admin_chatting")
	public String testWrite(Admin_chatting_VO param){
		//System.out.println("testWrite Controller");
		System.out.println(param);
		//write
		admin_chatting_Mapper.insert_admin_chatting(param);
		
		return "admin/tester";
	}
	
	@PostMapping("testWrite_g5_member")
	public String testWrite_member(G5_member_VO param){
		//System.out.println("testWrite Controller");
		System.out.println(param);
		
		//비밀번호 암호화
		param.setMb_password(new BCryptPasswordEncoder().encode(param.getMb_password()));
		System.out.println(param);
		//write member
		g5_member_mapper.insert_Member(param);
		
		return "admin/tester";
	}
}
