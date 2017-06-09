package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//서경

@Repository
public class BicycleDAOImpl2 implements BicycleDAO{
	@Resource
	private SqlSessionTemplate template;
	
	public void writeReview(ReviewVO reviewVO){
		template.insert("bicycle.writeReview",reviewVO);
	}
	public void updateRentStateTo3(int rentNo){
		template.update("bicycle.updateRentStateTo3", rentNo);
	}
	public RentVO findRentVOForReview(RentVO rentVO) {
		return template.selectOne("bicycle.findRentVOForReview", rentVO);
	}
	public List<ReviewVO> getReviewListByBicycleNo(int bicycleNo){
		return template.selectList("bicycle.getReviewListByBicycleNo",bicycleNo);
	}
	public List<RentVO> reviewCheck(RentVO rvo) {
		return template.selectList("bicycle.reviewCheck",rvo);
	}
}
