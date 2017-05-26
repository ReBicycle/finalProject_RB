package org.kosta.rebicycle.controller;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.BicycleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
		//@Resource
	//	private BicycleService bService;
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
		public ModelAndView bicycleList(String address,String startDate,String endDate){
			System.out.println("검색 컨트롤러실행"+address+startDate+endDate);
			//BicycleVO bike=new BicycleVO(1, null,null , 5000, "판교", "37", "121", 100000, "미니벨로", "애끼는자전거", "","","");
			//System.out.println(bike);
			//return new ModelAndView("bicycle/bicycle_search_list.tiles","bicycleList",bike);
			return new ModelAndView("bicycle/bicycle_search_list.tiles");
		}
}
