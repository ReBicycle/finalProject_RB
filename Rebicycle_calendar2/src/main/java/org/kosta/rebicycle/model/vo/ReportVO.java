package org.kosta.rebicycle.model.vo;

public class ReportVO {
	private int reportNo;
	private String reporterId;
	private String blackId;
	private String contents;
	private String reportDate;
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportVO(int reportNo, String reporterId, String blackId, String contents, String reportDate) {
		super();
		this.reportNo = reportNo;
		this.reporterId = reporterId;
		this.blackId = blackId;
		this.contents = contents;
		this.reportDate = reportDate;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
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
		return "ReportVO [reportNo=" + reportNo + ", reporterId=" + reporterId + ", blackId=" + blackId + ", contents="
				+ contents + ", reportDate=" + reportDate + "]";
	}
}
