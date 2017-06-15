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
	}
	@Override
	public ListVO getReportList(){
		return getReportList("1");
	}
	@Override
	public ListVO getReportList(String pageNo){
		int totalCount=boardDAO.getTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
			pagingBean=new PagingBean(totalCount);
		else
			pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		return new ListVO(boardDAO.getReportList(pagingBean),pagingBean);
	}
	@Override
	public ReportVO boardDetail(int reportNo){
		boardDAO.boardDetail(reportNo);
		return boardDAO.boardDetail(reportNo);
	}
	@Override
	public void updateReport(ReportVO rvo){
		boardDAO.updateReport(rvo);
	}
	@Override
	public ReportVO boardUpdateReportView(int reportNo){
		boardDAO.boardUpdateReportView(reportNo);
		return boardDAO.boardUpdateReportView(reportNo);
	}
	@Override
	public void deleteReport(int reportNo){
		boardDAO.deleteReport(reportNo);
	}
	@Override
	public ReportVO findReportNo(int reportNo){		
		return boardDAO.boardUpdateReportView(reportNo);
	}	
	@Override
	public BoardReplyVO findBoardReplyNo(int brdno){
		return boardDAO.findBoardReplyNo(brdno);
	}
	@Override
	public void commentWrite(BoardReplyVO bvo){
		boardDAO.commentWrite(bvo);
	}
	@Override
	public List<BoardReplyVO> getReplyList(int brv){
		System.out.println("servic			"+brv);
		return boardDAO.getReplyList(brv);
	}
	@Override
	public void boardCommentUpdate(BoardReplyVO brv){
		System.out.println("댓글수정 서비스 테스트"+brv);
		boardDAO.boardCommentUpdate(brv);
	}
	@Override
	public BoardReplyVO boardUpdateCommentView(int reno){
		boardDAO.boardUpdateCommentView(reno);
		return boardDAO.boardUpdateCommentView(reno);
	}
	@Override
	public void boardCommentDelete(int reno){
		boardDAO.boardCommentDelete(reno);
	}
}
