package org.kosta.rebicycle.model.vo;

public class BoardReplyVO {
	private int brdno;
	private int reno;
	private String retitle;
	private String rewriter;
	private String rememo;
	private String redate;
	public BoardReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardReplyVO(int brdno, int reno, String retitle, String rewriter, String rememo, String redate) {
		super();
		this.brdno = brdno;
		this.reno = reno;
		this.retitle = retitle;
		this.rewriter = rewriter;
		this.rememo = rememo;
		this.redate = redate;
	}
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
	public String getRetitle() {
		return retitle;
	}
	public void setRetitle(String retitle) {
		this.retitle = retitle;
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
	public String toString() {
		return "BoardReplyVO [brdno=" + brdno + ", reno=" + reno + ", retitle=" + retitle + ", rewriter=" + rewriter
				+ ", rememo=" + rememo + ", redate=" + redate + "]";
	}
}
