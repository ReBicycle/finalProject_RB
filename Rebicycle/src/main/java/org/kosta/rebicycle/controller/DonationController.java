package org.kosta.rebicycle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonationController {

		@RequestMapping("donation/donation_register_form.do")
		public String donationRegisterForm(){
				
			return "donation/donation_register_form.tiles";
		}
	
}
