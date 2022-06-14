package com.wowcomm.dev_chatbot.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.BoardVO;

@Mapper
public interface BoardMapper {
	// 게시글 생성
	public int insertBoard(BoardVO params);	
}
