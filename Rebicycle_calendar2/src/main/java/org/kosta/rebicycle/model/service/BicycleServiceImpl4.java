package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl4;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;

@Service
public class BicycleServiceImpl4 implements BicycleService {
	@Resource
	private BicycleDAOImpl4 bicycleDAOImpl4;

	public List<BicycleVO> findBicycleById(String id) {
		return bicycleDAOImpl4.findBicycleById(id);
	}

}
