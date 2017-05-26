package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl5;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl2 implements BicycleService {
	@Resource
	private BicycleDAOImpl5 dao;
	
	public List<BicycleVO> getBicycleListByAddressAndDay(String address,String startDay,String endDay){
		
		return null;
	}
}
