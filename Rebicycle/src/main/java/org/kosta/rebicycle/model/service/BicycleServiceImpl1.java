package org.kosta.rebicycle.model.service;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl1 implements BicycleService {
	@Resource
	private BicycleDAOImpl1 daoImpl1;
	
	public String findCategoryByNo(int categoryNo){
		return daoImpl1.findCategoryByNo(categoryNo);
	}
	
	public void registerBicycle(BicycleVO bvo){
		daoImpl1.registerBicycle(bvo);
	}
}
