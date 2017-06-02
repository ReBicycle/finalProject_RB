package org.kosta.rebicycle.model.vo;

public class RentVO {
	private BicycleVO bicycleVO;
	private MemberVO memberVO;
	private CalendarVO calendarVO;
	private int rentNo;
	private int totalPrice;
	private int state;
	public RentVO() {
		super();
	}
	public RentVO(BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO, int rentNo, int totalPrice,
			int state) {
		super();
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
		this.rentNo = rentNo;
		this.totalPrice = totalPrice;
		this.state = state;
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
	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "RentVO [bicycleVO=" + bicycleVO + ", memberVO=" + memberVO + ", calendarVO=" + calendarVO + ", rentNo="
				+ rentNo + ", totalPrice=" + totalPrice + ", state=" + state + "]";
	}
	
}
