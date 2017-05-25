package org.kosta.rebicycle.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private List<MultipartFile> file;

	
	
	public BicycleVO() {
		super();
	}
	
	
	public BicycleVO(int bicycleNo, MemberVO memberVO, List<CalendarVO> possibleList, int rentPrice, String address,
			String latitude, String longitude, int purPrice, String category, String detail, List<MultipartFile> file) {
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
		this.file = file;
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


	public List<MultipartFile> getFile() {
		return file;
	}


	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}


	@Override
	public String toString() {
		return "BicycleVO [bicycleNo=" + bicycleNo + ", memberVO=" + memberVO + ", possibleList=" + possibleList
				+ ", rentPrice=" + rentPrice + ", address=" + address + ", latitude=" + latitude + ", longitude="
				+ longitude + ", purPrice=" + purPrice + ", category=" + category + ", detail=" + detail + ", file="
				+ file + "]";
	}
	
		
}
