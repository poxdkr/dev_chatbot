package com.wowcomm.dev_chatbot.controller.ajax;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wowcomm.dev_chatbot.VO.Cate_info_VO;
import com.wowcomm.dev_chatbot.VO.Counselling_info_VO;
import com.wowcomm.dev_chatbot.mapper.Cate_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Counselling_info_Mapper;

@Controller
public class ContentQuestionAjaxController {
	
	@Autowired
	Cate_info_Mapper cate_info_Mapper; 
	
	@Autowired
	Counselling_info_Mapper counselling_info_Mapper;
	
	@RequestMapping("getCate_info_All")
	@ResponseBody
	public ArrayList<Cate_info_VO> getCate_info_All(ArrayList<Cate_info_VO> ctList){
		
		ctList = cate_info_Mapper.getCate_info_All();
		
		return ctList;
	}
	
	@RequestMapping("result_content_question_list")
	@ResponseBody
	public ArrayList<Counselling_info_VO> result_content_question_list(HttpServletRequest request){
		//검색조건
		String sfl = request.getParameter("sfl");
		if(sfl.equals("")) {
			System.out.println("모든 조건으로 검색");
		}else {
			System.out.println("sfl 조건에 따라 검색");
		}
		//검색어
		String stx = request.getParameter("stx");
		if(stx.equals("")) {
			System.out.println("키워드 조건이 없는 것으로 검색");
		}else {
			System.out.println("키워드 조건으로 검색");
		}
		//나열 조건
		String sst = request.getParameter("sst");
		if(sst.equals("question_asc")) {
			System.out.println("ci_question asc 로 검색");
			sst = " ci_question asc ";
		}else if(sst.equals("question_desc")) {
			System.out.println("ci_question desc 로 검색");
			sst = " ci_question desc ";
		}else if(sst.equals("regdate_asc")) {
			System.out.println("ci_reg_date asc 로 검색");
			sst = " ci_reg_date desc ";
		}else if(sst.equals("regdate_desc")) {
			System.out.println("ci_reg_date desc 로 검색");
			sst = " ci_reg_date asc ";
		}else if(sst.equals("state_asc")) {
			System.out.println("state asc 로 검색");
			sst = " state asc ";
		}else {
			System.out.println("state desc 로 검색");
			sst = " state desc ";
		}
		
		
		//카테고리 확인
		String cate_name = request.getParameter("cate_name");
		if(cate_name.equals("")) {
			System.out.println("모든 카테고리로 검색");
		}
		//페이지 확인
		String page = request.getParameter("page");
		System.out.println("해당 조건의 "+page+"Page를 검색");
		
		int pageNum = Integer.parseInt(page);
		String pageStr = String.valueOf((pageNum*10)-10);
		
		
		//해당 조건을 HashMap에 담기
		HashMap<String, String> maps1 = new HashMap<String, String>();
		
		maps1.put("sfl", sfl);
		maps1.put("stx", "%"+stx+"%");
		maps1.put("sst", sst);
		maps1.put("cate_name", cate_name);
		maps1.put("page", pageStr);
		
		ArrayList<Counselling_info_VO> ciList = new ArrayList<Counselling_info_VO>();
		ciList = counselling_info_Mapper.getSearchResult(maps1);
		System.out.println(ciList);
		
		return ciList;
	}
	
	@RequestMapping("cnt_counselling_info")
	@ResponseBody
	public int cnt_counselling_info() {
		int result = counselling_info_Mapper.cnt_counselling_info();
		return result;
	}
}
