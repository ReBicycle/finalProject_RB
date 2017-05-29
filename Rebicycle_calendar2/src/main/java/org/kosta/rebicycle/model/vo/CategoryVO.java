package org.kosta.rebicycle.model.vo;

public class CategoryVO {
	private int categoryNo;
	private String categoryName;
	

	public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CategoryVO(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	} 
	
	
}
