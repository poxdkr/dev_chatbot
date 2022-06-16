package com.wowcomm.dev_chatbot.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.wowcomm.dev_chatbot.VO.Scenario_main_info_VO;

@Mapper
public interface Scenario_main_info_Mapper {
	int cnt_scenario_main_info();
	
	Scenario_main_info_VO getScene_By_scn_code(String scn_code);
}
