package org.kosta.rebicycle.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.BicycleService;
import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	//종봉
	//String uploadPath="C:\\Users\\Administrator\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\";
	@Resource
	private MemberService memberService;
	@Resource
	private BicycleService service;

	@RequestMapping("login_fail.do")
    public String loginFail(){
    	return "member/login_fail.tiles";
    }
	
	/*@RequestMapping(method=RequestMethod.POST,value="login.do")
	public String login(MemberVO mvo, HttpServletRequest request){
		System.out.println("sdadsads login.do");
		MemberVO loginVO = memberService.login(mvo);
		HttpSession session = request.getSession();
		String path = "";
		if(loginVO !=null){
			session.setAttribute("mvo", loginVO);
			System.out.println("로그인성공");
<<<<<<< HEAD
			
			if(session!=null){
				MemberVO vo=(MemberVO) session.getAttribute("mvo");
				//각각의 요청을 구분하기 위해 따로 받음
				int findGetRequest=service.findGetRequest(vo.getId());
				int findAcceptRequest=service.findAcceptRequest(vo.getId());
				int findRefuseRequest=service.findRefuseRequest(vo.getId());
				int Total=findGetRequest+findAcceptRequest+findRefuseRequest;
				
				HashMap<String, Integer> totalRequest=new HashMap<>();
				
				totalRequest.put("findGetRequest", findGetRequest);
				totalRequest.put("findAcceptRequest", findAcceptRequest);
				totalRequest.put("findRefuseRequest", findRefuseRequest);
				totalRequest.put("total", Total);
				
				session.setAttribute("totalRequest", totalRequest);
				System.out.println("test       "+totalRequest);
			}
			
=======
			if(session!=null){
				MemberVO vo=(MemberVO) session.getAttribute("mvo");
				//각각의 요청을 구분하기 위해 따로 받음
				System.out.println("2020202020 : " +vo.getId());
				int findGetRequest=service.findGetRequest(vo.getId());
				
				int findAcceptRequest=service.findAcceptRequest(vo.getId());
				int findRefuseRequest=service.findRefuseRequest(vo.getId());
				int Total=findGetRequest+findAcceptRequest+findRefuseRequest;
				
				HashMap<String, Integer> totalRequest=new HashMap<>();
				
				totalRequest.put("findGetRequest", findGetRequest);
				totalRequest.put("findAcceptRequest", findAcceptRequest);
				totalRequest.put("findRefuseRequest", findRefuseRequest);
				totalRequest.put("total", Total);
				
				session.setAttribute("totalRequest", totalRequest);
				System.out.println("test       "+totalRequest);
			}
>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git
			path = "redirect:home.do";
		}else{
			path = "member/login_fail";
		}
		
		
		
		return path;
	}*/
	
	@RequestMapping("member/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
			session.invalidate();
		return "home.tiles";
	}

	
	
	@RequestMapping(method=RequestMethod.POST, value = "memberRegister.do")
	public String memberRegister(MemberVO vo, HttpServletRequest request, String roadAddress, String jibunAddress, String detailAddress){
		
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
		vo.setAddress(roadAddress + "%" + jibunAddress + "%" + detailAddress);
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
	
	
	@RequestMapping("member/memberModifyForm.do")
	public String memberModifyView(HttpServletRequest request,Model model){
		//System.out.println("회원정보수정Controller");
		HttpSession session=request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");//세션에서 아이디정보 가져옴
		MemberVO modifyVO = memberService.findMemberById(mvo.getId());
		
		String[] address = modifyVO.getAddress().split("%");
		String roadAddress = address[0];
		String jibunAddress = address[1];
		String detailAddress = address[2];
		
		if(modifyVO !=null){
			model.addAttribute("modifyVO", modifyVO);
		}
		
		model.addAttribute("roadAddress", roadAddress);
		model.addAttribute("jibunAddress", jibunAddress);
		model.addAttribute("detailAddress", detailAddress);
		
		return "member/member_modify_form.tiles";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="member/memberModify.do")
	public String memberModify(MemberVO vo, HttpServletRequest request, String roadAddress, String jibunAddress, String detailAddress){
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
		}
		
		String newAddress = roadAddress + "%" + jibunAddress + "%" + detailAddress;
		vo.setAddress(newAddress);
		memberService.memberModify(vo);
		MemberVO newVO = memberService.findMemberById(vo.getId());
		HttpSession session = request.getSession(false);
		session.setAttribute("mvo", newVO);
		return "redirect:../home.do";
	}
	
	@RequestMapping("member/passwordCheck.do")
	public String passwordCheck(String memberId, int bicycleNo, String password, Model model){
		MemberVO mvo = memberService.findMemberById(memberId);
		if(mvo.getPassword().equals(password)){
			model.addAttribute("memberId", memberId);
			model.addAttribute("bicycleNo", bicycleNo);
			return "redirect:../bicycle/deleteBicycle.do"; 			
		} else {
			return "member/member_password_check_fail.tiles";
		}
	}
	
	
}
