package org.kosta.rebicycle.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.rebicycle.model.dao.BicycleDAOImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
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
	public void test1() {
		System.out.println(BicycleDAOImpl3.findBicycleByNo(1));
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
@Test
public void test2(){
	System.out.println("하이");
	Map<String,String> map=new HashMap<String,String>();
	map.put("address", "판교");
	map.put("startDay", "2017-05-26");
	map.put("endDay", "2017-05-28");
	List<BicycleVO> list=template.selectList("bicycle.getBicycleListByAddressAndDay", map);
	System.out.println(list);
	
	
System.out.println("바이");
}
	public List<BicycleVO> getBicycleListByAddressAndDay(String address, String startDay, String endDay) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("address", address);
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		List<BicycleVO> list = template.selectList("bicycle.getBicycleListByAddressAndDay", map);
		System.out.println(list);
		return list;
	}
}