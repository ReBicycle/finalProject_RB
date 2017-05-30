package org.kosta.rebicycle.model.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BicycleVO {
	private int bicycleNo;
	/*private String memberId;*/
	private MemberVO memberVO; //자전거 소유인
	private ArrayList<CalendarVO> possibleList; //대여가능일
	
	private int purchasePrice; //purchasePrice 구매가격
	
	private int rentPrice; //일일렌트가격
	private String detail;//상세정보
	private String address; //자전거 위치 주소
	
	
	/*//위치VO?
	private String latitude; //자전거 위치 위도
	private String longitude; //자전거 위치 경도
	*/
	
	private List<MultipartFile> file;//걍 파일
	
	private PhotoVO photoVO;
	/*
	private String photo1;//db에 넣을 파일명
	private String photo2;
	private String photo3;
	*/
	private CategoryVO categoryVO;
	
	/*
	//categoryVO
	private int categoryNo;
	pirvate String categoryName;

	*/
	
	public BicycleVO() {
		super();
	}

	public int getBicycleNo() {
		return bicycleNo;
	}
	
	
	
	public ArrayList<CalendarVO> getPossibleList() {
		return possibleList;
	}

	public void setPossibleList(ArrayList<CalendarVO> possibleList) {
		this.possibleList = possibleList;
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

	
	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public int getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	public PhotoVO getPhotoVO() {
		return photoVO;
	}

	public void setPhotoVO(PhotoVO photoVO) {
		this.photoVO = photoVO;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	@Override
	public String toString() {
		return "BicycleVO [bicycleNo=" + bicycleNo + ", memberVO=" + memberVO + ", possibleList=" + possibleList
				+ ", purchasePrice=" + purchasePrice + ", rentPrice=" + rentPrice + ", detail=" + detail + ", address="
				+ address + ", file=" + file + ", photoVO=" + photoVO + ", categoryVO="
				+ categoryVO + "]";
	}
	
	
	
	
		
}
