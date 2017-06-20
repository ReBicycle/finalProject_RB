package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.BoardDAO;
import org.kosta.rebicycle.model.vo.BoardReplyVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.ReportVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	@Resource(name="boardDAOImpl")
	private BoardDAO boardDAO;
	@Override
	public void write(ReportVO rvo){
		boardDAO.write(rvo);
		// rvo의 정보를 boardDAO에 있는 write 메서드에 전달해준다.
	}
	@Override
	// getReportList 메서드의 리턴값을 1로 둔 이유는 헤더에서 신고게시판을 클릭시 첫 페이지가
	// 1번페이지가 나오게 하기 위함이다.
	public ListVO getReportList(){
		return getReportList("1");
	}
	@Override
	public ListVO getReportList(String pageNo){
		//토탈 카운트에는 현제 게시물의 총 갯수가 들어간다
		int totalCount=boardDAO.getTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		return new ListVO(boardDAO.getReportList(pagingBean),pagingBean);
	}
	@Override
	// 신고 게시판의 선택 된 게시물의 상세보기로 넘어가는 메서드이다.
	// board_list를 보면 board_detail.do?reportNo라고 되어있는데
	// 선택한 게시물의 reportNo의 값을 같이 boardDAO로 넘겨준다
	public ReportVO boardDetail(int reportNo){
		boardDAO.boardDetail(reportNo);
		return boardDAO.boardDetail(reportNo);
		//DAO에서 받은 정보를 다시 컨트롤러로 리턴해준다.
	}
	@Override
	// 신고게시글을 수정해주는 Service 부분의 메서드
	// DAO로 보내준다.
	public void updateReport(ReportVO rvo){
		boardDAO.updateReport(rvo);
	}
	@Override
	// 이 메서드는 Detail에서 수정 버튼을 누르면 수정페이지로 이동하는 메서드이다.
	// 해당 게시글의 reportNo(게시판 번호)를 통해 넘버와 일치된 정보를 불러온다.
	// 단순한 수정페이지로 넘어가기 위해 만든 메서드이다.
	public ReportVO boardUpdateReportView(int reportNo){
		boardDAO.boardUpdateReportView(reportNo);
		return boardDAO.boardUpdateReportView(reportNo);
	}
	@Override
	// 신고 게시물을 삭제해주는 메서드이다.
	// 수정과 똑같이 해당 게시글의 넘버로 정보를 찾아온다.
	public void deleteReport(int reportNo){
		boardDAO.deleteReport(reportNo);
	}
	@Override
	// 게시물 수정페이지로 넘어가기위해 해당 게시물의 번호를 참조하여
	// 게시물의 정보를 불러오는 것 
	public ReportVO findReportNo(int reportNo){		
		return boardDAO.boardUpdateReportView(reportNo);
	}	
	@Override
	// reportNo = brdno 해당 댓글이 달린 게시물을 찾아주는 메서드
	public BoardReplyVO findBoardReplyNo(int brdno){
		return boardDAO.findBoardReplyNo(brdno);
	}
	@Override
	// 댓글을 작성하게 해주는 메서드
	public void commentWrite(BoardReplyVO brv){
		System.out.println("댓글 서비스 테스트"+ brv);
		boardDAO.commentWrite(brv);
	}
	@Override
	// 댓글 리스트를 띄워주기 위해 사용하는 메서드
	public List<BoardReplyVO> getReplyList(int brv){
		System.out.println("servic			"+brv);
		return boardDAO.getReplyList(brv);
	}
	@Override
	// 댓글을 업데이트 시켜주기 위한 메서드
	public void boardCommentUpdate(BoardReplyVO brv){
		System.out.println("댓글수정 서비스 테스트"+brv);
		boardDAO.boardCommentUpdate(brv);
	}
	/*@Override
	//
	public BoardReplyVO boardUpdateCommentView(int reno){
		boardDAO.boardUpdateCommentView(reno);
		return boardDAO.boardUpdateCommentView(reno);
	}*/
	@Override
	// 댓글 삭제 메서드
	public void boardCommentDelete(int reno){
		boardDAO.boardCommentDelete(reno);
	}
}
