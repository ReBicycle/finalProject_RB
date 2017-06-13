package org.kosta.rebicycle.model.vo;

import java.util.List;

public class ListVO {
	private List<ReportVO> list;
	private List<DonationVO> donationList;
	private PagingBean pagingBean;
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListVO(List<ReportVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	
	public ListVO(PagingBean pagingBean,List<DonationVO> donationList) {
		super();
		this.donationList = donationList;
		this.pagingBean = pagingBean;
	}
	public List<ReportVO> getList() {
		return list;
	}
	public void setList(List<ReportVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	public List<DonationVO> getdonationList() {
		return donationList;
	}
	public void setdonationList(List<DonationVO> donationList) {
		this.donationList = donationList;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", donationList=" + donationList + ", pagingBean=" + pagingBean + "]";
	}
	
}
