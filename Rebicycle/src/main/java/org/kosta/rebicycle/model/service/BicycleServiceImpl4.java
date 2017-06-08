package org.kosta.rebicycle.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl4;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl4 implements BicycleService {
	@Resource
	private BicycleDAOImpl4 bicycleDAOImpl4;
	@Resource
	private BicycleDAOImpl3 bicycleDAOImpl3;
	
	
	
	public List<BicycleVO> findBicycleById(String id) {
		return bicycleDAOImpl4.findBicycleById(id);
	}
	
	public List<RentVO> findRentById(String id) {
		List<RentVO> list = bicycleDAOImpl4.findRentById(id);
		for(int i=0; i<list.size();i++){		
			BicycleVO bvo=bicycleDAOImpl3.findBicycleByNo(list.get(i).getBicycleVO().getBicycleNo());
			list.get(i).setBicycleVO(bvo);
		}
		return list;
	}

	public void rentRegister(RentVO rvo) {
		//rvo의 신청일~반납일이 가능일이사이에 있을 때
		//가능일이 2개로 나뉨
		bicycleDAOImpl4.rentRegister(rvo);
		
	}

	//해당 자전거를 요청한 내역 띄우기
	public List<RentVO> getRentByBicycleNo(int bicycleNo){
		return bicycleDAOImpl4.getRentByBicycleNo(bicycleNo);
	}

	public List<RentVO> findRentRequestById(String id) {
		//System.out.println("DAO" +  bicycleDAOImpl4.findRentRequestById(id));
		return bicycleDAOImpl4.findRentRequestById(id);
	}

	public RentVO findRentByRentNo(int rentNo) {
		return bicycleDAOImpl4.findRentByRentNo(rentNo);
	}

	public void updateRentByRentNo(String rentNo) {
		bicycleDAOImpl4.updateRentByRentNo(rentNo);
		
	}

	public void deleteRentedDay(RentVO rvo) {
		//System.out.println("deleRentedDay" + rvo);
		
		
		String newStartDay = rvo.getCalendarVO().getStartDay().substring(0,10);
		String newEndDay = rvo.getCalendarVO().getEndDay().substring(0, 10);
		
		rvo.getCalendarVO().setBicycleNo(rvo.getBicycleVO().getBicycleNo());
		rvo.getCalendarVO().setStartDay(newStartDay);
		rvo.getCalendarVO().setEndDay(newEndDay);
		
		
		
		CalendarVO compare= bicycleDAOImpl4.compareCalendarVO(rvo.getCalendarVO());
		
		HashMap<String, CalendarVO> calendarMap = new HashMap<>();
		calendarMap.put("possible", bicycleDAOImpl4.getPossibleCVO(rvo.getCalendarVO()));
		calendarMap.put("rent", rvo.getCalendarVO());
		//System.out.println("possible" + bicycleDAOImpl4.getPossibleCVO(rvo.getCalendarVO()));
		System.out.println("deleteRentedDay-cM" + calendarMap);
		
		
		//System.out.println("deleteRentedDay" + compare);
		
		if(Integer.parseInt(compare.getStartDay()) == 0 && Integer.parseInt(compare.getEndDay())==0){
			//다 자르기
			System.out.println("type1");
			bicycleDAOImpl4.updatePossibleCalendarVOType1(calendarMap);
			
		}else if(Integer.parseInt(compare.getStartDay())==0 && Integer.parseInt(compare.getEndDay())>0){
			//type0 신청일의 종료일부터 가능일의 종료일로 update
			System.out.println("type0");
			bicycleDAOImpl4.updatePossibleCalendarVOType0(calendarMap);
			
		}
		else if(Integer.parseInt(compare.getStartDay())>0 && Integer.parseInt(compare.getEndDay())==0){
			//type2 
			System.out.println("type2");
			bicycleDAOImpl4.updatePossibleCalendarVOType2(calendarMap);			
		}	
		else if(Integer.parseInt(compare.getStartDay())>0 && Integer.parseInt(compare.getEndDay())>0){
			//type3
			System.out.println("type3");

			bicycleDAOImpl4.updatePossibleCalendarVOType3(calendarMap);
			
		}
		
	}

	
	
}
