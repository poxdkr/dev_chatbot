package com.wowcomm.dev_chatbot.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Customer_qa_comment_VO;

@Mapper
public interface Customer_qa_comment_Mapper {
	ArrayList<Customer_qa_comment_VO> recently_customer_qa_comment(); //10개까지 조회
	
	Customer_qa_comment_VO getCommentByNo(int comment_no);
}
