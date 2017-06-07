package org.kosta.rebicycle.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl2;
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
	public List<RentVO> findRentByBicycleNo(int bicycleNo){
		return bicycleDAOImpl4.findBicycleByBicycleNo(bicycleNo);
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
		
		//System.out.println(rvo.getCalendarVO());
		String newStartDay = rvo.getCalendarVO().getStartDay().substring(0,10);
		//System.out.println(newStartDay);
		String newEndDay = rvo.getCalendarVO().getEndDay().substring(0, 10);
		String type = "";
		
		rvo.getCalendarVO().setBicycleNo(rvo.getBicycleVO().getBicycleNo());
		rvo.getCalendarVO().setStartDay(newStartDay);
		rvo.getCalendarVO().setEndDay(newEndDay);
		
		CalendarVO possibleDay = bicycleDAOImpl4.getPossibleCalendarVO(rvo.getCalendarVO());
		//6월2일에서 6월 9일 신청시
		//db에서 해당 자전거의 가능일 중 6/2~6/9가 해당하는 기간 받아오기
		
		System.out.println("deleRentedDay" + possibleDay);
		type = compareDay(possibleDay, rvo.getCalendarVO());
		
	}

	private String compareDay(CalendarVO possibleCalendarVO, CalendarVO rentCalendarVO) {
		
		//type = 0 기간의 시작날짜 = 신청한 시작날짜
		//type = 1 기간의 시작날짜 < 신청한 시작날짜  이면서 기간의 종료날짜 >신청한 종료날짜 
		//type = 2 기간의 종료날짜 = 신청한 종료날짜
		//type= 3  기간의 시작날짜 = 신청한 시작날짜 &&  기간의 종료날짜 = 신청한 종료날짜 
		
		return null;
	}
	
}
