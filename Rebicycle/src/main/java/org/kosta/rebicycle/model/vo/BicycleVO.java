package org.kosta.rebicycle.model.vo;

import java.util.List;

public class BicycleVO {
	private int bicycleNo;
	private MemberVO memberVO; //자전거 소유인
	private List<CalendarVO> possibleList; //대여가능일
	private int rentPrice; //일일렌트가격
	
	private String address; //자전거 위치 주소
	private String latitude; //자전거 위치 위도
	private String longitude; //자전거 위치 경도
	
	private int purPrice; //purchasePrice 구매가격
	private String category;
	private String detail;
	
	private String photo1;
	private String photo2;
	private String photo3;
	
	
	public BicycleVO() {
		super();
	}
	public BicycleVO(int bicycleNo, MemberVO memberVO, List<CalendarVO> possibleList, int rentPrice, String address,
			String latitude, String longitude, int purPrice, String category, String detail, String photo1,
			String photo2, String photo3) {
		super();
		this.bicycleNo = bicycleNo;
		this.memberVO = memberVO;
		this.possibleList = possibleList;
		this.rentPrice = rentPrice;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.purPrice = purPrice;
		this.category = category;
		this.detail = detail;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
	}
	public int getBicycleNo() {
		return bicycleNo;
	}
	public void setBicycleNo(int bicycleNo) {
		this.bicycleNo = bicycleNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public List<CalendarVO> getPossibleList() {
		return possibleList;
	}
	public void setPossibleList(List<CalendarVO> possibleList) {
		this.possibleList = possibleList;
	}
	public int getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public int getPurPrice() {
		return purPrice;
	}
	public void setPurPrice(int purPrice) {
		this.purPrice = purPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	@Override
	public String toString() {
		return "BicycleVO [bicycleNo=" + bicycleNo + ", memberVO=" + memberVO + ", possibleList=" + possibleList
				+ ", rentPrice=" + rentPrice + ", address=" + address + ", latitude=" + latitude + ", longitude="
				+ longitude + ", purPrice=" + purPrice + ", category=" + category + ", detail=" + detail + ", photo1="
				+ photo1 + ", photo2=" + photo2 + ", photo3=" + photo3 + "]";
	}
		
}
