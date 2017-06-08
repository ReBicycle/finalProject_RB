package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.BoardReplyVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.ReportVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void write(ReportVO rvo){
		sqlSessionTemplate.insert("board.write",rvo);
	}
	@Override
	public int getTotalContentCount(){
		return sqlSessionTemplate.selectOne("board.getTotalContentCount");
	}
	@Override
	public List<ReportVO> getReportList(PagingBean pagingBean){
		System.out.println("pagingBean     "+pagingBean.getStartRowNumber()+"     "+pagingBean.getEndRowNumber());
		return sqlSessionTemplate.selectList("board.getReportList",pagingBean);
	}
	@Override
	public ReportVO boardDetail(int reportNo){
		return (ReportVO)sqlSessionTemplate.selectOne("board.boardDetail",reportNo);
	}
	@Override
	public ReportVO boardUpdateReportView(int reportNo){
		return (ReportVO)sqlSessionTemplate.selectOne("board.boardUpdateReportView",reportNo);
	}
	@Override
	public void updateReport(ReportVO rvo){
		sqlSessionTemplate.update("board.updateReport",rvo);
	}
	@Override
	public void deleteReport(int reportNo){
		sqlSessionTemplate.delete("board.deleteReport",reportNo);
	}
	@Override
	public BoardReplyVO findBoardReplyNo(int reno){
		return (BoardReplyVO)sqlSessionTemplate.selectOne("board.findBoardReplyNo",reno);
	}
	@Override
	public void commentWrite(BoardReplyVO bvo){
		sqlSessionTemplate.insert("board.commentWrite",bvo);
	}
	@Override
	public List<BoardReplyVO> getReplyList(BoardReplyVO brv){
		System.out.println("ReplyList     "+brv);
		return sqlSessionTemplate.selectList("board.findBoardReplyNo",brv);
	}
}
