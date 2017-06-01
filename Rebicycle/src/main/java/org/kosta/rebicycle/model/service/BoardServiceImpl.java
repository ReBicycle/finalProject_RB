package org.kosta.rebicycle.model.service;

import javax.annotation.Resource;

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
	public ReportVO boardDetail(String reportNo){
		boardDAO.boardDetail(reportNo);
		return boardDAO.boardDetail(reportNo);
	}
}
