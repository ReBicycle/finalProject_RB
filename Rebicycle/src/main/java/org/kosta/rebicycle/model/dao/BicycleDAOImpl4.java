package org.kosta.rebicycle.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl4 implements BicycleDAO{
	//소영
	@Resource
	private SqlSessionTemplate template;
	
	public List<BicycleVO> findBicycleById(String id) {
		return template.selectList("bicycle.findBicycleById", id);	
	}
	
	public List<RentVO> findRentById(String id) {
		return template.selectList("bicycle.findRentById", id);	
	}

	public void rentRegister(RentVO rvo) {
		template.insert("bicycle.rentRegister", rvo);	
	}

	public List<RentVO> getRentByBicycleNo(int bicycleNo) {
		return template.selectList("bicycle.getRentByBicycleNo", bicycleNo);	
	}

	public List<RentVO> findRentSuccessById(int bicycleNo) {
		return template.selectList("bicycle.findRentSuccessById", bicycleNo);
	}
	
	public List<RentVO> findRentRequestById(String id) {
		return template.selectList("bicycle.findRentRequestById", id);
	}

	public RentVO findRentByRentNo(int rentNo) {
		return template.selectOne("bicycle.findRentByRentNo", rentNo);
	}

	public void updateRentByRentNo(String rentNo) {
		template.update("bicycle.updateRentByRentNo", rentNo);
	}

	public CalendarVO compareCalendarVO(CalendarVO calendarVO) {
		return template.selectOne("bicycle.compareCalendarVO",calendarVO);
	}

	public void updatePossibleCalendarVOType1(HashMap<String, CalendarVO> calendarMap) {
		template.delete("bicycle.updatePossibleCalendarVOType1", calendarMap);
		
	}

	public void updatePossibleCalendarVOType0(HashMap<String, CalendarVO> calendarMap) {
		template.update("bicycle.updatePossibleCalendarVOType0", calendarMap);
		
	}

	public void updatePossibleCalendarVOType2(HashMap<String, CalendarVO> calendarMap) {
		template.update("bicycle.updatePossibleCalendarVOType2", calendarMap);
		
		
	}

	public void updatePossibleCalendarVOType3(HashMap<String, CalendarVO> calendarMap) {
		System.out.println("111111111");
		template.insert("bicycle.updatePossibleCalendarVOType3", calendarMap);	
		System.out.println("222222222");
		template.update("bicycle.updatePossibleCalendarVOType2", calendarMap);
		System.out.println("333333333");
	}
	
	/*public void updatePossibleCalendarVOType3_2(HashMap<String, CalendarVO> calendarMap) {
		template.update("bicycle.updatePossibleCalendarVOType2", calendarMap);
	}*/

	public CalendarVO getPossibleCVO(CalendarVO calendarVO) {
		return template.selectOne("bicycle.getPossibleCVO",calendarVO);
		
	}

	
}
