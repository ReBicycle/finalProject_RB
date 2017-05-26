package org.kosta.rebicycle.model.dao;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl1 implements BicycleDAO {
	@Resource
	private SqlSessionTemplate template;
	
	//@Override
	public String findCategoryByNo(int categoryNo){
		return template.selectOne("bicycle.findCategoryByNo", categoryNo);
	}
	
	public void registerBicycle(BicycleVO bvo){
		template.insert("bicycle.registerBicycle", bvo);
	}
}
