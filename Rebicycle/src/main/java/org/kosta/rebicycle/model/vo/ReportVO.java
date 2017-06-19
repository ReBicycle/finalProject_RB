package org.kosta.rebicycle.model.vo;

import java.util.List;

// 신고 게시판 VO입니다
public class ReportVO {
	private int reportNo; // 게시판 넘버
	private String reportTitle; // 게시판 제목
	private String reporterId; // 작성자 ID
	private String blackId; // 신고할 ID
	private String contents; // 신고 게시판 내용
	private String reportDate; // 신고 글 작성 날짜
	private List<BoardReplyVO>replyList; // 댓글 VO를 hash a 관계로 갖고 있다
	// 기본 생성자
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 객체 생성자
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
	// 겟터 & 셋터
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
	// toString 부분
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reporterId=" + reporterId
				+ ", blackId=" + blackId + ", contents=" + contents + ", reportDate=" + reportDate + ", replyList="
				+ replyList + "]";
	}
}
