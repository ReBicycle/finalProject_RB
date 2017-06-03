package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDAOImpl1 implements BicycleDAO {
	@Resource
	private SqlSessionTemplate template;

	// @Override
	public String findCategoryByNo(int categoryNo) {
		return template.selectOne("bicycle.findCategoryByNo", categoryNo);
	}

	public void registerBicycle(BicycleVO bvo) {
		template.insert("bicycle.registerBicycle", bvo);
	}

	public int countCategory(int categoryNo) {
		return template.selectOne("bicycle.countCategory", categoryNo);
	}

	public int calculateMinPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateMinPrice", categoryNo);
	}

	public int calculateMaxPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateMaxPrice", categoryNo);
	}

	public double calculateAvgPrice(int categoryNo) {
		return template.selectOne("bicycle.calculateAvgPrice", categoryNo);
	}

	public void registerPossibleDate(List<CalendarVO> calList) {
		for (int i = 0; i < calList.size(); i++) {
			template.insert("bicycle.registerPossibleDate", calList.get(i));
		}
	}

	public void registerFile(PhotoVO pvo) {
		template.insert("bicycle.registerFile", pvo);
	}

	public void registerMap(MapVO map) {
		template.insert("bicycle.registerMap", map);
	}

	public List<CalendarVO> findPossibleDay(int bicycleNo) {
		return template.selectList("bicycle.findPossibleDay", bicycleNo);
	}

	public void updateBicycle(BicycleVO bvo) {
		template.update("bicycle.updateBicycle", bvo);
	}

	public void deletePossibleDay(CalendarVO cvo) {
		template.delete("bicycle.deletePossibleDay", cvo);
	}

	public void insertPossibleDay(List<CalendarVO> calList) {
		for (int i = 0; i < calList.size(); i++) {
			template.insert("bicycle.insertPossibleDay", calList.get(i));
		}
	}

	public MapVO findMapByBicycleNo(int bicycleNo) {
		return template.selectOne("bicycle.findMapByBicycleNo", bicycleNo);
	}

	public void updateMap(MapVO map) {
		template.update("bicycle.updateMap", map);
	}
}
