package org.kosta.rebicycle.model.vo;

public class ReviewVO {
	private RentVO rentVO;
	private int star;
	private String content;
	private String reviewDate;
	public ReviewVO() {
		super();
	}
	public ReviewVO(RentVO rentVO, int star, String content, String reviewDate) {
		super();
		this.rentVO = rentVO;
		this.star = star;
		this.content = content;
		this.reviewDate = reviewDate;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	@Override
	public String toString() {
		return "ReviewVO [rentVO=" + rentVO + ", star=" + star + ", content=" + content + ", reviewDate=" + reviewDate
				+ "]";
	}	
	
	
}
