package org.kosta.rebicycle.model.vo;

public class CalendarVO {
	private int bicycleNo;
	private String startDay;
	private String endDay;

	public CalendarVO() {
		super();
	}

	public CalendarVO(int bicycleNo, String startDay, String endDay) {
		super();
		this.bicycleNo = bicycleNo;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public int getBicycleNo() {
		return bicycleNo;
	}

	public void setBicycleNo(int bicycleNo) {
		this.bicycleNo = bicycleNo;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	@Override
	public String toString() {
		return "CalendarVO [bicycleNo=" + bicycleNo + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}

}
