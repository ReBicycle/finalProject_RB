package org.kosta.rebicycle.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BoardService;
import org.kosta.rebicycle.model.service.MemberService;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.ReportVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource(name="boardServiceImpl")
	private BoardService boardService;
	private MemberService memberService;
	// 신고글 작성
	@RequestMapping(value="write.do" , method=RequestMethod.POST)
		public ModelAndView write(HttpServletRequest request, ReportVO rvo){
		boardService.write(rvo);
		return new ModelAndView("redirect:board_list.do");
	}
	// 신고 리스트
	@RequestMapping("board_list.do")
	public String list(String pageNo, HttpServletRequest request){
		ListVO lvo = boardService.getReportList(pageNo);
		request.setAttribute("lvo", lvo);
		return "board/board_list.tiles";
	}
	// 신고 게시판 사기꾼 아이디를 찾기위한 메소드였지만 현제 무 쓸모
	/*@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(String id){
		MemberVO mvo=memberService.findMemberById(id);
		System.out.println(mvo);
		String ok="";
		if(mvo==null)
			ok="ok";
		return ok;	
	}*/
	@RequestMapping("boardDetail.do")
	public String boardDetail(String reportNo, HttpServletRequest request) {		
		System.out.println("컨트롤러 시작"+reportNo);
		ReportVO rvo=boardService.boardDetail(reportNo);
		request.setAttribute("rvo",rvo);
		return "board/board_detail.tiles";
	}
}
