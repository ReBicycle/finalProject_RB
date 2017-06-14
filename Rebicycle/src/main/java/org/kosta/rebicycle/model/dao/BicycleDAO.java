package org.kosta.rebicycle.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;

public interface BicycleDAO {

	String findCategoryByNo(int categoryNo);

	void registerBicycle(BicycleVO bvo);

	int countCategory(int categoryNo);

	int calculateMinPrice(int categoryNo);

	int calculateMaxPrice(int categoryNo);

	double calculateAvgPrice(int categoryNo);

	void registerFile(PhotoVO pvo);

	void registerPossibleDate(List<CalendarVO> calList);

	void registerMap(MapVO map);

	List<CalendarVO> findPossibleDay(int bicycleNo);

	void updateBicycle(BicycleVO bvo);

	void deletePossibleDay(CalendarVO cvo);

	void insertPossibleDay(List<CalendarVO> calList);

	MapVO findMapByBicycleNo(int bicycleNo);

	void updateMap(MapVO map);

	String findAddressById(String id);

	void writeReview(ReviewVO reviewVO);

	void updateRentStateTo3(int rentNo);

	List<RentVO> findRentVOForReview(RentVO rentVO);

	List<ReviewVO> getReviewListByBicycleNo(int bicycleNo);

	List<RentVO> reviewCheck(RentVO rvo);

	BicycleVO findBicycleByNo(int bicycleNo);

	List<BicycleVO> findBicycleList();

	BicycleVO findBicycleDetailByNo(int no);

	List<CalendarVO> findPossibleDayByNo(int no);

	void rentRegister(RentVO rvo);

	List<BicycleVO> findBicycleById(String id);

	List<RentVO> findRentById(String id);

	List<RentVO> getRentByBicycleNo(int bicycleNo);

	List<RentVO> findRentRequestById(String id);

	RentVO findRentByRentNo(int rentNo);

	void updateRentByRentNo(String rentNo);

	CalendarVO compareCalendarVO(CalendarVO calendarVO);

	void updatePossibleCalendarVOType1(HashMap<String, CalendarVO> calendarMap);

	void updatePossibleCalendarVOType0(HashMap<String, CalendarVO> calendarMap);

	void updatePossibleCalendarVOType2(HashMap<String, CalendarVO> calendarMap);

	void updatePossibleCalendarVOType3(HashMap<String, CalendarVO> calendarMap);

	CalendarVO getPossibleCVO(CalendarVO calendarVO);

	List<BicycleVO> getBicycleListByAddressAndDay(String address, String startDay, String endDay);

	List<BicycleVO> sortedListByAddressAndDayAndLow(String address, String startDay, String endDay);

	List<BicycleVO> sortedListByAddressAndDayAndHigh(String address, String startDay, String endDay);

	List<RentVO> findRentSuccessByBicycleNo(int bicycleNo);

	List<RentVO> findRentSuccessById(String id);

	List<RentVO> findRentRequestByBicycleNo(int bicycleNo);

}
