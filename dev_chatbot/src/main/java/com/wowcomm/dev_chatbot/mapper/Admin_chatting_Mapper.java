package com.wowcomm.dev_chatbot.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Admin_chatting_VO;

@Mapper
public interface Admin_chatting_Mapper {
	// 게시글 생성
	public int insert_admin_chatting(Admin_chatting_VO params);	
	
	public ArrayList<Admin_chatting_VO> getList_admin_Chatting();
}
