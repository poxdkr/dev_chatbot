package com.wowcomm.dev_chatbot.controller.ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.VO.Cate_info_VO;
import com.wowcomm.dev_chatbot.VO.Customer_info_VO;
import com.wowcomm.dev_chatbot.VO.Customer_qa_comment_VO;
import com.wowcomm.dev_chatbot.VO.Scenario_main_info_VO;
import com.wowcomm.dev_chatbot.mapper.Cate_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Customer_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Customer_qa_comment_Mapper;
import com.wowcomm.dev_chatbot.mapper.Scenario_main_info_Mapper;

@Controller
public class CommentAjaxController {
	
	@Autowired
	private Customer_qa_comment_Mapper customer_qa_comment_Mapper; 
	
	@Autowired
	private Cate_info_Mapper cate_info_Mapper;
	
	@Autowired
	private Customer_info_Mapper customer_info_Mapper;
	
	@Autowired
	private Scenario_main_info_Mapper scenario_main_info_Mapper;
	
	@RequestMapping("/getCommentByNo")
	@ResponseBody
	public Customer_qa_comment_VO getCommentByNo(Customer_qa_comment_VO cqvo) {
		
		Customer_qa_comment_VO resultCqvo = new Customer_qa_comment_VO();
		
		resultCqvo = customer_qa_comment_Mapper.getCommentByNo(cqvo.getComment_no());
			
		return resultCqvo;
	}
	
	@RequestMapping("/get_q_disp_name_By_Q_type")
	@ResponseBody
	public Cate_info_VO get_q_disp_name_By_Q_type(Cate_info_VO civo) {
		
		
		Cate_info_VO resultCivo = new Cate_info_VO();
		
		resultCivo =  cate_info_Mapper.get_q_disp_name_By_Q_type(civo.getQ_type());
		
		
		return resultCivo;
	}
	
	@RequestMapping("getUser_By_user_id")
	@ResponseBody
	public Customer_info_VO getUser_By_user_id(Customer_info_VO cvo) {
		
		Customer_info_VO resultCvo = new Customer_info_VO();
		
		resultCvo = customer_info_Mapper.getUser_info(cvo.getUser_id());
		
		return resultCvo;
	}
	
	@RequestMapping("getScene_By_scn_code")
	@ResponseBody
	public Scenario_main_info_VO getScene_By_scn_code(Scenario_main_info_VO smivo) {
		
		Scenario_main_info_VO resultSmivo = new Scenario_main_info_VO();
		
		resultSmivo = scenario_main_info_Mapper.getScene_By_scn_code(smivo.getScn_code());
		
		return resultSmivo;
	}

	
	
	
}
