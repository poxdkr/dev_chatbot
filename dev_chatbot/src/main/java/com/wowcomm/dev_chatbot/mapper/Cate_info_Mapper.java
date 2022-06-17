package com.wowcomm.dev_chatbot.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Cate_info_VO;

@Mapper
public interface Cate_info_Mapper {
	int cnt_cate_info();
	
	ArrayList<Cate_info_VO> getCate_info_All();
	
	Cate_info_VO get_q_disp_name_By_Q_type(int q_type);

}
