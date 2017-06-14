package org.kosta.rebicycle.model.vo;

public class HeartVO {
	private String id;
	private int bicycleNo;
	public HeartVO() {
		super();
	}
	public HeartVO(String id, int bicycleNo) {
		super();
		this.id = id;
		this.bicycleNo = bicycleNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBicycleNo() {
		return bicycleNo;
	}
	public void setBicycleNo(int bicycleNo) {
		this.bicycleNo = bicycleNo;
	}
	@Override
	public String toString() {
		return "HeartVO [id=" + id + ", bicycleNo=" + bicycleNo + "]";
	}
	
}
