package org.kosta.rebicycle.model.vo;

public class DonationVO {
	private String id;
	private int donationBicycleNo;
	private String detail;
	private String picture;
	private String address;
	private String status;
	private String title;
	public DonationVO() {
		super();
	}
	
	public DonationVO(String id, int donationBicycleNo, String detail, String picture, String address, String status,
			String title) {
		super();
		this.id = id;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.picture = picture;
		this.address = address;
		this.status = status;
		this.title = title;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDonationBicycleNo() {
		return donationBicycleNo;
	}
	public void setDonationBicycleNo(int donationBicycleNo) {
		this.donationBicycleNo = donationBicycleNo;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "DonationVO [id=" + id + ", donationBicycleNo=" + donationBicycleNo + ", detail=" + detail + ", picture="
				+ picture + ", address=" + address + ", status=" + status + ", title=" + title + "]";
	}

	



	
}
