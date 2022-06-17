package com.wowcomm.dev_chatbot.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.G5_member_VO;

@Mapper
public interface G5_member_Mapper {
	
	//로그인 시 한명의 정보 불러오기
	public G5_member_VO check_Member_login(String params); //id로 member 찾기
	
	public ArrayList<G5_member_VO> Member_List(); //id로 member 찾기
	
	public void insert_Member(G5_member_VO params);
	
	public void password_change(HashMap<String, String> infoMaps);
}
