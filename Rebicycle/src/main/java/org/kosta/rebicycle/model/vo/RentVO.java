package org.kosta.rebicycle.model.vo;

public class RentVO {
	//빌리기 - bicycle.xml 에서 dual을 통해 받는 rentNo 전달을 위함
	private int rentNo;
	
	private BicycleVO bicycleVO;
	
	private MemberVO memberVO;
	private CalendarVO calendarVO;
	private int totalPrice;
	private int state;
	public RentVO() {
		super();
	}
	public RentVO(BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO, int totalPrice) {
		super();
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
		this.totalPrice = totalPrice;
	}
	
	//빌리기 에서 사용 
	public RentVO(BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO) {
		super();
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
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
	public int gettotalPrice() {
		return totalPrice;
	}
	public void settotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
	
	
	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	
	
	@Override
	public String toString() {
		return "RentVO [bicycleVO=" + bicycleVO + ", memberVO=" + memberVO + ", calendarVO=" + calendarVO
				+ ", totalPrice=" + totalPrice + ", state=" + state + "]";
	}

}
