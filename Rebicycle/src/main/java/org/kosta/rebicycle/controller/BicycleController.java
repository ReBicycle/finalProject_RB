package org.kosta.rebicycle.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.service.BicycleServiceImpl2;
import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
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
	public String registerBicycle(BicycleVO bvo, String memberId, int categoryNo, CalendarVO cvo, String roadAddress, String jibunAddress, String detailAddress){
		System.out.println("자전거 등록");
		bvo.setMemberVO(new MemberVO(memberId));
		//bvo.setCategoryNo(categoryNo);
		System.out.println(categoryNo);
		bvo.getCategoryVO().setCategoryNo(categoryNo);		
		String address = roadAddress + "," + jibunAddress + "/" + detailAddress;
		bvo.setAddress(address);
		serviceImpl1.registerBicycle(bvo, cvo);
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
