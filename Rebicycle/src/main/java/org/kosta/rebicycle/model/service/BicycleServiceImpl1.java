package org.kosta.rebicycle.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BicycleServiceImpl1 implements BicycleService {
	@Resource
	private BicycleDAOImpl1 daoImpl1;
	
	public String findCategoryByNo(int categoryNo){
		return daoImpl1.findCategoryByNo(categoryNo);
	}
	
	@Transactional
	public void registerBicycle(BicycleVO bvo, CalendarVO cvo){
		daoImpl1.registerBicycle(bvo);
		cvo.setBicycleNo(bvo.getBicycleNo());
		daoImpl1.registerPossibleDate(cvo);
	}
	
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		int min = daoImpl1.calculateMinPrice(categoryNo);
		int max = daoImpl1.calculateMaxPrice(categoryNo);
		double avg = daoImpl1.calculateAvgPrice(categoryNo);
		calList.add(min);
		calList.add(max);
		calList.add(avg);
		return calList;
	}
	
	
}
