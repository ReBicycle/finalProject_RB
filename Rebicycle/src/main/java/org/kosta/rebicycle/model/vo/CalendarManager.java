package org.kosta.rebicycle.model.vo;

public class CalendarManager {
	
	private CalendarBean current;
	
	int lastDayOfMonth[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	private CalendarManager() {
		super();
		current = new CalendarBean();
	}
	
	
	public CalendarBean getCurrent() {
		return current;
	}

	public void setCurrent(int year, int month) {
		boolean isLeapYear = ((year%4)==0)&&((year%100)!=0)||((year%400)==0);
		int allDayFrom0Year = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
		
		for(int i = 1; i<month; i++){
			allDayFrom0Year += lastDayOfMonth[i];
		}

		if(isLeapYear && month>2) this.current.setFirstDayOfMonth((allDayFrom0Year + 1)%7);
		else this.current.setFirstDayOfMonth(allDayFrom0Year%7);
		
		if(isLeapYear && month==2) this.current.setLastDayOfMonth(lastDayOfMonth[month]+1);
		else this.current.setLastDayOfMonth(lastDayOfMonth[month]);
		
		this.current.setMonth(month);
	}
	
	public static void main(String[] args) {
		
	}
	
	
	
}
