package org.kosta.rebicycle.model.service;

import java.util.List;

import javax.annotation.Resource;

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
}
