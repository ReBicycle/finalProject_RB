package org.kosta.rebicycle.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl4;
import org.kosta.rebicycle.model.vo.BicycleVO;
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
		return bicycleDAOImpl4.findRentRequestById(id);
	}
	
}
