package org.kosta.rebicycle.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl6;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })
public class TestUnit {
	@Resource
	private SqlSessionTemplate template;
	@Resource
	private BicycleDAOImpl6 BicycleDAOImpl6;
	@Test
	public void test1() {

	}
}
/*@Resource
private SqlSessionTemplate t;
=======
>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git

<<<<<<< HEAD
@Resource
private BicycleDAOImpl5 dao;
*

=======
	@Resource
	private SqlSessionTemplate t;
>>>>>>> branch 'master' of https://github.com/ReBicycle/finalProject_RB.git

	/*
	 * @Resource private BicycleDAOImpl5 dao;
	 *
	 */
