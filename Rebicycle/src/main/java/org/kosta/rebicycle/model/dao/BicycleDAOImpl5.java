package org.kosta.rebicycle.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BicycleDAOImpl5 implements BicycleDAO{
		@Resource
		private SqlSessionTemplate template;
		
		public List<BicycleVO> getBicycleListByAddressAndDay(String address,String startDay,String endDay){
			Map<String,String> map=new HashMap<String,String>();
			map.put("address", address);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			List<BicycleVO> list=template.selectList("bicycle.getBicycleListByAddressAndDay", map);
			System.out.println(list);
			return null;
		}
}
