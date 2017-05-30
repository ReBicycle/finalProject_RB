package org.kosta.rebicycle.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BicycleServiceImpl1 implements BicycleService {
	@Resource
	private BicycleDAOImpl1 daoImpl1;
	
	public String findCategoryByNo(int categoryNo){
		return daoImpl1.findCategoryByNo(categoryNo);
	}
	
	@Transactional
	public void registerBicycle(BicycleVO bvo, CalendarVO cvo, String uploadPath){
		daoImpl1.registerBicycle(bvo);
		cvo.setBicycleNo(bvo.getBicycleNo());
		daoImpl1.registerPossibleDate(cvo);
		PhotoVO pvo=new PhotoVO();
		List<String> list=uploadFile(bvo.getFile(),uploadPath,bvo.getBicycleNo());
		System.out.println(list.size());
		pvo.setBicycleNo(bvo.getBicycleNo());
		pvo.setPhoto1(list.get(0));
		pvo.setPhoto2(list.get(1));
		pvo.setPhoto3(list.get(2));
		daoImpl1.registerFile(pvo);
	}
	
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		int min = daoImpl1.calculateMinPrice(categoryNo);
		int max = daoImpl1.calculateMaxPrice(categoryNo);
		double avg = daoImpl1.calculateAvgPrice(categoryNo);
		calList.add(min);
		calList.add(max);
		calList.add(avg);
		return calList;
	}
	
	public List<String> uploadFile(List<MultipartFile> list,String uploadPath,int bicycleNo){
		
		ArrayList<String>nameList=new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			String fileName=String.valueOf(bicycleNo)+"_";
			 fileName+=list.get(i).getOriginalFilename();
			if(fileName.equals("")==false){
				try {
					list.get(i).transferTo(new File(uploadPath+fileName));
					nameList.add(fileName);
					System.out.println("upload 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
				
		}
		return nameList;
	}//uploadFile method
	
}//class
