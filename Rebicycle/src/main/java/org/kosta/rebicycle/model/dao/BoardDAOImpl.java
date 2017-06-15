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

	@Resource
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
	public BoardReplyVO findBoardReplyNo(int brdno){
		System.out.println("dao   ㅜㅡ      "+brdno);
		System.out.println("test   @@@    "+sqlSessionTemplate.selectOne("board.findBoardReplyNo",brdno));
		return sqlSessionTemplate.selectOne("board.findBoardReplyNo",brdno);
	}
	@Override
	public void commentWrite(BoardReplyVO bvo){
		sqlSessionTemplate.insert("board.commentWrite",bvo);
	}
	@Override
	public List<BoardReplyVO> getReplyList(int brv){
		System.out.println("dao     "+brv);
		System.out.println("return List       "+sqlSessionTemplate.selectList("board.findBoardReplyNo",brv) );
		return sqlSessionTemplate.selectList("board.findBoardReplyNo",brv);
	}
	@Override
	public void boardCommentUpdate(BoardReplyVO brv){
		System.out.println("댓글수정 DAO 테스트"+brv);
		sqlSessionTemplate.update("board.boardCommentUpdate",brv);
	}
	@Override
	public BoardReplyVO boardUpdateCommentView(int reno){
		return (BoardReplyVO)sqlSessionTemplate.selectOne("board.boardUpdateReportView",reno);
	}
	@Override
	public void boardCommentDelete(int reno){
		sqlSessionTemplate.delete("board.boardCommentDelete",reno);
	}
}
