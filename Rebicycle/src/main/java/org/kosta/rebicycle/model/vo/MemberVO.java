package org.kosta.rebicycle.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String tel;
	private String address;
	private String email;
	private String photo;
	
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String name, String tel, String address, String email, String photo) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.address = address;
		this.email = email;
		this.photo = photo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel + ", address="
				+ address + ", email=" + email + ", photo=" + photo + "]";
	}
	
	
}
