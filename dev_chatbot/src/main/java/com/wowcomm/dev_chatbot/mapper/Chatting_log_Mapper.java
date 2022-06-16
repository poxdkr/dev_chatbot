package com.wowcomm.dev_chatbot.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Chatting_log_Mapper {
	
	//total user_cnt 집계
	int getTotalUser_cnt();
	//weekly user_cnt 집계
	int getUser_cnt(HashMap<String, String> days);
	//weekly chat_cnt 집계
	int getChat_cnt(HashMap<String, String> days);
	//weekly miss_cnt 집계
	int getMiss_cnt(HashMap<String, String> days);
	
	//weekly user_cnt
	int getWeekUser_cnt(HashMap<String, String> days);
	
	//weekly caht_cnt
	int getWeekChat_cnt(HashMap<String, String> days);
	
	//weekly missed chat_cnt
	int getWeekMiss_cnt(HashMap<String, String> days);
	
	//weekly getCnt by Keyword
	int getCountByKeyword_week(HashMap<String, String> days);
}
