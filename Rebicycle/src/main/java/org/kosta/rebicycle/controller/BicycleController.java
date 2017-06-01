package org.kosta.rebicycle.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.service.BicycleServiceImpl2;
import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarBean;
import org.kosta.rebicycle.model.vo.CalendarManager;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.CategoryVO;
import org.kosta.rebicycle.model.vo.MapVO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BicycleController {
	
	@Resource
	private BicycleServiceImpl1 serviceImpl1;
	@Resource
	private BicycleServiceImpl2 serviceImpl2;
	//정태형//////////////////
	@Resource
	private BicycleServiceImpl3 serviceImpl3;
	
	//자전거 등록
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	public String registerBicycle(BicycleVO bvo,String memberId, int categoryNo, CalendarVO cvo, String roadAddress, String jibunAddress, String detailAddress, HttpServletRequest request){
		String stArr[] = request.getParameterValues("startDay");
		String endArr[] = request.getParameterValues("endDay");
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryVO(new CategoryVO());
		bvo.getCategoryVO().setCategoryNo(categoryNo);
		String address = roadAddress + "," + jibunAddress + "," + detailAddress;
		bvo.setAddress(address);
		// uploadPath 실제 운영시에 사용할 서버 업로드 경로
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		//개발시에는 워크스페이스 업로드 경로로 준다
		//종봉
		//String uploadPath="C:\\Users\\Administrator\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\";
		//태형
		String uploadPath="C:\\Users\\KOSTA\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\"; 

		//가능일 등록
		List<CalendarVO> calList = new ArrayList<CalendarVO>();
		for(int i=0 ; i<stArr.length ; i++) {
			calList.add(new CalendarVO(stArr[i], endArr[i]));
		}
		
		// Map 등록
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		System.out.println("위도" + latitude);
		MapVO map = new MapVO(latitude, longitude);
		
		serviceImpl1.registerBicycle(bvo, calList, uploadPath, map);
		System.out.println(bvo);
		System.out.println(calList);
		System.out.println(map);
		return "redirect:bicycle_register_result.do";
	}
	
	@RequestMapping("bicycle_register_result.do")
	public String bicycleRegisterResult(){
		return "bicycle/bicycle_register_result.tiles";
	}
	
	//자전거 수정
	@RequestMapping(method = RequestMethod.POST, value = "modifyBicycle.do")
	public String modifyBicycle(BicycleVO bvo,String memberId, int categoryNo, CalendarVO cvo, String roadAddress, String jibunAddress, String detailAddress, HttpServletRequest request){
		String stArr[] = request.getParameterValues("startDay");
		String endArr[] = request.getParameterValues("endDay");
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryVO(new CategoryVO());
		bvo.getCategoryVO().setCategoryNo(categoryNo);
		String address = roadAddress + "," + jibunAddress + "," + detailAddress;
		bvo.setAddress(address);
		// uploadPath 실제 운영시에 사용할 서버 업로드 경로
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		//개발시에는 워크스페이스 업로드 경로로 준다
		//종봉
		//String uploadPath="C:\\Users\\Administrator\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\";
		//태형
		String uploadPath="C:\\Users\\KOSTA\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\bicycle\\"; 

		//가능일
		List<CalendarVO> calList = new ArrayList<CalendarVO>();
		for(int i=0 ; i<stArr.length ; i++) {
			calList.add(new CalendarVO(stArr[i], endArr[i]));
		}
		
		// Map 등록
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		MapVO map = new MapVO(latitude, longitude);
		
		//6월2일 할일
		//serviceImpl1.modifyBicycle(bvo, calList, uploadPath, map);
		System.out.println(bvo);
		System.out.println(calList);
		System.out.println(map);
		return "redirect:bicycle_modify_result.do";
	}
	
	@RequestMapping("bicycle_modify_result.do")
	public String bicycleModifyResult(){
		return "bicycle/bicycle_modify_result.tiles";
	}
	
	
	
	
	@RequestMapping(method = RequestMethod.GET, value = "calculatePrice.do")
	@ResponseBody
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		if(serviceImpl1.calculatePrice(categoryNo)==null){
			calList.add("없음");
		} else {
			calList = serviceImpl1.calculatePrice(categoryNo);
		}
		return calList;
	}
	
	//소영 bicycle_search_list_test로
		@RequestMapping("listViewTest.do")
		public String listViewTest(Model model){
			ArrayList<BicycleVO> bList = (ArrayList<BicycleVO>) serviceImpl3.findBicycleList();
			model.addAttribute("bList", bList);
			return "bicycle/bicycle_search_list_test.tiles";
			
		}
		
	///상세보기로 보낼 정보 처리 컨트롤러
	@RequestMapping("findBicycleByNo.do")
	public String findBicycleByNo(String bicycleNo,Model model){
		int no=Integer.parseInt(bicycleNo);
		ArrayList<CalendarVO> cList = (ArrayList<CalendarVO>) serviceImpl3.findPossibleDayByNo(no);
		BicycleVO bvo = serviceImpl3.findBicycleDetailByNo(no);
		bvo.setPossibleList(cList);

		model.addAttribute("findBvo", bvo);
		return "bicycle/bicycle_detail.tiles";
	}

	//calendarBean으로부터 해당 월의 마지막날짜, 1일 요일을 ajax로 받아옴
	//기간을 계산하기 위해 사용자가 입력한 신청 시작 월의 값을 받아와 그 월에 해당하는 정보를 반환
	@RequestMapping("bicycleModifyForm.do")
	public String bicycleModifyForm(String memberId, int bicycleNo, Model model){
		System.out.println(serviceImpl3.findBicycleDetailByNo(bicycleNo));
		BicycleVO bvo = serviceImpl3.findBicycleDetailByNo(bicycleNo);
		
		String[] address = bvo.getAddress().split(",");
		String roadAddress = address[0];
		String jibunAddress = address[1];
		String detailAddress = address[2];
		ArrayList<CalendarVO> calList = (ArrayList<CalendarVO>) serviceImpl3.findPossibleDayByNo(bicycleNo);
		ArrayList<CalendarVO> newCalList = new ArrayList<CalendarVO>();
		
		for(int i=0 ; i<calList.size() ; i++){
			CalendarVO newCal = new CalendarVO();
			newCal.setStartDay(calList.get(i).getStartDay().substring(0, 10));
			newCal.setEndDay(calList.get(i).getEndDay().substring(0, 10));
			newCalList.add(newCal);
		}
		model.addAttribute("bicycleVO", bvo);
		model.addAttribute("possibleDayList", newCalList);
		model.addAttribute("roadAddress", roadAddress);
		model.addAttribute("jibunAddress", jibunAddress);
		model.addAttribute("detailAddress", detailAddress);
		return "bicycle/bicycle_register_modify.tiles";
	}

	@RequestMapping("getCalendarBean.do")
	@ResponseBody
	public String getCalendarBean(String currYear, String startMonth, String endMonth, String startDay, String endDay){
		System.out.println("//" + currYear);
		int currYear2 = Integer.parseInt(currYear);
		int startMonth2 = Integer.parseInt(startMonth);
		int endMonth2 = Integer.parseInt(endMonth);
		int startDay2 = Integer.parseInt(startDay);
		int endDay2 = Integer.parseInt(endDay);
		int result = 0;
		CalendarManager cm = new CalendarManager();
		cm.setCurrent(currYear2, startMonth2);
		CalendarBean cb = cm.getCurrent();
		
		 if(startMonth2 == endMonth2){
 			 result = (endDay2-startDay2)+1;
 		 }else if((startMonth2-endMonth2) == -1 || (endMonth2-startMonth2)==1){
 			result = ((cb.getLastDayOfMonth() - startDay2) + endDay2+1); 
 			
 		 }else if((startMonth2-endMonth2) < -1 || (endMonth2-startMonth2) > 1){
 			 result = ((cb.getLastDayOfMonth() - startDay2) + endDay2+1);
 			 
 			 for(int i = 1;i<(endMonth2-startMonth2);i++){
 				cm.setCurrent(currYear2,(endMonth2-i));
 				cb = cm.getCurrent();
 				result += cb.getLastDayOfMonth();
 			 }
 		 }

		System.out.println(result);

		return ""+ result;
	}
	
	//fullcalendar 에서 events 처리를 해주기 위한 메서드
	@RequestMapping("appearDate.do")
	@ResponseBody
	public ArrayList<Object> appearDate(String bicycleNo){
		int no=Integer.parseInt(bicycleNo);
		ArrayList<CalendarVO> cList = (ArrayList<CalendarVO>) serviceImpl3.findPossibleDayByNo(no);
		
		/*for(int i=0; i<cList.size(); i++){
			// YYYY-MM-DD 0:00:00 형식 뒤 0:00:00을 자르기 위한 과정
			CalendarVO cvo=new CalendarVO();
			String stardDay;
			String endDay;
			stardDay=cList.get(i).getStartDay().substring(0,10);
			endDay=cList.get(i).getEndDay().substring(0,10);
			cvo.setBicycleNo(no);
			cvo.setStartDay(stardDay);
			cvo.setEndDay(endDay);
			cList.set(i, cvo);
		}
		*/
		
		//HashMap 을 사용해 return possibleStartDay,possibleEndDay 값을 넘겨줌 
		ArrayList<Object> possibleDayList =new ArrayList<>();
		for(int i=0; i<cList.size(); i++){
			
			// YYYY-MM-DD 0:00:00 형식 뒤 0:00:00을 자르기 위한 과정
			CalendarVO cvo=new CalendarVO();
			String stardDay;
			String endDay;
			stardDay=cList.get(i).getStartDay().substring(0,10);
			endDay=cList.get(i).getEndDay().substring(0,10);
			cvo.setBicycleNo(no);
			cvo.setStartDay(stardDay);
			cvo.setEndDay(endDay);
			cList.set(i, cvo);
			
			//fullcalendar 에서 events 를 생성하려면 start:YYYY-MM-DD end:YYYY-MM-DD 형식을 만들어야함
			//MAP 을 생성해 키 값으로 'start' , 'end' 를 넣어줌
			HashMap<String, String> possibleTotalDay = new HashMap<String, String>();
			String[] possibleStartDay = new String[cList.size()];
			String[] possibleEndDay = new String[cList.size()];
			possibleStartDay[i]=cList.get(i).getStartDay();
			
			//달력 api 에서 Day 를 하루 적게 표시해주기 때문에 Day 에 +1을 해주기 위한 과정
			String endDayOfDay=cList.get(i).getEndDay().substring(8, 10);
			int IntendDayOfDay=Integer.parseInt(endDayOfDay)+1;
			String ResultOfEndDay=cList.get(i).getStartDay().subSequence(0, 7)+"-"+IntendDayOfDay;
			possibleEndDay[i]=ResultOfEndDay;
			possibleTotalDay.put("title", "예약완료");
			possibleTotalDay.put("start", possibleStartDay[i]);
			possibleTotalDay.put("end", possibleEndDay[i]);
			possibleDayList.add(possibleTotalDay);
		}
		return possibleDayList;
	}

}





