package org.kosta.rebicycle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleServiceImpl2;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
		@Resource
		private BicycleServiceImpl2 service;
		@RequestMapping("home.do")
		public String home(){
			
			return "home.tiles";
		}
		
		@RequestMapping("{dirName}/{viewName}.do")
		public String showView(@PathVariable String dirName, @PathVariable String viewName) {
			//System.out.println("@PathVariable:" + dirName + viewName);
			return dirName + "/" + viewName + ".tiles";
		}
		@RequestMapping("bicycle/bicycle_search_list.do")
		public ModelAndView bicycleList(HttpServletRequest request,String address,String startDay,String endDay){
			System.out.println("검색 컨트롤러실행"+address+startDay+endDay);
			List<BicycleVO>list=service.getBicycleListByAddressAndDay(address, startDay, endDay);
			return new ModelAndView("bicycle/bicycle_search_list.tiles","bicycleList",list);
		}
		@RequestMapping("bicycle/sortByBikeType.do")
		@ResponseBody
		public List<BicycleVO> sortByBikeType(HttpServletRequest request,String address,String startDay,String endDay,String bikeType){
			System.out.println("타입별 정렬 컨트롤러 실행");
		if(bikeType==""){
			return service.getBicycleListByAddressAndDay(address, startDay, endDay);
		}
		return service.sortByBikeType(address, startDay, endDay, bikeType);
		}
		@RequestMapping("bicycle/sortByPriceType.do")
		@ResponseBody
		public List<BicycleVO> sortByPriceType(String address,String startDay,String endDay,String priceType){
			System.out.println("타입별 정렬 컨트롤러 실행");
		if(priceType=="")
			return service.getBicycleListByAddressAndDay(address, startDay, endDay);
		return service.sortByPriceType(address, startDay, endDay,priceType);	
		}

		
}
