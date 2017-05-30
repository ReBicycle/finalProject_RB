package org.kosta.rebicycle.model.vo;

import java.util.ArrayList;

public class CalendarBean {
   private int month;
   private int lastDayOfMonth;
   private int firstDayOfMonth;
   private ArrayList<CalendarVO> listOnMonth;
   @Override
public String toString() {
	return "CalendarBean [month=" + month + ", lastDayOfMonth=" + lastDayOfMonth + ", firstDayOfMonth="
			+ firstDayOfMonth + ", listOnMonth=" + listOnMonth + ", ryb=" + ryb + "]";
}
public String getRyb() {
	return ryb;
}
public void setRyb(String ryb) {
	this.ryb = ryb;
}
private String ryb;
  
	public CalendarBean() {
      super();
   }
   public CalendarBean(int month, int lastDayOfMonth, int firstDayOfMonth) {
      super();
      this.month = month;
      this.lastDayOfMonth = lastDayOfMonth;
      this.firstDayOfMonth = firstDayOfMonth;
   }
   public ArrayList<CalendarVO> getListOnMonth() {
      return listOnMonth;
   }
   public void setListOnMonth(ArrayList<CalendarVO> listOnMonth) {
      this.listOnMonth = listOnMonth;
   }
   public int getMonth() {
      return month;
   }
   public void setMonth(int month) {
      this.month = month;
   }
   public int getLastDayOfMonth() {
      return lastDayOfMonth;
   }
   public void setLastDayOfMonth(int lastDayOfMonth) {
      this.lastDayOfMonth = lastDayOfMonth;
   }
   public int getFirstDayOfMonth() {
      return this.firstDayOfMonth;
   }
   public void setFirstDayOfMonth(int firstDayOfMonth) {
      this.firstDayOfMonth = firstDayOfMonth;
   }

  
   
   
}