package com.wowcomm.dev_chatbot.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Chatting_log_Mapper {
	
	//total user_cnt 집계
	int getTotalUser_cnt();
	//weekly user_cnt 집계
	int getUser_cnt(HashMap<String, Integer> days);
	//weekly chat_cnt 집계
	int getChat_cnt(HashMap<String, Integer> days);
}
