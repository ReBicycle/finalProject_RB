package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl3 implements BicycleService {
	@Resource
	private BicycleDAOImpl3 bicycleDAOImpl3;
	
	public BicycleVO findBicycleByNo(int bicycleNo){
		return bicycleDAOImpl3.findBicycleByNo(bicycleNo);
	}

	public List<BicycleVO> findBicycleList() {
		return bicycleDAOImpl3.findBicycleList();
	}

	public BicycleVO findBicycleDetailByNo(int no) {
		return bicycleDAOImpl3.findBicycleDetailByNo(no);
	}
	
	public List<CalendarVO> findPossibleDayByNo(int no){
		return bicycleDAOImpl3.findPossibleDayByNo(no);
	}
}
