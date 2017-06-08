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

/*@Resource
private SqlSessionTemplate t;


@Resource
private BicycleDAOImpl5 dao;
*/


	
@Test
public void test2(){
/*	System.out.println("하이");
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
		return list;*/
	System.out.println(template.selectList("bicycle.getReviewByBicycle", "26"));
	
	}
}
