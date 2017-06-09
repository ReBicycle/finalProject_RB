package org.kosta.rebicycle.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl5;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Service;
//종봉이 사용
@Service
public class BicycleServiceImpl2 implements BicycleService {
	@Resource
	private BicycleDAOImpl5 dao;
	
	public List<BicycleVO> getBicycleListByAddressAndDay(String address,String startDay,String endDay){
			
		return dao.getBicycleListByAddressAndDay(address, startDay, endDay);
	}

	public List<BicycleVO> sortByBikeType(String address, String startDay, String endDay, String bikeType) {
		System.out.println("타입정렬서비스실행");
		List<BicycleVO> originList=dao.getBicycleListByAddressAndDay(address, startDay, endDay);
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

	public List<BicycleVO> sortByPriceType(String address, String startDay, String endDay, String priceType) {
		System.out.println("가격정렬서비스실행");
		List<BicycleVO> list=dao.getBicycleListByAddressAndDay(address, startDay, endDay);
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
}
