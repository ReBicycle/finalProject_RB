package org.kosta.rebicycle.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.BicycleServiceImpl4;
import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@Resource
	private MemberService memberService;
	
	@Resource
	private BicycleServiceImpl4 bicycleService4;
	
	@RequestMapping("mypage/mypage_main.do")
	public String mypageMain(HttpServletRequest request,Model model){
		System.out.println("mypageMainController");
		HttpSession session = request.getSession(false);
		//아이디로 회원정보 불러오기
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		MemberVO findVO = memberService.findMemberById(vo.getId());
		model.addAttribute("findVO", findVO);
		
		//아이디로 등록한 자전거 정보 불러오기
		//등록한 자전거가 여러개일 수도 있기 때문에 리스트로 받기
		ArrayList<BicycleVO> registerList = (ArrayList<BicycleVO>) bicycleService4.findBicycleById(vo.getId());
		model.addAttribute("registerList", registerList);
		
		//내가빌린내역 불러오기
		ArrayList<RentVO> rentList = (ArrayList<RentVO>) bicycleService4.findRentById(vo.getId());
		model.addAttribute("rentList", rentList);
		
		return "mypage/mypage_main.tiles";
	}
}
