package org.kosta.rebicycle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

		@RequestMapping("home.do")
		public String home(){
			
			return "home.tiles";
		}
		
		@RequestMapping("{dirName}/{viewName}.do")
		public String showView(@PathVariable String dirName, @PathVariable String viewName) {
			//System.out.println("@PathVariable:" + dirName + viewName);
			return dirName + "/" + viewName + ".tiles";
		}
}
