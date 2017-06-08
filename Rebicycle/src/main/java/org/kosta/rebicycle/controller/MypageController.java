package org.kosta.rebicycle.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.service.BicycleServiceImpl4;
import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	@Resource
	private MemberService memberService;
	
	@Resource
	private BicycleServiceImpl4 bicycleService4;
	@Resource
	private BicycleServiceImpl3 bicycleService3;
	
	@RequestMapping("mypage/mypage_main.do")
	public String mypageMain(HttpServletRequest request,Model model){
		//System.out.println("mypageMainController");
		HttpSession session = request.getSession(false);
		//아이디로 회원정보 불러오기
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		MemberVO findVO = memberService.findMemberById(vo.getId());
		model.addAttribute("findVO", findVO);
		
		//아이디로 등록한 자전거 정보 불러오기
		//등록한 자전거가 여러개일 수도 있기 때문에 리스트로 받기
		ArrayList<BicycleVO> registerList = (ArrayList<BicycleVO>) bicycleService4.findBicycleById(vo.getId());
		model.addAttribute("registerList", registerList);
		
		/*//내가빌린내역 불러오기
		ArrayList<RentVO> rentList = (ArrayList<RentVO>) bicycleService4.findRentById(vo.getId());
		System.out.println(rentList);
		model.addAttribute("rentList", rentList);
		model.addAttribute("rentList", rentList);*/
		
		//요청 리스트 - 다른 사람이 요청한 내역 - bicycleVO의 memberId가 내 아이디인 rent정보 
		ArrayList<RentVO> rentRequestList = (ArrayList<RentVO>) bicycleService4.findRentRequestById(vo.getId());
		model.addAttribute("rentRequestList", rentRequestList);
		//System.out.println(rentRequestList);
		return "mypage/mypage_main.tiles";
	}

	
	
	@RequestMapping("getRentByBicycleNo.do")
	@ResponseBody 
	public ArrayList<RentVO> getRentByBicycleNo(String bicycleNo){
		
		ArrayList<RentVO> rList = (ArrayList<RentVO>)bicycleService4.getRentByBicycleNo(Integer.parseInt(bicycleNo));
		System.out.println("rList" + rList);
		return rList;
	}
	
	@RequestMapping("rentOk.do")
	@Transactional
	public String rentOk(String rentNo){
		//System.out.println("rentOK" + rentNo);
		RentVO rvo = bicycleService4.findRentByRentNo(Integer.parseInt(rentNo));
		//System.out.println("rentOK rvo" + rvo);
		bicycleService4.updateRentByRentNo(rentNo);
		//t
		bicycleService4.deleteRentedDay(rvo);
		return "redirect:mypage/mypage_main.do";
	}

	

}
