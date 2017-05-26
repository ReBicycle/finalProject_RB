package org.kosta.rebicycle.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BicycleController {
	@Resource
	private BicycleServiceImpl1 serviceImpl1;
	
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	@Transactional
	public String registerBicycle(BicycleVO bvo, String memberId, int categoryNo, CalendarVO cvo){
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryNo(categoryNo);
		serviceImpl1.registerBicycle(bvo);
		serviceImpl1.registerPossibleDate(cvo);
		return "bicycle/bicycle_register_result.tiles";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "calculatePrice.do")
	@ResponseBody
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		calList = serviceImpl1.calculatePrice(categoryNo);
		return calList;
	}
	
	
}
