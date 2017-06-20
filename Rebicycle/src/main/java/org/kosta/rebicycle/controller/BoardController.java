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
		// board_write_from에 있는 rvo값을 갖고 와서 boardService.write로 보내 준 후
		// 데이터베이스에 인설트가 제대로 작동되었으면 reportNo에 맞는 상세 게시물 페이지로 이동한다
		// findReportNo.do의 자세한 설명은 밑의 메소드에서...
	}
	// 신고 리스트
	@RequestMapping("board_list.do")
	public String list(String pageNo, HttpServletRequest request){
		ListVO lvo = boardService.getReportList(pageNo);
		request.setAttribute("lvo", lvo);
		return "board/board_list.tiles";
		/* 헤더 레이아웃에 있는 신고 게시판을 누르면 board_list.do를 통해 리스트페이지로 넘어가게 되는데
		 * ListVO에는 ReportVO(신고게시판VO), PagingBean이 has a 관계로 있다
		 * boardService에 있는 getReportList라는 메소드 부분을 보면 리턴값이 1로 되어있다.
		 * 그 리턴값 1을 lvo에 담아서 board_list로 리턴해주게 되면 1페이지가 뜨게 된다.
		 */
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
	//boardDetail 메서드는 로그인 상태에서 리스트에서 타이틀을 클릭 시 선택 게시글을 상세보기를 해주는 메서드이다.
	public ModelAndView boardDetail(int reportNo, HttpServletRequest request) {		
		System.out.println("컨트롤러 시작"+reportNo);
		// 클릭 한 reportNo의 정보를 찾아와서 rvo에 담는다.
		ReportVO rvo=boardService.boardDetail(reportNo);
		System.out.println("2  **");
		request.setAttribute("rvo",rvo);
		// 해당된 정보를 View로 띄워주기위해 setAttribute를 사용해 rvo의 정보를 rvo라는 이름으로 만들어 준다
		System.out.println(rvo);
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+reportNo);
		// 리다이렉트 방식으로 brdno(댓글VO에 있는 게시글 넘버)와 reportNo가 일치한 곳으로 보내준다
		// findBoardReplyNo.do 에 대한 설명은 밑에서..
	}
	//로그인 후 자신이 작성한 신고 글 수정 페이지로 넘어가는 컨트롤러
	@RequestMapping("boardUpdateReportView.do")
	public String updateReportView(int reportNo, HttpServletRequest request){
		System.out.println("수정페이지 GO!!GO!!"+reportNo);
		ReportVO rvo=boardService.boardDetail(reportNo);
		request.setAttribute("rvo", rvo);
		return "board/board_update.tiles";
		// 수정페이지로 넘어가기전에 해당 디테일 정보가 다 필요하기때문에 boardDetail 메서드를 이용해
		// 해당 ReportVO를 불러와서 board_update로 넘어가 수정이 가능하게 끔 해준다.
	}
	@RequestMapping(value="updateReport.do" , method=RequestMethod.POST)
	// 신고 게시글을 수정하는 메서드이다.
	public ModelAndView updateReport(ReportVO rvo, HttpServletRequest request) {
		// 수정 페이지에서 입력한 ReportVO의 정보를 rvo의 이름으로 boardService로 보내준다
		boardService.updateReport(rvo);
		System.out.println("업데이트"+rvo);
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+rvo.getReportNo());
	}
	// 신고 게시물을 삭제하기 위해 만든 메서드이다.
	// reportNo을 통해 해당 게시물을 삭제하게 해준다.
	@RequestMapping("deleteReport.do")
	public ModelAndView deleteReport(int reportNo) {		
		boardService.deleteReport(reportNo);		
		return new ModelAndView("board/board_list.tiles","lvo",boardService.getReportList());
		// 해당 게시물을 삭제하면 리스트페이지로 넘어가게 리턴해준다.
	}
	// reportNo를 이용해 해당 정보를 찾는 메서드이다.
	// 이 메서드는 단 하나의 기능때문에 사용되는데.. 바로 게시글 작성 후에 사용된다.
	// 막 작성된 게시글은 댓글이 하나도 달려있지 않기 때문에 필요한 정보는 ReportNo로 찾은 해당 정보뿐이기 때문이다.
	// 그리하여 이 메소드는 게시글 작성을 위해 유일하게 쓰인다.
	@RequestMapping("findReportNo.do")
	public ModelAndView findReportNo(int reportNo){
		return new ModelAndView("board/board_detail.tiles","rvo",boardService.findReportNo(reportNo));
	}
	// findBoardReplyNo.do는 BoardReplyVO의 brdno로 해당 게시물 정보를 찾기 위한 메서드이다.
	// reportNo와 brdno는 같은 값이며 findReportNo.do와 다르게 ReportVO와 BoardReplyVO의 정보 둘다 갖고있다.
	// 주로 이 메서드는 게시글 수정, 댓글 작성, 댓글 수정 쪽 완료 후 리턴값으로 쓰인다. 이유는 위에 적혀져 있다.
	// 게시글 작성은 처음에 댓글이 없기 때문에 이 메서드로 리턴해주지 않는다.
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
	// 댓글 작성 메서드이다.
	// Detail에서 작성한 Comment 정보를 brv에 실어 Service로 보낸다
	// 데이터베이스까지 잘 가서 등록이 됬다면 바로 확인이 가능하게끔 리턴값을 findBoardReplyNo.do로 주었다.
	@RequestMapping(value="commentWrite.do", method=RequestMethod.POST)
	public ModelAndView commentWrite(HttpServletRequest request, BoardReplyVO brv){
		System.out.println("댓글 컨트롤러 테스트"+ brv);
		boardService.commentWrite(brv);
		System.out.println("댓글이다아아아아~~~~~~~      "+ brv);
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+brv.getBrdno());
	}
	/* 게시글을 수정하기 위해 사용하는 메서드이다.
	 * 해당 뷰에 hidden 값으로 정보를 다 넣어놨기 때문에 그냥 정보를 다 보내줘도 된다.
	 */
	@RequestMapping(value="boardCommentUpdate.do" , method=RequestMethod.POST)
	public ModelAndView updateComment(BoardReplyVO brv, HttpServletRequest request) {
		System.out.println("댓글수정 테스트"+brv);
		boardService.boardCommentUpdate(brv);
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+brv.getBrdno());
	}
	/* 해당 댓글을 삭제해주는 메서드
	 * 해당 댓글번호(reno) 로 해당 정보를 찾아 삭제해준다
	 * 데이터 베이스에서 해당 댓글을 삭제 후 리턴값은 findBoardReplyNo
	 * 왜냐하면 댓글이 여러개이면 해당 댓글이 삭제되더라도 다른 댓글들이 보이게 띄워줘야 하기 때문이다.
	 */
	@RequestMapping("boardCommentDelete.do")
	public ModelAndView boardCommentDelete(int reno, BoardReplyVO brv) {		
		boardService.boardCommentDelete(reno);		
		return new ModelAndView("redirect:findBoardReplyNo.do?brdno="+brv.getBrdno());
	}
}
