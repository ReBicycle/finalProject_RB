package org.kosta.rebicycle.model.vo;

public class ReportVO {
	private String reporterId;
	private String blackId;
	private String contents;
	private String reportDate;
	public ReportVO() {
		super();
	}
	public ReportVO(String reporterId, String blackId, String contents, String reportDate) {
		super();
		this.reporterId = reporterId;
		this.blackId = blackId;
		this.contents = contents;
		this.reportDate = reportDate;
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
	@Override
	public String toString() {
		return "ReportVO [reporterId=" + reporterId + ", blackId=" + blackId + ", contents=" + contents
				+ ", reportDate=" + reportDate + "]";
	}
	
	
}
