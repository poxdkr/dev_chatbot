package com.wowcomm.dev_chatbot.controller.ajax;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.VO.Cate_info_VO;
import com.wowcomm.dev_chatbot.mapper.Cate_info_Mapper;

@Controller
public class ContentQuestionAjaxController {
	
	@Autowired
	Cate_info_Mapper cate_info_Mapper; 
	
	@RequestMapping("getCate_info_All")
	@ResponseBody
	public ArrayList<Cate_info_VO> getCate_info_All(ArrayList<Cate_info_VO> ctList){
		
		ctList = cate_info_Mapper.getCate_info_All();
		
		return ctList;
	}
	
}
