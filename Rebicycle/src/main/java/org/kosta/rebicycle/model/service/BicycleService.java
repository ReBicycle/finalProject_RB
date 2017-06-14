package org.kosta.rebicycle.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.HeartVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.web.multipart.MultipartFile;

public interface BicycleService {

	String findAddressById(String id);

	String findCategoryByNo(int categoryNo);

	void registerBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map);

	void modifyBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map, String address);

	ArrayList<Object> calculatePrice(int categoryNo);

	List<String> uploadFile(List<MultipartFile> list, String uploadPath, int bicycleNo);

	List<BicycleVO> getBicycleListByAddressAndDay(String address, String startDay, String endDay);

	List<BicycleVO> sortByBikeType(String address, String startDay, String endDay, String bikeType);

	List<BicycleVO> sortByPriceType(String address, String startDay, String endDay, String priceType);

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

	void deleteRentedDay(RentVO rvo);

	boolean reviewCheck(String id, String bicycleNo);

	void writeReview(ReviewVO reviewVO);

	RentVO findRentVOForReview(String id, int bicycleNo);

	List<ReviewVO> getReviewListByBicycleNo(int bicycleNo);

	List<RentVO> findRentSuccessByBicycleNo(int bicycleNo);

	List<RentVO> findRentSuccessById(String id);

	void checkState(ArrayList<RentVO> otherList);

	void deleteReview(int rentNo);

	void updateReview(ReviewVO review);

	boolean heartCheck(HeartVO heartVO);

	void heartOff(HeartVO hvo);

	void heartOn(HeartVO hvo);

}
