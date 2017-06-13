package org.kosta.rebicycle.model.vo;

import java.util.List;

public class ReportVO {
	private int reportNo;
	private String reportTitle;
	private String reporterId;
	private String blackId;
	private String contents;
	private String reportDate;
	private List<BoardReplyVO>replyList;
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportVO(int reportNo, String reportTitle, String reporterId, String blackId, String contents,
			String reportDate, List<BoardReplyVO> replyList) {
		super();
		this.reportNo = reportNo;
		this.reportTitle = reportTitle;
		this.reporterId = reporterId;
		this.blackId = blackId;
		this.contents = contents;
		this.reportDate = reportDate;
		this.replyList = replyList;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReporterId() {
		return reporterId;
	}
	public void setReporterId(String reporterId) {
		this.reporterId = reporterId;
	}
	public String getBlackId() {
		return blackId;
	}
	public void setBlackId(String blackId) {
		this.blackId = blackId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public List<BoardReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<BoardReplyVO> replyList) {
		this.replyList = replyList;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reporterId=" + reporterId
				+ ", blackId=" + blackId + ", contents=" + contents + ", reportDate=" + reportDate + ", replyList="
				+ replyList + "]";
	}
}
