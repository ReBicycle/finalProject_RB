package org.kosta.rebicycle.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })
public class TestUnit {
	@Resource
	private SqlSessionTemplate template;
	@Resource
	private BicycleDAOImpl3 BicycleDAOImpl3;
	@Test
	public void test() {
		System.out.println(BicycleDAOImpl3.findBicycleByNo(1));
	}
}