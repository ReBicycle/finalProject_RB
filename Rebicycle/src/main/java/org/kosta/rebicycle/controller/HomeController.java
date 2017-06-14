package org.kosta.rebicycle.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.rebicycle.model.service.BicycleService;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.kosta.rebicycle.model.vo.RentVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
		@Resource
		private BicycleService service;
		@RequestMapping("home.do")
		public String home(HttpServletRequest request){
			return "home.tiles";
		}
		@RequestMapping("member_login.do")
		public String showLoginForm(HttpServletRequest request){
			
			HttpSession session=request.getSession(false);
			if(session!=null){
				MemberVO vo=(MemberVO) session.getAttribute("mvo");
				//각각의 요청을 구분하기 위해 따로 받음
				int findGetRequest=service.findGetRequest(vo.getId());
				int findAcceptRequest=service.findAcceptRequest(vo.getId());
				int findRefuseRequest=service.findRefuseRequest(vo.getId());
				int Total=findGetRequest+findAcceptRequest+findRefuseRequest;
				
				HashMap<String, Integer> totalRequest=new HashMap<>();
				
				totalRequest.put("findGetRequest", findGetRequest);
				totalRequest.put("findAcceptRequest", findAcceptRequest);
				totalRequest.put("findRefuseRequest", findRefuseRequest);
				totalRequest.put("total", Total);
				
				session.setAttribute("totalRequest", totalRequest);
			}
			return "member/member_login.tiles";
		}
		@RequestMapping("{dirName}/{viewName}.do")
		public String showView(@PathVariable String dirName, @PathVariable String viewName) {
			//System.out.println("@PathVariable:" + dirName + viewName);
			return dirName + "/" + viewName + ".tiles";
		}
		@RequestMapping("bicycle_search_list.do")
		public ModelAndView bicycleList(HttpServletRequest request,String address,String startDay,String endDay){
			System.out.println("검색 컨트롤러실행"+address+startDay+endDay);
		
			List<BicycleVO>list=service.getBicycleListByAddressAndDay(address, startDay, endDay);
			return new ModelAndView("bicycle/bicycle_search_list.tiles","bicycleList",list);
		}
		@RequestMapping("sortByBikeType.do")
		@ResponseBody
		public List<BicycleVO> sortByBikeType(HttpServletRequest request,String address,String startDay,String endDay,String bikeType){
			System.out.println("타입별 정렬 컨트롤러 실행");
		if(bikeType==""){
			return service.getBicycleListByAddressAndDay(address, startDay, endDay);
		}
		return service.sortByBikeType(address, startDay, endDay, bikeType);
		}
		@RequestMapping("sortByPriceType.do")
		@ResponseBody
		public List<BicycleVO> sortByPriceType(String address,String startDay,String endDay,String priceType){
			System.out.println("타입별 정렬 컨트롤러 실행");
		if(priceType=="")
			return service.getBicycleListByAddressAndDay(address, startDay, endDay);
		return service.sortByPriceType(address, startDay, endDay,priceType);	
		}

		
}
