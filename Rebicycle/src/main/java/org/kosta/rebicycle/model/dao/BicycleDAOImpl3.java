package org.kosta.rebicycle.model.dao;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BicycleDAOImpl3 implements BicycleDAO{
	@Resource
	private SqlSessionTemplate template;

	public BicycleVO findBicycleByNo(int bicycleNo){
		//System.out.println(template.selectOne("bicycle.findBicycleByNo",bicycleNo));
		return template.selectOne("bicycle.findBicycleByNo",bicycleNo);
	}
}
