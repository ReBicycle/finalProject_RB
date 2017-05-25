package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.mybatis.spring.SqlSessionTemplate;

public class BicycleDAOImpl5 implements BicycleDAO{
		@Resource
		private SqlSessionTemplate template;
		
		public List<BicycleVO> findBicycleListByAddressAndDate(String address,String startDate,String endDate){
			
			return null;
		}
}
