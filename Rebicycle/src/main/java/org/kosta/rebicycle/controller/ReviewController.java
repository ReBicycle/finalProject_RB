package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.service.BicycleServiceImpl4;
import org.kosta.rebicycle.model.service.BicycleServiceImpl5;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Resource
	private BicycleServiceImpl3 serviceImpl3;
	@Resource
	private BicycleServiceImpl4 serviceImpl4;
	@Resource
	private BicycleServiceImpl5 serviceImpl5;
	@RequestMapping( "writeReview.do")
	public String writeReview(int bicycleNo, String content, int star, HttpServletRequest request){
		System.out.println(bicycleNo+" "+content+" "+star);
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("mvo");
		if(memberVO==null)
			return "redirect:/home.do";
		RentVO rentVO = serviceImpl5.findRentVOForReview(memberVO.getId(),bicycleNo);
		//findRentVOByBicycleNoAndMemberId- state1번인거&가장 최근꺼 한개
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRentVO(rentVO);
		reviewVO.setStar(star);
		reviewVO.setContent(content);
		System.out.println(reviewVO);
		serviceImpl5.writeReview(reviewVO);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	
}
