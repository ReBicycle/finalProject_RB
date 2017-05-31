package org.kosta.rebicycle.model.service;

import java.util.List;

import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.ReportVO;

public interface BoardDAO {

	void write(ReportVO rvo);

	List<ReportVO> getReportList(PagingBean pagingBean);

	int getTotalContentCount();

	ReportVO boardDetail(String reportNo);

}
