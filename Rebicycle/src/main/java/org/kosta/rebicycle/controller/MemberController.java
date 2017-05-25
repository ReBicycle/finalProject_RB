package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	private String uploadPath;
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping(method=RequestMethod.POST,value="login.do")
	public String login(MemberVO mvo, HttpServletRequest request){
		System.out.println("login.do");
		MemberVO loginVO = memberService.login(mvo);
		HttpSession session = request.getSession();
		String path = "";
		if(loginVO !=null){
			session.setAttribute("mvo", loginVO);
			System.out.println("로그인성공");
			path = "redirect:home.do";
		}else{
			path = "member/login_fail";
		}
		return path;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return "home.tiles";
	}
	
	
	
	@RequestMapping(method=RequestMethod.POST, value = "memberRegister.do")
	public String memberRegister(MemberVO vo, HttpServletRequest request){
		//System.out.println(vo);
		uploadPath = "C:\\Users\\소영\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\";		
		
		memberService.registerMember(vo);
		return "redirect:home.do";
	}
	@RequestMapping(method=RequestMethod.POST,value="memberIdcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {		
		int count=memberService.idcheck(id);
		//System.out.println(count);
		return (count==0) ? "ok":"fail"; 		
	}
	
}
