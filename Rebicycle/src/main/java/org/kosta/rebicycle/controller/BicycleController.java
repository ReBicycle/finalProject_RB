package org.kosta.rebicycle.controller;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BicycleController {
	@Resource
	private BicycleServiceImpl1 serviceImpl1;
	@Resource
	private BicycleServiceImpl3 serviceImpl3;
	
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	public String registerBicycle(BicycleVO bvo, String memberId, int categoryNo){
		System.out.println(categoryNo);
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryNo(categoryNo);
		System.out.println(bvo);
		serviceImpl1.registerBicycle(bvo);
		return "bicycle/bicycle_register_result.tiles";
	}
	///현근
	@RequestMapping("findBicycleByNo.do")
	public String findBicycleByNo(String bicycleNo,Model model){
		int no=Integer.parseInt(bicycleNo);
		BicycleVO vo=serviceImpl3.findBicycleByNo(no);
		System.out.println("아이디    "+vo.getMemberVO().getId());
		//System.out.println("아이디            "+vo.getMemberVO().getId());
		model.addAttribute("findBicycleResult", serviceImpl3.findBicycleByNo(no));
		return "bicycle/bicycle_detail.tiles";
	}
	
}
