package org.kosta.rebicycle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.service.BoardService;
import org.kosta.rebicycle.model.vo.BoardReplyVO;
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
	// 신고글 작성
	@RequestMapping(value="write.do" , method=RequestMethod.POST)
		public ModelAndView write(HttpServletRequest request, ReportVO rvo){
		boardService.write(rvo);
		System.out.println("fdjsklfjskldfjlsk"+ rvo);
		return new ModelAndView("redirect:findReportNo.do?reportNo="+rvo.getReportNo());
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
	// 로그인 후 게시글 상세보기로 넘어가는 컨트롤러
	@RequestMapping("boardDetail.do")
	public ModelAndView boardDetail(int reportNo, HttpServletRequest request) {		
		System.out.println("컨트롤러 시작"+reportNo);
		ReportVO rvo=boardService.boardDetail(reportNo);
		System.out.println("2  **");
		List<BoardReplyVO> brv=boardService.getReplyList(reportNo);
		System.out.println("댓글    "+brv);
		request.setAttribute("rvo",rvo);
		request.setAttribute("brv", brv);
		System.out.println(rvo);
		return new ModelAndView("board/board_detail.tiles");
	}
	//로그인 후 자신이 작성한 신고 글 수정 페이지로 넘어가는 컨트롤러
	@RequestMapping("boardUpdateReportView.do")
	public String updateReportView(int reportNo, HttpServletRequest request){
		System.out.println("수정페이지 GO!!GO!!"+reportNo);
		ReportVO rvo=boardService.boardDetail(reportNo);
		request.setAttribute("rvo", rvo);
		return "board/board_update.tiles";
	}
	@RequestMapping(value="updateReport.do" , method=RequestMethod.POST)
	public ModelAndView updateReport(ReportVO rvo, HttpServletRequest request) {
		boardService.updateReport(rvo);
		System.out.println("업데이트"+rvo);
		request.setAttribute("rvo", rvo);
		return new ModelAndView("redirect:findReportNo.do?reportNo="+rvo.getReportNo());
	}
	@RequestMapping("deleteReport.do")
	public ModelAndView deleteReport(int reportNo) {		
		boardService.deleteReport(reportNo);		
		return new ModelAndView("board/board_list.tiles","lvo",boardService.getReportList());
	}
	@RequestMapping("findReportNo.do")
	public ModelAndView findReportNo(int reportNo){
		return new ModelAndView("board/board_detail.tiles","rvo",boardService.findReportNo(reportNo));
	}
	@RequestMapping("findBoardReplyNo.do")
	public ModelAndView findBoardReplyNo(int brdno, HttpServletRequest request){
		System.out.println("컨트롤러 시작"+brdno);
		ReportVO rvo=boardService.boardDetail(brdno);
		System.out.println("2  **");
		List<BoardReplyVO> brv=boardService.getReplyList(brdno);
		System.out.println("댓글    "+brv);
		request.setAttribute("rvo",rvo);
		request.setAttribute("brv", brv);
		System.out.println(rvo);
		return new ModelAndView("board/board_detail.tiles");
	}
	@RequestMapping(value="commentWrite.do", method=RequestMethod.POST)
	public ModelAndView commentWrite(HttpServletRequest request, BoardReplyVO brv){
		boardService.commentWrite(brv);
		System.out.println("댓글이다아아아아~~~~~~~      "+ brv);
		/*request.setAttribute("brv", brv);*/
		
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+brv.getBrdno());
	}
	//참고용
	/*@RequestMapping(value="write.do" , method=RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request, ReportVO rvo){
	boardService.write(rvo);
	System.out.println("fdjsklfjskldfjlsk"+ rvo);
	return new ModelAndView("redirect:findReportNo.do?reportNo="+rvo.getReportNo());
}*/
}
