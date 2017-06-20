package org.kosta.rebicycle.controller;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.DonationService;
import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.StoryVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationController {
	@Resource
	private DonationService donationService;
	
		@RequestMapping("donation/donation_register_form.do")
		public String donationRegisterForm(){
				
			return "donation/donation_register_form.tiles";
		}
		@RequestMapping("donation_list.do")
		public ModelAndView getDonationList(String nowPage){
			String page="1";
			if(nowPage!=null)
				page=nowPage;
			ListVO listVO=donationService.getDonationList(page);
			return new ModelAndView("donation/donation_list.tiles","listVO",listVO);
		}
		@RequestMapping("donation/donation_register.do")
		public ModelAndView donationRegister(DonationVO dvo,String roadAddress, String jibunAddress, String detailAddress ){
			String address = roadAddress + "%" + jibunAddress + "%" + detailAddress;
			dvo.setAddress(address);
				donationService.registerDonation(dvo);
			return new ModelAndView("redirect:donation_detail.do?donationBicycleNo="+dvo.getDonationBicycleNo());
		}
		@RequestMapping("donation/donation_detail.do")
		public ModelAndView findDonationDetailByNo(String donationBicycleNo){
			
			return new ModelAndView("donation/donation_detail.tiles","donationVO",donationService.findDonationDetailByNo(donationBicycleNo));
		}
		@RequestMapping(method=RequestMethod.POST,value="donation/donation_story_register.do")
		public String donationStoryRegister(StoryVO svo){
			System.out.println("컨트롤러 테스트 "+svo.getDonationBicycleNo()+" "+svo.getTitle()+" "+svo.getId()+" "+svo.getDetail());
			try{	
			donationService.donationStoryRegister(svo);
			}catch(Exception e){
			return "story_register_fail.tiles?donationBicycleNo="+svo.getDonationBicycleNo();
		}
			return "redirect:donation_detail.do?donationBicycleNo="+svo.getDonationBicycleNo();
			
		}
		@RequestMapping("donation/selectStory.do")
		@ResponseBody
		public String selectStory(DonationVO dvo){
			System.out.println("사연선택테스트"+dvo.getStoryId()+" "+dvo.getDonationBicycleNo());
			donationService.selectStory(dvo);
			return "ok";
		}
		@RequestMapping("donation/donation_update_form.do")
		public ModelAndView donationUpdateForm(String donationBicycleNo){
			return new ModelAndView("donation/donation_update_form.tiles","donationVO",donationService.findDonationDetailByNo(donationBicycleNo));
		}
		@RequestMapping("donation/donation_update.do")
		public String donationUpdate(DonationVO dvo){
			donationService.donationUpdate(dvo);
		
			return "redirect:donaion_list.do";
		}
		@RequestMapping("donation/donation_delete.do")
		public String donationDelete(String donationBicycleNo){
			donationService.donationDelete(donationBicycleNo);
			return "redirect:donation_list.do";
		}
}
