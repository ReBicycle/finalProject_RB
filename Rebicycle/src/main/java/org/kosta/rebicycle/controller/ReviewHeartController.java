package org.kosta.rebicycle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleService;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.HeartVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewHeartController {
	@Resource
	private BicycleService serviceImpl;
	
	//리뷰등록
	@RequestMapping( "writeReview.do")
	public String writeReview(int bicycleNo, String content, int star, HttpServletRequest request){
		//비정상 로그인 시
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("mvo");
		if(memberVO==null)
			return "redirect:/home.do";
		//같은 자전거를 여러번 빌릴 경우 가장 최근 대여한 것에 대한 리뷰
		RentVO rentVO = serviceImpl.findRentVOForReview(memberVO.getId(),bicycleNo);
		//RevieVO 에 RentVO, star, content 세터로 삽입
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRentVO(rentVO);
		reviewVO.setStar(star);
		reviewVO.setContent(content);
		//리뷰등록
		serviceImpl.writeReview(reviewVO);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	
	//리뷰삭제
	@RequestMapping("deleteReview.do")
	public String deleteReview(int rentNo){
		/* 렌트번호만으로 리뷰를 삭제할 수 있지만
			삭제된 후에도 해당 자전거 상세페이지로 이동하기 위해
			자전거 번호 찾기 */
		RentVO rvo = serviceImpl.findRentByRentNo(rentNo);
		int bicycleNo = rvo.getBicycleVO().getBicycleNo();
		//리뷰삭제
		serviceImpl.deleteReview(rentNo);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	
	//리뷰수정
	@RequestMapping("updateReview.do")
	public String updateReview(int rentNo, int star, String content){
		//자전거번호 찾기
		RentVO rvo = serviceImpl.findRentByRentNo(rentNo);
		int bicycleNo = rvo.getBicycleVO().getBicycleNo();
		//ReviewVO에 세터로 정보 입력
		ReviewVO review = new ReviewVO();
		review.setContent(content);
		review.setRentVO(rvo);
		review.setStar(star);
		//리뷰수정
		serviceImpl.updateReview(review);
		return "redirect:/bicycle/bicycle_findBicycleByNo.do?bicycleNo="+bicycleNo;
	}
	
	//하트 on인지 off인지 확인 
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
	
	//하트 on일때는 off로 삭제, off일때는 on으로 등록
	@RequestMapping("heartOnOff.do")
	@ResponseBody
	public String heartOnOff(HeartVO hvo){
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
	
	//찜하기 취소
	@RequestMapping("deleteHeartMypage.do")
	@ResponseBody
	public List<BicycleVO>  deleteHeartMypage(HeartVO hvo){
		serviceImpl.heartOff(hvo);
		List<BicycleVO> list = serviceImpl.getHeartList(hvo.getId());
		return list;
	}
	
	
}
