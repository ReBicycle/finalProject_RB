package org.kosta.rebicycle.model.service;

import java.util.List;

import org.kosta.rebicycle.model.vo.BoardReplyVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.ReportVO;

public interface BoardService {

	void write(ReportVO rvo);

	ListVO getReportList();

	ListVO getReportList(String pageNo);

	ReportVO boardDetail(int reportNo);

	void updateReport(ReportVO rvo);

	ReportVO boardUpdateReportView(int reportNo);

	void deleteReport(int reportNo);

	ReportVO findReportNo(int reportNo);

	void commentWrite(BoardReplyVO brv);

	BoardReplyVO findBoardReplyNo(int brdno);

	List<BoardReplyVO> getReplyList(int brv);

	void boardCommentUpdate(BoardReplyVO brv);

	/*BoardReplyVO boardUpdateCommentView(int reno);*/

	void boardCommentDelete(int reno);

}
