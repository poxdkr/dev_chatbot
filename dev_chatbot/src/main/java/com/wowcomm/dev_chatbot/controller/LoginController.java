package com.wowcomm.dev_chatbot.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
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
	
}
