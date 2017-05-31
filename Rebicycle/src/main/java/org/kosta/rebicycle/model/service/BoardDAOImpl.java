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
	public ReportVO boardDetail(String reportNo){
		return (ReportVO)sqlSessionTemplate.selectOne("board.boardDetail",reportNo);
	}
}
