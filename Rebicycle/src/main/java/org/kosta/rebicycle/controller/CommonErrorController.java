package org.kosta.rebicycle.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonErrorController {
	@RequestMapping(value  = "error/error.do")
	public String error(HttpServletRequest request, Model model){
		
		return "error/error.tiles";
	}
}
