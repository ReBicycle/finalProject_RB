package org.kosta.rebicycle.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl;
import org.kosta.rebicycle.model.dao.MemberDAOImpl;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.kosta.rebicycle.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BicycleServiceImpl implements BicycleService {
	@Resource
	private BicycleDAOImpl bicycleDAOImpl;
	@Resource
	private MemberDAOImpl memberDAOImpl;
	
	/////////impl1/////////	
	@Override
	public String findCategoryByNo(int categoryNo) {
		return bicycleDAOImpl.findCategoryByNo(categoryNo);
	}	
	// 등록
	@Override
	@Transactional
	public void registerBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map) {
		bicycleDAOImpl.registerBicycle(bvo);

		for (int i = 0; i < calList.size(); i++) {
			calList.get(i).setBicycleNo(bvo.getBicycleNo());
		}
		bicycleDAOImpl.registerPossibleDate(calList);

		PhotoVO pvo = new PhotoVO();
		List<String> list = uploadFile(bvo.getFile(), uploadPath, bvo.getBicycleNo());
		pvo.setBicycleNo(bvo.getBicycleNo());
		pvo.setPhoto1(list.get(0));
		pvo.setPhoto2(list.get(1));
		pvo.setPhoto3(list.get(2));
		bicycleDAOImpl.registerFile(pvo);

		map.setBicycleNo(bvo.getBicycleNo());
		bicycleDAOImpl.registerMap(map);
	}
	
	// 수정
	@Override
	@Transactional
	public void modifyBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map, String address) {
		bvo.setPossibleList((ArrayList<CalendarVO>) bicycleDAOImpl.findPossibleDay(bvo.getBicycleNo()));
		calList.get(0).setBicycleNo(bvo.getBicycleNo());
		// 가능일 수정
		bicycleDAOImpl.deletePossibleDay(calList.get(0));

		for (int i = 0; i < calList.size(); i++) {
			calList.get(i).setBicycleNo(bvo.getBicycleNo());
		}
		bicycleDAOImpl.insertPossibleDay(calList);

		// 사진 수정
		PhotoVO pvo = new PhotoVO();
		List<String> list = uploadFile(bvo.getFile(), uploadPath, bvo.getBicycleNo());
		pvo.setBicycleNo(bvo.getBicycleNo());
		pvo.setPhoto1(list.get(0));
		pvo.setPhoto2(list.get(1));
		pvo.setPhoto3(list.get(2));

		// 위도경도 수정
		map.setBicycleNo(bvo.getBicycleNo());
		if (bicycleDAOImpl.findMapByBicycleNo(bvo.getBicycleNo()).equals(address)) {
			bicycleDAOImpl.updateMap(map);
		}
		bvo.setAddress(address);
		bicycleDAOImpl.updateBicycle(bvo);
	}
	@Override
	public ArrayList<Object> calculatePrice(int categoryNo) {
		ArrayList<Object> calList = new ArrayList<Object>();
		if (bicycleDAOImpl.countCategory(categoryNo) == 0) {
			calList = null;
		} else {
			int min = bicycleDAOImpl.calculateMinPrice(categoryNo);
			int max = bicycleDAOImpl.calculateMaxPrice(categoryNo);
			double avg = bicycleDAOImpl.calculateAvgPrice(categoryNo);
			calList.add(min);
			calList.add(max);
			calList.add(avg);
		}
		return calList;
	}
	@Override
	public List<String> uploadFile(List<MultipartFile> list, String uploadPath, int bicycleNo) {

		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			int pos = list.get(i).getOriginalFilename().lastIndexOf(".");
			String ext = list.get(i).getOriginalFilename().substring(pos + 1);
			String fileName = String.valueOf(bicycleNo) + "_photo" + (i + 1) + "." + ext;
			if (fileName.equals("") == false) {
				try {
					list.get(i).transferTo(new File(uploadPath + fileName));
					nameList.add(fileName);
					System.out.println("upload 완료" + fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		return nameList;
	}// uploadFile method
	@Override
	public String findAddressById(String id) {
		return bicycleDAOImpl.findAddressById(id);
	}
	
	///////////////impl2//////////////////////////
	@Override
	public List<BicycleVO> getBicycleListByAddressAndDay(String address,String startDay,String endDay){		
		return bicycleDAOImpl.getBicycleListByAddressAndDay(address, startDay, endDay);
	}
	@Override
	public List<BicycleVO> sortByBikeType(String address, String startDay, String endDay, String bikeType) {
		System.out.println("타입정렬서비스실행");
		List<BicycleVO> originList=bicycleDAOImpl.getBicycleListByAddressAndDay(address, startDay, endDay);
		List<BicycleVO> sortedList=new ArrayList<BicycleVO>();
		for(int i=0;i<originList.size();i++){
			if(originList.get(i).getCategoryVO().getCategoryNo()==Integer.parseInt(bikeType)){
				sortedList.add(originList.get(i));
			}
		}
		for(BicycleVO b:sortedList)
			System.out.println("정렬된리스트"+b);
		return sortedList;
	}
	@Override
	public List<BicycleVO> sortByPriceType(String address, String startDay, String endDay, String priceType) {
		System.out.println("가격정렬서비스실행");
		List<BicycleVO> list=bicycleDAOImpl.getBicycleListByAddressAndDay(address, startDay, endDay);
		BicycleVO temp=null;
		
		if(priceType.equals("low")){
			/*//<---선택정렬 (오름차순)
			for(int i=0;i<list.size()-1;i++){
				int indexMin=i;
				for(int j=i+1;j<list.size();j++){
					if(list.get(indexMin).getRentPrice()>list.get(j).getRentPrice()){
						temp=list.get(indexMin);
						list.set(indexMin, list.get(j));
						list.set(j,temp);
					}
				}
			}//선택정렬 (오름차순)----->
			//<---삽입정렬  (오름차순)
			for(int i=1;i<list.size();i++){
				temp=list.get(i);
				int aux= i-1;
				while(aux>=0&&list.get(aux).getRentPrice()>temp.getRentPrice()){
						list.set(aux+1, list.get(aux));
						aux--;
				}//while 
				list.set(aux+1,temp);
			}// 삽입정렬  (오름차순)----->*/
			//<--버블정렬 (오름차순
			for(int i=0;i<list.size()-1;i++){
				for(int j=0;j<list.size()-1-i;j++){
					if(list.get(j).getRentPrice()>list.get(j+1).getRentPrice()){
						temp=list.get(j);
						list.set(j, list.get(j+1));
						list.set(j+1, temp);
					}
				}
			}//버블정렬 -->
		
			return list;
			//return dao.sortedListByAddressAndDayAndLow(address, startDay, endDay);
		}
			
		else{
			/*//<---선택정렬 (내림차순)
			for(int i=0;i<list.size()-1;i++){
				int indexMin=i;
				for(int j=i+1;j<list.size();j++){
					if(list.get(indexMin).getRentPrice()<list.get(j).getRentPrice()){
						temp=list.get(indexMin);
						list.set(indexMin, list.get(j));
						list.set(j,temp);
					}
				}
			}//선택정렬 (내림차순)----->
			//<---삽입정렬  (내림차순)
			for(int i=1;i<list.size();i++){
				temp=list.get(i);
				int aux= i-1;
				while(aux>=0&&list.get(aux).getRentPrice()<temp.getRentPrice()){
						list.set(aux+1, list.get(aux));
						aux--;
				}//while 
				list.set(aux+1,temp);
			}// 삽입정렬  (내림차순)----->*/
			//<--버블정렬 (ㄴㅐ림차순
			for(int i=0;i<list.size()-1;i++){
				for(int j=0;j<list.size()-1-i;j++){
					if(list.get(j).getRentPrice()<list.get(j+1).getRentPrice()){
						temp=list.get(j);
						list.set(j, list.get(j+1));
						list.set(j+1, temp);
					}
				}
			}//버블정렬 (내림차순)-->
			return list;
			//return dao.sortedListByAddressAndDayAndHigh(address, startDay, endDay);
		}			
	}
	
	///////////////////impl3////////////
	@Override
	public BicycleVO findBicycleByNo(int bicycleNo){
		return bicycleDAOImpl.findBicycleByNo(bicycleNo);
	}
	@Override
	public List<BicycleVO> findBicycleList() {
		return bicycleDAOImpl.findBicycleList();
	}
	@Override
	public BicycleVO findBicycleDetailByNo(int no) {
		return bicycleDAOImpl.findBicycleDetailByNo(no);
	}
	@Override
	public List<CalendarVO> findPossibleDayByNo(int no){
		return bicycleDAOImpl.findPossibleDayByNo(no);
	}
	@Override
	public void rentRegister(RentVO rvo){
		System.out.println("시작!!!  ");
		System.out.println("???   "+rvo);
		System.out.println(rvo.getBicycleVO().getBicycleNo());
		System.out.println(rvo.getMemberVO().getId());
		System.out.println(rvo.getCalendarVO().getStartDay());
		System.out.println(rvo.getCalendarVO().getEndDay());
		bicycleDAOImpl.rentRegister(rvo);
	}
	
	/////////impl4//////////////////////
	@Override
	public List<BicycleVO> findBicycleById(String id) {
		return bicycleDAOImpl.findBicycleById(id);
	}
	@Override
	public List<RentVO> findRentById(String id) {
		List<RentVO> list = bicycleDAOImpl.findRentById(id);
		for(int i=0; i<list.size();i++){		
			BicycleVO bvo=bicycleDAOImpl.findBicycleByNo(list.get(i).getBicycleVO().getBicycleNo());
			list.get(i).setBicycleVO(bvo);
		}
		return list;
	}
	@Override
	//해당 자전거를 요청한 내역 띄우기
	public List<RentVO> getRentByBicycleNo(int bicycleNo){
		return bicycleDAOImpl.getRentByBicycleNo(bicycleNo);
	}
	@Override
	public List<RentVO> findRentRequestById(String id) {
		//System.out.println("DAO" +  bicycleDAOImpl4.findRentRequestById(id));
		return bicycleDAOImpl.findRentRequestById(id);
	}
	@Override
	public RentVO findRentByRentNo(int rentNo) {
		return bicycleDAOImpl.findRentByRentNo(rentNo);
	}
	@Override
	public void updateRentByRentNo(String rentNo) {
		bicycleDAOImpl.updateRentByRentNo(rentNo);
	}
	@Override
	public void deleteRentedDay(RentVO rvo) {
		//System.out.println("deleRentedDay" + rvo);
		
		String newStartDay = rvo.getCalendarVO().getStartDay().substring(0,10);
		String newEndDay = rvo.getCalendarVO().getEndDay().substring(0, 10);
		
		rvo.getCalendarVO().setBicycleNo(rvo.getBicycleVO().getBicycleNo());
		rvo.getCalendarVO().setStartDay(newStartDay);
		rvo.getCalendarVO().setEndDay(newEndDay);
		
		CalendarVO compare= bicycleDAOImpl.compareCalendarVO(rvo.getCalendarVO());
		
		HashMap<String, CalendarVO> calendarMap = new HashMap<>();
		calendarMap.put("possible", bicycleDAOImpl.getPossibleCVO(rvo.getCalendarVO()));
		System.out.println("possible dog     "+calendarMap.get("possible"));
		calendarMap.put("rent", rvo.getCalendarVO());
		System.out.println("rent dog     "+calendarMap.get("rent"));
		//System.out.println("possible" + bicycleDAOImpl4.getPossibleCVO(rvo.getCalendarVO()));
		System.out.println("deleteRentedDay-cM" + calendarMap);
		
		
		//System.out.println("deleteRentedDay" + compare);
		
		if(Integer.parseInt(compare.getStartDay()) == 0 && Integer.parseInt(compare.getEndDay())==0){
			//다 자르기
			System.out.println("type1");
			bicycleDAOImpl.updatePossibleCalendarVOType1(calendarMap);
			
		}else if(Integer.parseInt(compare.getStartDay())==0 && Integer.parseInt(compare.getEndDay())>0){
			//type0 신청일의 종료일부터 가능일의 종료일로 update
			System.out.println("type0");
			bicycleDAOImpl.updatePossibleCalendarVOType0(calendarMap);
			
		}
		else if(Integer.parseInt(compare.getStartDay())>0 && Integer.parseInt(compare.getEndDay())==0){
			//type2 
			System.out.println("type2");
			bicycleDAOImpl.updatePossibleCalendarVOType2(calendarMap);			
		}	
		else if(Integer.parseInt(compare.getStartDay())>0 && Integer.parseInt(compare.getEndDay())>0){
			//type3
			bicycleDAOImpl.updatePossibleCalendarVOType3(calendarMap);
		}
		
	}
	@Override
	public List<RentVO> findRentSuccessById(int bicycleNo) {
	      return bicycleDAOImpl.findRentSuccessById(bicycleNo);
	   }
	
	//////////impl5//////////////////
	@Override
	public void writeReview(ReviewVO reviewVO){
		bicycleDAOImpl.writeReview(reviewVO);
		bicycleDAOImpl.updateRentStateTo3(reviewVO.getRentVO().getRentNo());
	}
	@Override
	public RentVO findRentVOForReview(String id, int bicycleNo){
		RentVO rentVO = new RentVO();
		rentVO.setBicycleVO(bicycleDAOImpl.findBicycleByNo(bicycleNo));
		rentVO.setMemberVO(memberDAOImpl.findMemberById(id));
		return bicycleDAOImpl.findRentVOForReview(rentVO);
	}
	@Override
	public List<ReviewVO> getReviewListByBicycleNo(int bicycleNo){
		 List<ReviewVO> reviewList =  bicycleDAOImpl.getReviewListByBicycleNo(bicycleNo);
		 
		 for(int i=0; i<reviewList.size(); i++){
			String reviewerid= reviewList.get(i).getRentVO().getMemberVO().getId();
			String pic = memberDAOImpl.findMemberById(reviewerid).getPicture();
			reviewList.get(i).getRentVO().getMemberVO().setPicture(pic);
		 }
		 System.out.println(reviewList);
		 return reviewList;
	}
	@Override
	public boolean reviewCheck(String id, String bicycleNo) {
		RentVO rvo = new RentVO();
		rvo.setMemberVO(new MemberVO(id));
		rvo.setBicycleVO(new BicycleVO(Integer.parseInt(bicycleNo)));		

		List<RentVO> list = bicycleDAOImpl.reviewCheck(rvo);
		if(list.size()!=0)
				return true;
		else
			return false;
	}
}
