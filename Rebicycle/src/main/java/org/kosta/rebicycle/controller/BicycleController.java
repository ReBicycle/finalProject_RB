package org.kosta.rebicycle.controller;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
public class BicycleController {
	/*@Resource
	private BicycleServiceImpl1 serviceImpl1;
	
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	public String registerBicycle(BicycleVO bvo, String memberId, int categoryNo){
		System.out.println(categoryNo);
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryNo(categoryNo);
		System.out.println(bvo);
		serviceImpl1.registerBicycle(bvo);
		return "bicycle/bicycle_register_result.tiles";
	}
	*/
}
