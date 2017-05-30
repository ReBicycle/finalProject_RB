package org.kosta.rebicycle.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.service.BicycleServiceImpl2;
import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.CategoryVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BicycleController {
	
	@Resource
	private BicycleServiceImpl1 serviceImpl1;
	@Resource
	private BicycleServiceImpl2 serviceImpl2;
	//정태형//////////////////
	@Resource
	private BicycleServiceImpl3 serviceImpl3;
	
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	public String registerBicycle(BicycleVO bvo,String memberId, int categoryNo, CalendarVO cvo, String roadAddress, String jibunAddress, String detailAddress,HttpServletRequest request){
		System.out.println("자전거 등록");
		System.out.println(memberId);
		System.out.println(bvo);
		bvo.setMemberVO(new MemberVO(memberId));
		//bvo.setCategoryNo(categoryNo);
		//System.out.println(categoryNo);
		bvo.setCategoryVO(new CategoryVO());
		bvo.getCategoryVO().setCategoryNo(categoryNo);
		System.out.println(bvo.getCategoryVO().getCategoryNo());
		String address = roadAddress + "," + jibunAddress + "/" + detailAddress;
		bvo.setAddress(address);
		// uploadPath 실제 운영시에 사용할 서버 업로드 경로
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		//개발시에는 워크스페이스 업로드 경로로 준다
		//종봉
		String uploadPath="C:\\Users\\Administrator\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\";
		//태형
		//String uploadPath="C:\\Users\\KOSTA\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\"; 
		serviceImpl1.registerBicycle(bvo, cvo, uploadPath);
		System.out.println(cvo);
		
		return "bicycle/bicycle_register_result.tiles";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "calculatePrice.do")
	@ResponseBody
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		calList = serviceImpl1.calculatePrice(categoryNo);
		return calList;
	}
	
	///현근
	@RequestMapping("findBicycleByNo.do")
	public String findBicycleByNo(String bicycleNo,Model model){
		int no=Integer.parseInt(bicycleNo);
		BicycleVO vo=serviceImpl3.findBicycleByNo(no);
		model.addAttribute("findBicycleResult", serviceImpl3.findBicycleByNo(no));
		return "bicycle/bicycle_detail.tiles";
	}
	
	
}
