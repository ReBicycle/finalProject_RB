package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl2;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.dao.MemberDAOImpl;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

//서경 

@Service
public class BicycleServiceImpl5 {
	@Resource
	private BicycleDAOImpl2 bicycleDAOImpl2;
	@Resource
	private BicycleDAOImpl3 bicycleDAOImpl3;
	@Resource
	private MemberDAOImpl memberDAOImpl;
	
	public void writeReview(ReviewVO reviewVO){
		bicycleDAOImpl2.writeReview(reviewVO);
		bicycleDAOImpl2.updateRentStateTo3(reviewVO.getRentVO().getRentNo());
	}

	public RentVO findRentVOForReview(String id, int bicycleNo){
		RentVO rentVO = new RentVO();
		rentVO.setBicycleVO(bicycleDAOImpl3.findBicycleByNo(bicycleNo));
		rentVO.setMemberVO(memberDAOImpl.findMemberById(id));
		return bicycleDAOImpl2.findRentVOForReview(rentVO);
	}
	
	public List<ReviewVO> getReviewListByBicycleNo(int bicycleNo){
		return bicycleDAOImpl2.getReviewListByBicycleNo(bicycleNo);
	}

	public boolean reviewCheck(String id, String bicycleNo) {
		RentVO rvo = new RentVO();
		rvo.setMemberVO(new MemberVO(id));
		rvo.setBicycleVO(new BicycleVO(Integer.parseInt(bicycleNo)));		

		List<RentVO> list = bicycleDAOImpl2.reviewCheck(rvo);
		if(list.size()!=0)
				return true;
		else
			return false;
	}
}
