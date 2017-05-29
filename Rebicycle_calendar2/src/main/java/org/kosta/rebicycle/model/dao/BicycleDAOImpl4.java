package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl4 implements BicycleDAO{
	//소영
	@Resource
	private SqlSessionTemplate template;
	
	public List<BicycleVO> findBicycleById(String id) {
		return template.selectList("bicycle.findBicycleById", id);	
	}

}
