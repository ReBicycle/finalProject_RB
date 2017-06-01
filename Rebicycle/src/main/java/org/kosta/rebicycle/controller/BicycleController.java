package org.kosta.rebicycle.controller;

import java.net.Inet4Address;
import java.sql.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BicycleServiceImpl1;
import org.kosta.rebicycle.model.service.BicycleServiceImpl2;
import org.kosta.rebicycle.model.service.BicycleServiceImpl3;
import org.kosta.rebicycle.model.vo.BicycleVO;
import org.kosta.rebicycle.model.vo.CalendarVO;
import org.kosta.rebicycle.model.vo.CategoryVO;
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
	
	@RequestMapping(method = RequestMethod.POST, value = "registerBicycle.do")
	public String registerBicycle(BicycleVO bvo,String memberId, int categoryNo, CalendarVO cvo, String roadAddress, String jibunAddress, String detailAddress, HttpServletRequest request){
		String stArr[] = request.getParameterValues("startDay");
		String endArr[] = request.getParameterValues("endDay");
		bvo.setMemberVO(new MemberVO(memberId));
		bvo.setCategoryVO(new CategoryVO());
		bvo.getCategoryVO().setCategoryNo(categoryNo);
		String address = roadAddress + "," + jibunAddress + "/" + detailAddress;
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
		
		serviceImpl1.registerBicycle(bvo, calList, uploadPath);
		System.out.println(bvo);
		System.out.println(cvo);
		return "bicycle/bicycle_register_result.tiles";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "calculatePrice.do")
	@ResponseBody
	public ArrayList<Object> calculatePrice(int categoryNo){
		ArrayList<Object> calList = new ArrayList<Object>();
		calList = serviceImpl1.calculatePrice(categoryNo);
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
		//cListSubstring = 2017-05-31 0:00:00 형식으로 저장된 데이터의를'YYYY/MM/DD/' 의 형식으로 잘라 넣음
		BicycleVO bvo = serviceImpl3.findBicycleDetailByNo(no);
		for(int i=0; i<cList.size(); i++){
			CalendarVO cvo=new CalendarVO();
			String stardDay;
			String endDay;
			stardDay=cList.get(i).getStartDay().substring(0,10);
			endDay=cList.get(i).getEndDay().substring(0,10);
			cvo.setStartDay(stardDay);
			cvo.setEndDay(endDay);
			cList.set(i, cvo);
		}
		//substring 해준 날짜가 들어간 bvo
		bvo.setPossibleList(cList);
		model.addAttribute("findBvo", bvo);
		return "bicycle/bicycle_detail.tiles";
	}
	
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
			possibleTotalDay.put("title", "rent");
			possibleTotalDay.put("start", possibleStartDay[i]);
			possibleTotalDay.put("end", possibleEndDay[i]);
			possibleDayList.add(possibleTotalDay);
		}
		return possibleDayList;
	}
}





