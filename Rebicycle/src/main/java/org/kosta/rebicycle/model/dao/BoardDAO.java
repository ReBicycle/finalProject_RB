package org.kosta.rebicycle.model.dao;

import java.util.List;

import org.kosta.rebicycle.model.vo.BoardReplyVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.ReportVO;

public interface BoardDAO {

	void write(ReportVO rvo);

	List<ReportVO> getReportList(PagingBean pagingBean);

	int getTotalContentCount();

	ReportVO boardDetail(int reportNo);

	void updateReport(ReportVO rvo);

	ReportVO boardUpdateReportView(int reportNo);

	void deleteReport(int reportNo);

	void commentWrite(BoardReplyVO brv);

	BoardReplyVO findBoardReplyNo(int brdno);

	List<BoardReplyVO> getReplyList(int brv);

	void boardCommentUpdate(BoardReplyVO brv);

	/*BoardReplyVO boardUpdateCommentView(int reno);*/

	void boardCommentDelete(int reno);

}
