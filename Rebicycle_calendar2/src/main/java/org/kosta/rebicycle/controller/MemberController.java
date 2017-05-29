package org.kosta.rebicycle.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	private String uploadPath="C:\\Users\\kosta\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\";
	//private String uploadPath="C:\\Users\\소영\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\";
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
		
		System.out.println(vo);
	
		MultipartFile file = vo.getUploadFile();
		String fileExt = ""; //확장자
        String fileName = file.getOriginalFilename();  
        int i = -1;
        //fileName.indexOf() : .이 있는 곳의 index를 받아와서 확장자와 파일명을 지정한다.
        if(( i = fileName.indexOf(".")) != -1){ 
              fileExt = fileName.substring(i);
              fileName = fileName.substring(0,i);
        }
		uploadPath += "member\\"+ vo.getId() + fileExt;
		//System.out.println(uploadPath);
		if(file.isEmpty()==false){
			File uploadFile = new File(uploadPath);
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		vo.setPicture(vo.getId()+fileExt);
		memberService.registerMember(vo);
		uploadPath = "";
		return "redirect:home.do";
	}
	@RequestMapping(method=RequestMethod.POST,value="memberIdcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {		
		int count=memberService.idcheck(id);
		//System.out.println(count);
		return (count==0) ? "ok":"fail"; 		
	}
	
	
	@RequestMapping("memberModifyForm.do")
	public String memberModifyView(HttpServletRequest request,Model model){
		//System.out.println("회원정보수정Controller");
		HttpSession session=request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");//세션에서 아이디정보 가져옴
		MemberVO modifyVO = memberService.findMemberById(mvo.getId());
		
		//System.out.println("수정할 vo : "+modifyVO);
		
		if(modifyVO !=null){
			model.addAttribute("modifyVO", modifyVO);
		}
		return "member/member_modify_form.tiles";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="memberModify.do")
	public String memberModify(MemberVO vo, HttpServletRequest request){
		//System.out.println("memberModify"+vo.getUploadFile());
		
		//만약 파일을 변경한 경우
		if(vo.getUploadFile() != null){
			MultipartFile file = vo.getUploadFile();
			String fileExt = ""; //확장자
	        String fileName = file.getOriginalFilename();  
	        int i = -1;
	        //fileName.indexOf() : .이 있는 곳의 index를 받아와서 확장자와 파일명을 지정한다.
	        if(( i = fileName.indexOf(".")) != -1){ 
	              fileExt = fileName.substring(i);
	              fileName = fileName.substring(0,i);
	        }
			uploadPath += "member\\"+vo.getId() + fileExt;
			//System.out.println(uploadPath);
			if(file.isEmpty()==false){
				File uploadFile = new File(uploadPath);
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			vo.setPicture(vo.getId()+fileExt);
			//System.out.println("바뀐파일의경우" + vo);
			
			memberService.memberModify(vo);
		}else{
			//파일변경안한경우
			//System.out.println("기존파일인경우" + vo);
			memberService.memberModify(vo);
		}
		
		

		MemberVO newVO = memberService.findMemberById(vo.getId());
		HttpSession session = request.getSession(false);
		session.setAttribute("mvo", newVO);
		return "redirect:home.do";
	}
	
	
}
