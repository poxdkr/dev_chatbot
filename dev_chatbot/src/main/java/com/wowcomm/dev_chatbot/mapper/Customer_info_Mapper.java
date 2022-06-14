package com.wowcomm.dev_chatbot.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Customer_info_VO;

@Mapper
public interface Customer_info_Mapper {
	//아이디로 하나의 회원정보 찾기
	Customer_info_VO getUser_info(String user_id);
}
