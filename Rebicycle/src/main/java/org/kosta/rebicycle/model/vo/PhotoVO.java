package org.kosta.rebicycle.model.vo;

public class PhotoVO {
	private int bicycleNo;
	private String photo1;//db에 넣을 파일명
	private String photo2;
	private String photo3;
	public PhotoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PhotoVO(int bicycleNo, String photo1, String photo2, String photo3) {
		super();
		this.bicycleNo = bicycleNo;
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
		return "PhotoVO [bicycleNo=" + bicycleNo + ", photo1=" + photo1 + ", photo2=" + photo2 + ", photo3=" + photo3
				+ "]";
	}
	
	
}
