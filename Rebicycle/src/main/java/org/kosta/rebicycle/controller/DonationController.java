package org.kosta.rebicycle.controller;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.service.DonationService;
import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DonationController {
	@Resource
	private DonationService donationService;
	
		@RequestMapping("donation/donation_register_form.do")
		public String donationRegisterForm(){
				
			return "donation/donation_register_form.tiles";
		}
		@RequestMapping("donation/donation_list.do")
		public ModelAndView getDonationList(String nowPage){
			String page="1";
			if(nowPage!=null)
				page=nowPage;
			ListVO listVO=donationService.getDonationList(page);
			System.out.println(listVO.getdonationList().get(0).getPhotoVO().getPhoto1());
			return new ModelAndView("donation/donation_list.tiles","listVO",listVO);
		}
		@RequestMapping("donation/donation_register.do")
		public ModelAndView donationRegister(DonationVO dvo,String roadAddress, String jibunAddress, String detailAddress ){
			String address = roadAddress + "%" + jibunAddress + "%" + detailAddress;
			dvo.setAddress(address);
				donationService.registerDonation(dvo);
			return new ModelAndView("redirect:donation/donation_detail.do?donationbicycleno="+dvo.getDonationBicycleNo());
		}
		@RequestMapping("donation/donation_detail.do")
		public ModelAndView findDonationDetailByNo(String donationbicycleno){
			
			return new ModelAndView("donation/donation_detail.tiles","donationVO",donationService.findDonationDetailByNo(donationbicycleno));
		}
}
