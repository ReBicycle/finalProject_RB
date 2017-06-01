package org.kosta.rebicycle.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl5;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;
//종봉이 사용
@Service
public class BicycleServiceImpl2 implements BicycleService {
	@Resource
	private BicycleDAOImpl5 dao;
	
	public List<BicycleVO> getBicycleListByAddressAndDay(String address,String startDay,String endDay){
			
		return dao.getBicycleListByAddressAndDay(address, startDay, endDay);
	}

	public List<BicycleVO> sortByBikeType(String address, String startDay, String endDay, String bikeType) {
		System.out.println("타입정렬서비스실행");
		List<BicycleVO> originList=dao.getBicycleListByAddressAndDay(address, startDay, endDay);
		List<BicycleVO> sortedList=new ArrayList<BicycleVO>();
		for(int i=0;i<originList.size();i++){
			if(originList.get(i).getCategoryVO().getCategoryNo()==Integer.parseInt(bikeType)){
				sortedList.add(originList.get(i));
			}
		}
		for(BicycleVO b:sortedList)
			System.out.println("정렬된리스트"+b);
		return sortedList;
	}

	public List<BicycleVO> sortByPriceType(String address, String startDay, String endDay, String priceType) {
		System.out.println("가격정렬서비스실행");
		if(priceType.equals("low"))
			return dao.sortedListByAddressAndDayAndLow(address, startDay, endDay);
		else
			return dao.sortedListByAddressAndDayAndHigh(address, startDay, endDay);
	}
}
