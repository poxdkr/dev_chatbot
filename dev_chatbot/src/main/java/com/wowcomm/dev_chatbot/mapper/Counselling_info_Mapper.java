package com.wowcomm.dev_chatbot.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Counselling_info_VO;

@Mapper
public interface Counselling_info_Mapper {
	
	int cnt_counselling_info();
	
	ArrayList<Counselling_info_VO> getSearchResult(HashMap<String, String> map);
	
}
