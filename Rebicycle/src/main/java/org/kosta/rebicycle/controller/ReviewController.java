package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleService;
import org.kosta.rebicycle.model.vo.HeartVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {
	@Resource
	private BicycleService serviceImpl;
	
	@RequestMapping( "writeReview.do")
	public String writeReview(int bicycleNo, String content, int star, HttpServletRequest request){
		System.out.println(bicycleNo+" "+content+" "+star);
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("mvo");
		if(memberVO==null)
			return "redirect:/home.do";
		RentVO rentVO = serviceImpl.findRentVOForReview(memberVO.getId(),bicycleNo);
		//findRentVOByBicycleNoAndMemberId- state1번인거&가장 최근꺼 한개
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRentVO(rentVO);
		reviewVO.setStar(star);
		reviewVO.setContent(content);
		System.out.println(reviewVO);
		serviceImpl.writeReview(reviewVO);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	@RequestMapping("deleteReview.do")
	public String deleteReview(int rentNo){
		RentVO rvo = serviceImpl.findRentByRentNo(rentNo);
		int bicycleNo = rvo.getBicycleVO().getBicycleNo();
		serviceImpl.deleteReview(rentNo);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	@RequestMapping("updateReview.do")
	public String updateReview(int rentNo, int star, String content){
		RentVO rvo = serviceImpl.findRentByRentNo(rentNo);
		int bicycleNo = rvo.getBicycleVO().getBicycleNo();
		ReviewVO review = new ReviewVO();
		review.setContent(content);
		review.setRentVO(rvo);
		review.setStar(star);
		System.out.println(review);
		serviceImpl.updateReview(review);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	@RequestMapping("heartCheck.do")
	@ResponseBody
	public String heartCheck(String id, int bicycleNo){
		boolean flag = serviceImpl.heartCheck(new HeartVO(id,bicycleNo));
		System.out.println(flag);
		if(flag){
			return "on";
		}
		return "off";
	}
	@RequestMapping("heartOnOff.do")
	@ResponseBody
	public String heartOnOff(String id, int bicycleNo){
		HeartVO hvo = new HeartVO(id,bicycleNo);
		boolean flag = serviceImpl.heartCheck(hvo);
		if(flag){
			serviceImpl.heartOff(hvo);
			return "off";
		}
		else{
			serviceImpl.heartOn(hvo);
			return "on";
		}
	}
}
