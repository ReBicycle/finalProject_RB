package org.kosta.rebicycle.model.vo;

public class RentVO {
	private BicycleVO bicycleVO;
	private MemberVO memberVO;
	private CalendarVO calendarVO;
	private int totalRentPrice;
	public RentVO() {
		super();
	}
	public RentVO(BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO, int totalRentPrice) {
		super();
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
		this.totalRentPrice = totalRentPrice;
	}
	public BicycleVO getBicycleVO() {
		return bicycleVO;
	}
	public void setBicycleVO(BicycleVO bicycleVO) {
		this.bicycleVO = bicycleVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CalendarVO getCalendarVO() {
		return calendarVO;
	}
	public void setCalendarVO(CalendarVO calendarVO) {
		this.calendarVO = calendarVO;
	}
	public int getTotalRentPrice() {
		return totalRentPrice;
	}
	public void setTotalRentPrice(int totalRentPrice) {
		this.totalRentPrice = totalRentPrice;
	}
	@Override
	public String toString() {
		return "RentVO [bicycleVO=" + bicycleVO + ", memberVO=" + memberVO + ", calendarVO=" + calendarVO
				+ ", totalRentPrice=" + totalRentPrice + "]";
	}
	
}
