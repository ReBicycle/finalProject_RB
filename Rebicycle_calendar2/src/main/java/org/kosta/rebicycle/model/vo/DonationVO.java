package org.kosta.rebicycle.model.vo;

public class DonationVO {
	private MemberVO memberVO;
	private int donationBicycleNo;
	private String detail;
	private String photo;
	public DonationVO() {
		super();
	}
	public DonationVO(MemberVO memberVO, int donationBicycleNo, String detail, String photo) {
		super();
		this.memberVO = memberVO;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.photo = photo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "DonationVO [memberVO=" + memberVO + ", donationBicycleNo=" + donationBicycleNo + ", detail=" + detail
				+ ", photo=" + photo + "]";
	}
	
}
