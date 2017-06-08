package org.kosta.rebicycle.model.vo;

public class RentVO {
	//빌리기 - bicycle.xml 에서 dual을 통해 받는 rentNo 전달을 위함
	private int rentNo;
	private BicycleVO bicycleVO;
	private MemberVO memberVO;
	private CalendarVO calendarVO;
	private int state;
	public RentVO() {
		super();
	}
	
	
	public RentVO(int rentNo) {
		super();
		this.rentNo = rentNo;
	}


	public RentVO(int rentNo, BicycleVO bicycleVO, MemberVO memberVO) {
		super();
		this.rentNo = rentNo;
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
	}	

	public RentVO(int rentNo, MemberVO memberVO) {
		super();
		this.rentNo = rentNo;
		this.memberVO = memberVO;
	}
	
	public RentVO(MemberVO memberVO) {
		super();
		this.memberVO = memberVO;
	}

	public RentVO(int rentNo, BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO, int state) {
		super();
		this.rentNo = rentNo;
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
		this.state = state;
	}



	//빌리기 에서 사용 
	public RentVO(BicycleVO bicycleVO, MemberVO memberVO, CalendarVO calendarVO) {
		super();
		this.bicycleVO = bicycleVO;
		this.memberVO = memberVO;
		this.calendarVO = calendarVO;
	}



	public int getRentNo() {
		return rentNo;
	}



	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
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



	public int getState() {
		return state;
	}



	public void setState(int state) {
		this.state = state;
	}



	@Override
	public String toString() {
		return "RentVO [rentNo=" + rentNo + ", bicycleVO=" + bicycleVO + ", memberVO=" + memberVO + ", calendarVO="
				+ calendarVO + ", state=" + state + "]";
	}
}