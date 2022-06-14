package com.wowcomm.dev_chatbot.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wowcomm.dev_chatbot.VO.Customer_info_VO;
import com.wowcomm.dev_chatbot.VO.Customer_qa_comment_VO;
import com.wowcomm.dev_chatbot.VO.RecentCommentVO;
import com.wowcomm.dev_chatbot.mapper.Cate_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Counselling_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Customer_info_Mapper;
import com.wowcomm.dev_chatbot.mapper.Customer_qa_comment_Mapper;
import com.wowcomm.dev_chatbot.mapper.Keyword_Mapper;
import com.wowcomm.dev_chatbot.mapper.Scenario_main_info_Mapper;

@Controller
public class LoginController {
	
	@Autowired 
	private Counselling_info_Mapper counselling_info_Mapper; 
	
	@Autowired
	private Scenario_main_info_Mapper scenario_main_info_Mapper;
	
	@Autowired
	private Cate_info_Mapper cate_info_Mapper; 
	
	@Autowired
	private Keyword_Mapper keyword_Mapper; 
	
	@Autowired
	private Customer_qa_comment_Mapper customer_qa_comment_Mapper; 
	
	@Autowired
	private Customer_info_Mapper customer_info_Mapper; 
	
	@RequestMapping("/") //초기페이지 로그인으로 연결
	public String openAdminLogin() {
		//System.out.println("login 연결");
		return "admin/login";
	}

	
	@RequestMapping("/tester")
	public String openDenied() {
		return "admin/tester";
	}
	
	@RequestMapping("/views/login") //초기페이지 로그인으로 연결
	public String openAdminLog() {
		//System.out.println("login 연결");
		return "admin/loginTest";
	}
	
	@GetMapping("/index")
    public String viewLoginSuccessPage(@AuthenticationPrincipal User user, HttpSession session) {
		//로그인 성공시 세션에 성공한 유저의 ID 및 ROLE을 담도록 함.
        session.setAttribute("mb_Id", user.getUsername());
        session.setAttribute("mb_profile", user.getAuthorities());
        return "admin/index";
    }
	
	@GetMapping("/failure")
	public String viewFailure(Model model) throws IOException {
		model.addAttribute("error", "아이디 혹은 비밀번호가 맞지 않습니다.");
		//초기 화면으로 이동
		return "/admin/login";
	}
	@GetMapping("/dashboard")
	public String viewDashboard(Model model) throws IOException {
		
		//dashBoard에 필요한 DB Select 가져오기
		
		int counselling_info_cnt =  counselling_info_Mapper.cnt_counselling_info();
		int scenario_main_info__cnt = scenario_main_info_Mapper.cnt_scenario_main_info();
		int cate_info_cnt = cate_info_Mapper.cnt_cate_info();
		int keyword_cnt = keyword_Mapper.cnt_keyword();

		model.addAttribute("counselling_info_cnt",counselling_info_cnt);
		model.addAttribute("scenario_main_info__cnt",scenario_main_info__cnt);
		model.addAttribute("cate_info_cnt",cate_info_cnt);
		model.addAttribute("keyword_cnt",keyword_cnt);
		
		
		//최근 문의현황 LIST
		ArrayList<RecentCommentVO> recentCommentList = new ArrayList<>();
		
		//1) 최근 10개의 문의사항 찾기
		ArrayList<Customer_qa_comment_VO> cqcList = customer_qa_comment_Mapper.recently_customer_qa_comment();
		
		//2)for문을 이용하여 user_id를 조회
		for(Customer_qa_comment_VO cqc : cqcList) {
			RecentCommentVO rcvo = new RecentCommentVO();
			int comment_no = cqc.getComment_no();
			String user_id = cqc.getUser_id();
			
			SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			String regdate = sdf.format(cqc.getRegdate());
			
			Customer_info_VO userInfo =  customer_info_Mapper.getUser_info(user_id);
			
			String mobile = userInfo.getMobile();
			String name = userInfo.getName();
			String company_name = userInfo.getCompany_name();
			String gubun = userInfo.getGubun();
			
			rcvo.setComment_no(comment_no);
			rcvo.setUser_id(user_id);
			rcvo.setRegdate(regdate);
			rcvo.setMobile(mobile);
			rcvo.setName(name);
			rcvo.setCompany_name(company_name);
			rcvo.setGubun(gubun);
			
			recentCommentList.add(rcvo);
		}
		
		model.addAttribute("recent_comment_list",recentCommentList);
		
		
		return "/admin/include/dashboard";
	}
}
