package org.kosta.rebicycle.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl1 implements BicycleDAO {
	@Resource
	private SqlSessionTemplate template;
	
	
}
