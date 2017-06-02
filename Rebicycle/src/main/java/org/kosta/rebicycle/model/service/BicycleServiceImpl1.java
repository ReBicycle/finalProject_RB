package org.kosta.rebicycle.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BicycleDAOImpl1;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BicycleServiceImpl1 implements BicycleService {
	@Resource
	private BicycleDAOImpl1 daoImpl1;

	public String findCategoryByNo(int categoryNo) {
		return daoImpl1.findCategoryByNo(categoryNo);
	}

	// 등록
	@Transactional
	public void registerBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map) {
		daoImpl1.registerBicycle(bvo);

		for (int i = 0; i < calList.size(); i++) {
			calList.get(i).setBicycleNo(bvo.getBicycleNo());
		}
		daoImpl1.registerPossibleDate(calList);

		PhotoVO pvo = new PhotoVO();
		List<String> list = uploadFile(bvo.getFile(), uploadPath, bvo.getBicycleNo());
		pvo.setBicycleNo(bvo.getBicycleNo());
		pvo.setPhoto1(list.get(0));
		pvo.setPhoto2(list.get(1));
		pvo.setPhoto3(list.get(2));
		daoImpl1.registerFile(pvo);

		map.setBicycleNo(bvo.getBicycleNo());
		daoImpl1.registerMap(map);
	}

	// 수정
	@Transactional
	public void modifyBicycle(BicycleVO bvo, List<CalendarVO> calList, String uploadPath, MapVO map) {
		daoImpl1.updateBicycle(bvo);
		bvo.setPossibleList((ArrayList<CalendarVO>) daoImpl1.findPossibleDay(bvo.getBicycleNo()));

		// 가능일 수정
		daoImpl1.deletePossibleDay(calList.get(0));
		for (int i = 0; i < calList.size(); i++) {
			calList.get(i).setBicycleNo(bvo.getBicycleNo());
		}
		daoImpl1.insertPossibleDay(calList);

		// 사진 수정
		PhotoVO pvo = new PhotoVO();
		List<String> list = uploadFile(bvo.getFile(), uploadPath, bvo.getBicycleNo());
		pvo.setBicycleNo(bvo.getBicycleNo());
		pvo.setPhoto1(list.get(0));
		pvo.setPhoto2(list.get(1));
		pvo.setPhoto3(list.get(2));

		// 위도경도 수정
		if (map != null) {
			map.setBicycleNo(bvo.getBicycleNo());
			daoImpl1.updateMap(map);
		}
	}

	public ArrayList<Object> calculatePrice(int categoryNo) {
		ArrayList<Object> calList = new ArrayList<Object>();
		if (daoImpl1.countCategory(categoryNo) == 0) {
			calList = null;
		} else {
			int min = daoImpl1.calculateMinPrice(categoryNo);
			int max = daoImpl1.calculateMaxPrice(categoryNo);
			double avg = daoImpl1.calculateAvgPrice(categoryNo);
			calList.add(min);
			calList.add(max);
			calList.add(avg);
		}
		return calList;
	}

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
}// class
