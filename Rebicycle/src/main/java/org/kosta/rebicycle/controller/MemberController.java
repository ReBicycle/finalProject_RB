package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("login.do")
	public String login(MemberVO mvo, HttpServletRequest request){
		System.out.println("login.do");
		MemberVO loginVO = memberService.login(mvo);
		HttpSession session = request.getSession();
		String path = "";
		if(loginVO !=null){
			session.setAttribute("mvo", loginVO);
			System.out.println("로그인성공");
			//path = "redirect:home.do";
		}else{
			//path = "member/login_fail";
		}
		return path;
	}
}
