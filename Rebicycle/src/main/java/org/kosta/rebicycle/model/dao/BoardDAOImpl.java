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
		// 네임스페이스가 board 이고 id가 write인 sql문을 찾은후 rvo값을 넘겨준다
		// 정보를 입력하는 것이기 때문에 리턴값을 없다
	}
	@Override
	public int getTotalContentCount(){
		return sqlSessionTemplate.selectOne("board.getTotalContentCount");
	}
	@Override
	// 
	public List<ReportVO> getReportList(PagingBean pagingBean){
		System.out.println("pagingBean     "+pagingBean.getStartRowNumber()+"     "+pagingBean.getEndRowNumber());
		return sqlSessionTemplate.selectList("board.getReportList",pagingBean);
	}
	@Override
	//ReportVO에 있는 해당 reportNo의 번호의 정보를 찾아온다
	// 네임스페이스가 board이며 id가 boardDetail인 것
	public ReportVO boardDetail(int reportNo){
		return (ReportVO)sqlSessionTemplate.selectOne("board.boardDetail",reportNo);
		// 정보를 찾았으면 그 정보를 다시 서비스로 리턴해준다.
	}
	@Override
	public ReportVO boardUpdateReportView(int reportNo){
		return (ReportVO)sqlSessionTemplate.selectOne("board.boardUpdateReportView",reportNo);
		//데이터베이스에서 해당 넘버의 ReportVO의 정보를 조회한다.
	}
	@Override
	// 신고 게시글 업데이트 메서드
	public void updateReport(ReportVO rvo){
		sqlSessionTemplate.update("board.updateReport",rvo);
	}
	@Override
	// 게시글 삭제 메서드
	public void deleteReport(int reportNo){
		sqlSessionTemplate.delete("board.deleteReport",reportNo);
	}
	@Override
	// BoardReplyNo의 brdno(게시판넘버)를 찾아주는 메서드
	public BoardReplyVO findBoardReplyNo(int brdno){
		System.out.println("dao   ㅜㅡ      "+brdno);
		System.out.println("test   @@@    "+sqlSessionTemplate.selectOne("board.findBoardReplyNo",brdno));
		return sqlSessionTemplate.selectOne("board.findBoardReplyNo",brdno);
	}
	@Override
	// 댓글 작성 메서드
	public void commentWrite(BoardReplyVO brv){
		sqlSessionTemplate.insert("board.commentWrite",brv);
		System.out.println("댓글 다오 테스트"+brv);
	}
	@Override
	// 댓글 리스트를 불러오는 메서드
	public List<BoardReplyVO> getReplyList(int brv){
		System.out.println("dao     "+brv);
		System.out.println("return List       "+sqlSessionTemplate.selectList("board.findBoardReplyNo",brv) );
		return sqlSessionTemplate.selectList("board.findBoardReplyNo",brv);
	}
	@Override
	// 댓글 수정 메서드
	public void boardCommentUpdate(BoardReplyVO brv){
		System.out.println("댓글수정 DAO 테스트"+brv);
		sqlSessionTemplate.update("board.boardCommentUpdate",brv);
	}
	/*@Override
	public BoardReplyVO boardUpdateCommentView(int reno){
		return (BoardReplyVO)sqlSessionTemplate.selectOne("board.boardUpdateReportView",reno);
	}*/
	@Override
	// 댓글 삭제 메서드
	public void boardCommentDelete(int reno){
		sqlSessionTemplate.delete("board.boardCommentDelete",reno);
	}
}
