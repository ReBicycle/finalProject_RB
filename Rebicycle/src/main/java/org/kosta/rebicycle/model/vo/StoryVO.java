package org.kosta.rebicycle.model.vo;

public class StoryVO {
	private int donationBicycleNo;
	private String title;
	private String id;
	private String detail;
	private String photo;
	public StoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StoryVO(int donationBicycleNo, String title, String id, String detail, String photo) {
		super();
		this.donationBicycleNo = donationBicycleNo;
		this.title = title;
		this.id = id;
		this.detail = detail;
		this.photo = photo;
	}
	public int getDonationBicycleNo() {
		return donationBicycleNo;
	}
	public void setDonationBicycleNo(int donationBicycleNo) {
		this.donationBicycleNo = donationBicycleNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "StoryVO [donationBicycleNo=" + donationBicycleNo + ", title=" + title + ", id=" + id + ", detail="
				+ detail + ", photo=" + photo + "]";
	}

	

}
