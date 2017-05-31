package org.kosta.rebicycle.model.vo;

public class MapVO {
	private int bicycleNo;
	private String latitude; // 자전거 위치 위도
	private String longitude; // 자전거 위치 경도

	public MapVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapVO(String latitude, String longitude) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public MapVO(int bicycleNo, String latitude, String longitude) {
		super();
		this.bicycleNo = bicycleNo;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public int getBicycleNo() {
		return bicycleNo;
	}

	public void setBicycleNo(int bicycleNo) {
		this.bicycleNo = bicycleNo;
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

	@Override
	public String toString() {
		return "MapVO [bicycleNo=" + bicycleNo + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

}
