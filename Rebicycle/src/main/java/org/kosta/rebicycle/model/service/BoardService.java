package org.kosta.rebicycle.model.service;

import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.ReportVO;

public interface BoardService {

	void write(ReportVO rvo);

	ListVO getReportList();

	ListVO getReportList(String pageNo);

	ReportVO boardDetail(String reportNo);

}
