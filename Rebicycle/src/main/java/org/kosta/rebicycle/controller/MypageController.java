package org.kosta.rebicycle.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.BicycleService;
import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
public class MypageController {
	@Resource
	private MemberService memberService;	
	@Resource
	private BicycleService bicycleService;
	
	@RequestMapping("mypage/mypage_main.do")
	public String mypageMain(HttpServletRequest request,Model model){
		//System.out.println("mypageMainController");
		HttpSession session = request.getSession(false);
		this.notice();
		//아이디로 회원정보 불러오기
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		MemberVO findVO = memberService.findMemberById(vo.getId());
		model.addAttribute("findVO", findVO);
		
		//아이디로 등록한 자전거 정보 불러오기
		//등록한 자전거가 여러개일 수도 있기 때문에 리스트로 받기
		ArrayList<BicycleVO> registerList = (ArrayList<BicycleVO>) bicycleService.findBicycleById(vo.getId());
		model.addAttribute("registerList", registerList);

		//내가빌린내역 불러오기
		ArrayList<RentVO> rentList = (ArrayList<RentVO>) bicycleService.findRentById(vo.getId());
		System.out.println("rentListTest" + rentList);
		model.addAttribute("rentList", rentList);
		
		//거래 성공 내역-빌려준 내역
		ArrayList<RentVO> rentSuccessAllList = (ArrayList<RentVO>) bicycleService.findRentSuccessById(vo.getId());
		model.addAttribute("rentSuccessAllList", rentSuccessAllList);
		
		//요청 리스트 - 다른 사람이 요청한 내역 - bicycleVO의 memberId가 내 아이디인 rent정보 
		ArrayList<RentVO> rentRequestAllList = (ArrayList<RentVO>) bicycleService.findRentRequestById(vo.getId());
		model.addAttribute("rentRequestAllList", rentRequestAllList);
		
		//찜한 자전거 리스트
		ArrayList<BicycleVO> heartList = (ArrayList<BicycleVO>)bicycleService.getHeartList(vo.getId());
		System.out.println(heartList);
		model.addAttribute("heartList", heartList);
		
		return "mypage/mypage_main.tiles";
	}

	
	//요청리스트 ajax
	@RequestMapping("getRentByBicycleNo.do")
	@ResponseBody 
	public ArrayList<RentVO> getRentByBicycleNo(String bicycleNo){
		ArrayList<RentVO> rList = (ArrayList<RentVO>)bicycleService.getRentByBicycleNo(Integer.parseInt(bicycleNo));
		//System.out.println("rList" + rList);
		return rList;
	}
	
	
	@RequestMapping("getRentAll.do")
	@ResponseBody
	public ArrayList<RentVO> getRentAll(String id){
		ArrayList<RentVO> rentRequestAllList = (ArrayList<RentVO>) bicycleService.findRentRequestById(id);
		return rentRequestAllList;
		
	}	
		
	//빌려준 내역 ajax
	@RequestMapping("getRentSuccess.do")
	@ResponseBody
	public ArrayList<RentVO> getRentSuccess(String bicycleNo){
		//빌려준내역
		ArrayList<RentVO> rentSuccessList = (ArrayList<RentVO>) bicycleService.findRentSuccessByBicycleNo(Integer.parseInt(bicycleNo));
		//model.addAttribute("rentSuccessList",rentSuccessList);
		return rentSuccessList;
	}
	
	@RequestMapping("getRentSuccessAll.do")
	@ResponseBody
	public ArrayList<RentVO> getRentSuccessAll(String id){
		ArrayList<RentVO> rentSuccessAllList = (ArrayList<RentVO>) bicycleService.findRentSuccessById(id);
		return rentSuccessAllList;
	}
	
	
	@RequestMapping("rentOk.do")
	@Transactional
	public String rentOk(String rentNo){
		System.out.println("*******************test*******************");
		//System.out.println("test       rentOk    "+rentNo);
		
		RentVO rvo = bicycleService.findRentByRentNo(Integer.parseInt(rentNo));
		// select rentNo,bicycleNo, renterId, startDay, endDay
		bicycleService.updateRentByRentNo(rentNo);//state == 1로 바꾸는거
		
		bicycleService.deleteRentedDay(rvo);//자전거 가능일 수정
		
		//다른 요청을 바뀐 possible과 비교
		
		//rvo의 bicycleVO의 bicycleNO로 들어온 요청리스트를 찾아서
		//ArrayList<RentVO> rList = (ArrayList<RentVO>)bicycleService.getRentByBicycleNo(Integer.parseInt(bicycleNo));
		//rList에 있는 다른 요청들을 bicycleVO의 Possible과 다시 비교
		//비교 결과, 불가능인 요청의 상태를 2로 바꿈
		int bicycleNo = rvo.getBicycleVO().getBicycleNo();
		ArrayList<RentVO> otherList = (ArrayList<RentVO>)bicycleService.getRentByBicycleNo(bicycleNo);
		bicycleService.checkState(otherList);
		return "redirect:mypage/mypage_main.do";
	}

	@RequestMapping("deleteRent.do")
	public String deleteRent(String rentNo){
		bicycleService.deleteRent(Integer.parseInt(rentNo));
		return "redirect:mypage/mypage_main.do";
	}
	
	public void notice(){
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof MemberVO){
			HttpSession session = request.getSession();
			
			MemberVO pvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			session.setAttribute("mvo", pvo);
			int findGetRequest=bicycleService.findGetRequest(pvo.getId());
			
			int findAcceptRequest=bicycleService.findAcceptRequest(pvo.getId());
			int findRefuseRequest=bicycleService.findRefuseRequest(pvo.getId());
			int Total=findGetRequest+findAcceptRequest+findRefuseRequest;
			
			HashMap<String, Integer> totalRequest=new HashMap<>();
			
			totalRequest.put("findGetRequest", findGetRequest);
			totalRequest.put("findAcceptRequest", findAcceptRequest);
			totalRequest.put("findRefuseRequest", findRefuseRequest);
			totalRequest.put("total", Total);
			
			session.setAttribute("totalRequest", totalRequest);
		}
	}
}
