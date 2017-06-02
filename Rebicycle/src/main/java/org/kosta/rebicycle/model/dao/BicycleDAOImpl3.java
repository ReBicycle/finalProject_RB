package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BicycleDAOImpl3 implements BicycleDAO{
	@Resource
	private SqlSessionTemplate template;

	public BicycleVO findBicycleByNo(int bicycleNo){
		//System.out.println(template.selectOne("bicycle.findBicycleByNo",bicycleNo));
		return template.selectOne("bicycle.findBicycleByNo",bicycleNo);
	}

	public List<BicycleVO> findBicycleList() {
		
		return template.selectList("bicycle.findBicycleList");
	}

	public BicycleVO findBicycleDetailByNo(int no) {
		
		return template.selectOne("bicycle.findBicycleDetailByNo", no);
	}
	
	public List<CalendarVO> findPossibleDayByNo(int no){
		return template.selectList("bicycle.findPossibleDayByNo", no);
	}
	
	//빌리기
	public void rentRegister(RentVO rvo){
		template.insert("bicycle.rentRegister",rvo);
	}
}
