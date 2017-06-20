package org.kosta.rebicycle.model.vo;

public class BoardReplyVO {
	private int brdno; // 게시판 넘버
	private int reno; // 댓글 넘버
	private String rewriter; // 댓글 작성자
	private String rememo; // 댓글 내용
	private String redate; // 댓글 작성 시간
	// 기본 생성자
	public BoardReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 객체 생성자
	public BoardReplyVO(int brdno, int reno, String rewriter, String rememo, String redate) {
		super();
		this.brdno = brdno;
		this.reno = reno;
		this.rewriter = rewriter;
		this.rememo = rememo;
		this.redate = redate;
	}
	// 겟터 & 셋터
	public int getBrdno() {
		return brdno;
	}
	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public String getRememo() {
		return rememo;
	}
	public void setRememo(String rememo) {
		this.rememo = rememo;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	@Override
	// toString
	public String toString() {
		return "BoardReplyVO [brdno=" + brdno + ", reno=" + reno + ", rewriter=" + rewriter + ", rememo=" + rememo
				+ ", redate=" + redate + "]";
	}
}
