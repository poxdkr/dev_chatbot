package com.wowcomm.dev_chatbot.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Customer_info_visit_time_Mapper {
	//weekly summary visit time
	int getSum_visit_time(HashMap<String, String> days);
}
