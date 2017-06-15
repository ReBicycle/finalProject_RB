package org.kosta.rebicycle.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DonationVO {
	private String donorId;
	private int donationBicycleNo;
	private String detail;
	private PhotoVO photoVO;
	private String address;
	private String status;
	private String title;
	private List<MultipartFile> file;
	public DonationVO() {
		super();
	}

	public DonationVO(String donorId, int donationBicycleNo, String detail, PhotoVO photoVO, String address,
			String status, String title, List<MultipartFile> file) {
		super();
		this.donorId = donorId;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.photoVO = photoVO;
		this.address = address;
		this.status = status;
		this.title = title;
		this.file = file;
	}

	public String getDonorId() {
		return donorId;
	}
	public void setDonorId(String donorId) {
		this.donorId = donorId;
	}
	public int getDonationBicycleNo() {
		return donationBicycleNo;
	}
	public void setDonationBicycleNo(int donationBicycleNo) {
		this.donationBicycleNo = donationBicycleNo;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public PhotoVO getPhotoVO() {
		return photoVO;
	}
	public void setPhotoVO(PhotoVO photoVO) {
		this.photoVO = photoVO;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "DonationVO [donorId=" + donorId + ", donationBicycleNo=" + donationBicycleNo + ", detail=" + detail
				+ ", photoVO=" + photoVO + ", address=" + address + ", status=" + status + ", title=" + title
				+ ", file=" + file + "]";
	}






	
}
