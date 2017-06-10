package org.kosta.rebicycle.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
			Date currentTime = new Date ();
			String mTime = mSimpleDateFormat.format ( currentTime );
			if(startDay==null||startDay.equals(""))
				startDay=mTime;
			if(endDay==null||endDay.equals(""))
				endDay=mTime;
			Map<String,String> map=new HashMap<String,String>();
			map.put("address", address);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			List<BicycleVO> list=template.selectList("bicycle.getBicycleListByAddressAndDay", map);
			System.out.println("리스트 사이즈"+list.size());
			System.out.println(list);
			return list;
		}

		public List<BicycleVO> sortedListByAddressAndDayAndLow(String address, String startDay, String endDay) {
			Map<String,String> map=new HashMap<String,String>();
			map.put("address", address);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			List<BicycleVO> list=template.selectList("bicycle.sortedListByAddressAndDayAndLow", map);
			System.out.println("리스트 사이즈"+list.size());
			System.out.println(list);
			return list;
		}

		public List<BicycleVO> sortedListByAddressAndDayAndHigh(String address, String startDay, String endDay) {
			Map<String,String> map=new HashMap<String,String>();
			map.put("address", address);
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			List<BicycleVO> list=template.selectList("bicycle.sortedListByAddressAndDayAndHigh", map);
			System.out.println("리스트 사이즈"+list.size());
			System.out.println(list);
			return list;
		}
}
