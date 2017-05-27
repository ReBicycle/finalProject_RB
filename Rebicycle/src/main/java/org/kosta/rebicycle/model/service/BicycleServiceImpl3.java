package org.kosta.rebicycle.model.service;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl3 implements BicycleService {
	@Resource
	private BicycleDAOImpl3 bicycleDAOImpl3;
	
	public BicycleVO findBicycleByNo(int bicycleNo){
		return bicycleDAOImpl3.findBicycleByNo(bicycleNo);
	}
	
}
