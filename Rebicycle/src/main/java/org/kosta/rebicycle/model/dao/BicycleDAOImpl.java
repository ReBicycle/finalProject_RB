package org.kosta.rebicycle.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.HeartVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl implements BicycleDAO {
	@Resource
	private SqlSessionTemplate template;
	//////////////////impl1////////////////
	@Override
	public String findCategoryByNo(int categoryNo) {
		return template.selectOne("bicycle.findCategoryByNo", categoryNo);
	}
	@Override
	public void registerBicycle(BicycleVO bvo) {
		template.insert("bicycle.registerBicycle", bvo);
	}
	@Override
	public int countCategory(int categoryNo) {
		return template.selectOne("bicycle.countCategory", categoryNo);
	}
	@Override
	public int calculateMinPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateMinPrice", categoryNo);
	}
	@Override
	public int calculateMaxPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateMaxPrice", categoryNo);
	}
	@Override
	public double calculateAvgPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateAvgPrice", categoryNo);
	}
	@Override
	public void registerPossibleDate(List<CalendarVO> calList) {
		for (int i = 0; i < calList.size(); i++) {
			template.insert("bicycle.registerPossibleDate", calList.get(i));
		}
	}
	@Override
	public void registerFile(PhotoVO pvo) {
		template.insert("bicycle.registerFile", pvo);
	}
	@Override
	public void registerMap(MapVO map) {
		template.insert("bicycle.registerMap", map);
	}
	@Override
	public List<CalendarVO> findPossibleDay(int bicycleNo) {
		return template.selectList("bicycle.findPossibleDay", bicycleNo);
	}
	@Override
	public void updateBicycle(BicycleVO bvo) {
		template.update("bicycle.updateBicycle", bvo);
	}
	@Override
	public void deletePossibleDay(CalendarVO cvo) {
		template.delete("bicycle.deletePossibleDay", cvo);
	}
	@Override
	public void insertPossibleDay(List<CalendarVO> calList) {
		for (int i = 0; i < calList.size(); i++) {
			template.insert("bicycle.insertPossibleDay", calList.get(i));
		}
	}
	@Override
	public MapVO findMapByBicycleNo(int bicycleNo) {
		return template.selectOne("bicycle.findMapByBicycleNo", bicycleNo);
	}
	@Override
	public void updateMap(MapVO map) {
		template.update("bicycle.updateMap", map);
	}
	@Override
	public String findAddressById(String id) {
		return template.selectOne("bicycle.findAddressById", id);
	}
	
	//////// ////impl2///////////
	@Override
	public void writeReview(ReviewVO reviewVO){
		template.insert("bicycle.writeReview",reviewVO);
	}
	@Override
	public void updateRentStateTo3(int rentNo){
		template.update("bicycle.updateRentStateTo3", rentNo);
	}
	@Override
	public List<RentVO> findRentVOForReview(RentVO rentVO) {
		return template.selectList("bicycle.findRentVOForReview", rentVO);
	}
	@Override
	public List<ReviewVO> getReviewListByBicycleNo(int bicycleNo){
		return template.selectList("bicycle.getReviewListByBicycleNo",bicycleNo);
	}
	@Override
	public List<RentVO> reviewCheck(RentVO rvo) {
		return template.selectList("bicycle.reviewCheck",rvo);
	}
	
	//////////////// impl3//////////////////
	@Override
	public BicycleVO findBicycleByNo(int bicycleNo){
		return template.selectOne("bicycle.findBicycleByNo",bicycleNo);
	}
	@Override
	public List<BicycleVO> findBicycleList() {
		return template.selectList("bicycle.findBicycleList");
	}
	@Override
	public BicycleVO findBicycleDetailByNo(int no) {
		return template.selectOne("bicycle.findBicycleDetailByNo", no);
	}
	@Override
	public List<CalendarVO> findPossibleDayByNo(int no){
		return template.selectList("bicycle.findPossibleDayByNo", no);
	}
	
	//////////////impl4/////////////////
	@Override
	public List<BicycleVO> findBicycleById(String id) {
		return template.selectList("bicycle.findBicycleById", id);	
	}
	@Override
	public List<RentVO> findRentById(String id) {
		return template.selectList("bicycle.findRentById", id);	
	}
	@Override
	public void rentRegister(RentVO rvo) {
		template.insert("bicycle.rentRegister", rvo);	
	}
	@Override
	public List<RentVO> getRentByBicycleNo(int bicycleNo) {
		return template.selectList("bicycle.getRentByBicycleNo", bicycleNo);	
	}
	@Override
	public List<RentVO> findRentRequestById(String id) {
		return template.selectList("bicycle.findRentRequestById", id);
	}
	@Override
	public RentVO findRentByRentNo(int rentNo) {
		return template.selectOne("bicycle.findRentByRentNo", rentNo);
	}
	@Override
	public void updateRentByRentNo(String rentNo) {
		template.update("bicycle.updateRentByRentNo", rentNo);
	}
	@Override
	public CalendarVO compareCalendarVO(CalendarVO calendarVO) {
		return template.selectOne("bicycle.compareCalendarVO",calendarVO);
	}
	@Override
	public void updatePossibleCalendarVOType1(HashMap<String, CalendarVO> calendarMap) {
		template.delete("bicycle.updatePossibleCalendarVOType1", calendarMap);
	}
	@Override
	public void updatePossibleCalendarVOType0(HashMap<String, CalendarVO> calendarMap) {
		template.update("bicycle.updatePossibleCalendarVOType0", calendarMap);	
	}
	@Override
	public void updatePossibleCalendarVOType2(HashMap<String, CalendarVO> calendarMap) {
		template.update("bicycle.updatePossibleCalendarVOType2", calendarMap);
	}
	@Override
	public void updatePossibleCalendarVOType3(HashMap<String, CalendarVO> calendarMap) {
		System.out.println("111111111");
		template.insert("bicycle.updatePossibleCalendarVOType3", calendarMap);	
		System.out.println("222222222");
		template.update("bicycle.updatePossibleCalendarVOType2", calendarMap);
		System.out.println("333333333");
	}
	@Override
	public CalendarVO getPossibleCVO(CalendarVO calendarVO) {
		return template.selectOne("bicycle.getPossibleCVO",calendarVO);
	}
	@Override
	public List<RentVO> findRentSuccessByBicycleNo(int bicycleNo) {
	      return template.selectList("bicycle.findRentSuccessByBicycleNo", bicycleNo);
	   }
	
	///////////impl5//////////////
	@Override
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
	@Override
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
	@Override
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
	@Override
	public void deleteReview(int rentNo) {
		template.delete("bicycle.deleteReview",rentNo);
		template.update("bicycle.updateRentStateTo1",rentNo);
	}
	@Override
	public void updateReview(ReviewVO reviewVO) {
		template.update("bicycle.updateReview",reviewVO);
	}
	@Override
	public int heartCheck(HeartVO heartVO) {
		return template.selectOne("bicycle.heartCheck", heartVO);
	}
	@Override
	public void heartOff(HeartVO hvo) {
		template.delete("bicycle.heartOff",hvo);
	}
	@Override
	public void heartOn(HeartVO hvo) {
		template.insert("bicycle.heartOn",hvo);
	}
	@Override
	public List<RentVO> findRentSuccessById(String id) {
		return template.selectList("bicycle.findRentSuccessById",id);
	}
	@Override
	public void changeState(int rentNo) {
		template.update("bicycle.changeState", rentNo);
	}
	@Override
	public List<RentVO> findRentSuccessById(int bicycleNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
