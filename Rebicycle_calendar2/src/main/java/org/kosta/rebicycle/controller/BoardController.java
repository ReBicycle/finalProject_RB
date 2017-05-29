package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BoardService;
import org.kosta.rebicycle.model.vo.ReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource(name="boardServiceImpl")
	private BoardService boardService;
	@RequestMapping(value="write.do" , method=RequestMethod.POST)
		public ModelAndView write(HttpServletRequest request, ReportVO rvo){
		boardService.write(rvo);
		return new ModelAndView("redirect:board/board_list.do");
	}
	@RequestMapping("reportList.do")
	public ModelAndView list(String pageNo){
		return new ModelAndView("board/board_list","lvo",boardService.getReportList(pageNo));
	}
}
