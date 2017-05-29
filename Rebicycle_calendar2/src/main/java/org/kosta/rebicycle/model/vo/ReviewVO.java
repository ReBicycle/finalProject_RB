package org.kosta.rebicycle.model.vo;

public class ReviewVO {
	private int bicycleNo;
	private RentVO rentVO;
	private int star;
	private String comment;
	public ReviewVO() {
		super();
	}	
	public ReviewVO(int bicycleNo, RentVO rentVO, int star, String comment) {
		super();
		this.bicycleNo = bicycleNo;
		this.rentVO = rentVO;
		this.star = star;
		this.comment = comment;
	}

	public RentVO getRentVO() {
		return rentVO;
	}
	public void setRentVO(RentVO rentVO) {
		this.rentVO = rentVO;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getBicycleNo() {
		return bicycleNo;
	}
	public void setBicycleNo(int bicycleNo) {
		this.bicycleNo = bicycleNo;
	}
	@Override
	public String toString() {
		return "ReviewVO [bicycleNo=" + bicycleNo + ", rentVO=" + rentVO + ", star=" + star + ", comment=" + comment
				+ "]";
	}
	
	
}
