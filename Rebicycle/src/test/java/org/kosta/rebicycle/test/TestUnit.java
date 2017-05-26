package org.kosta.rebicycle.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl5;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class TestUnit {
@Resource
private SqlSessionTemplate t;
@Resource
private BicycleDAOImpl5 dao;

@Test
public void test(){
	System.out.println("하이");
dao.getBicycleListByAddressAndDay("판교", "2017-05-26", "2017-05-28");
System.out.println("바이");
}
}