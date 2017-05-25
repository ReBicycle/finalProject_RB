package org.kosta.rebicycle.model.vo;

public class CalendarVO {
	private String startDay;
	private String endDay;
	
	public CalendarVO() {
		super();
	}
	public CalendarVO(String startDay, String endDay) {
		super();
		this.startDay = startDay;
		this.endDay = endDay;
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
		return "CalendarVO [startDay=" + startDay + ", endDay=" + endDay + "]";
	}
	
}
