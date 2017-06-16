package org.kosta.rebicycle.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DonationVO {
	private String donorId;
	private String donorPhoto;
	private int donationBicycleNo;
	private String detail;
	private PhotoVO photoVO;
	private String address;
	private String storyId;
	private String title;
	private List<MultipartFile> file;
	private List<StoryVO> storyList;
	public DonationVO() {
		super();
	}

	public DonationVO(String donorId, int donationBicycleNo, String detail, PhotoVO photoVO, String address,
			String storyId, String title, List<MultipartFile> file) {
		super();
		this.donorId = donorId;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.photoVO = photoVO;
		this.address = address;
		this.storyId = storyId;
		this.title = title;
		this.file = file;
	}
	
	public DonationVO(String donorId, String donorPhoto, int donationBicycleNo, String detail, PhotoVO photoVO,
			String address, String storyId, String title, List<MultipartFile> file) {
		super();
		this.donorId = donorId;
		this.donorPhoto = donorPhoto;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.photoVO = photoVO;
		this.address = address;
		this.storyId = storyId;
		this.title = title;
		this.file = file;
	}

	public DonationVO(String donorId, String donorPhoto, int donationBicycleNo, String detail, PhotoVO photoVO,
			String address, String storyId, String title, List<MultipartFile> file, List<StoryVO> storyList) {
		super();
		this.donorId = donorId;
		this.donorPhoto = donorPhoto;
		this.donationBicycleNo = donationBicycleNo;
		this.detail = detail;
		this.photoVO = photoVO;
		this.address = address;
		this.storyId = storyId;
		this.title = title;
		this.file = file;
		this.storyList = storyList;
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
	public String getStoryId() {
		return storyId;
	}
	public void setStoryId(String storyId) {
		this.storyId = storyId;
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

	public String getDonorPhoto() {
		return donorPhoto;
	}

	public void setDonorPhoto(String donorPhoto) {
		this.donorPhoto = donorPhoto;
	}
	
	public List<StoryVO> getStoryList() {
		return storyList;
	}

	public void setStoryList(List<StoryVO> storyList) {
		this.storyList = storyList;
	}

	@Override
	public String toString() {
		return "DonationVO [donorId=" + donorId + ", donorPhoto=" + donorPhoto + ", donationBicycleNo="
				+ donationBicycleNo + ", detail=" + detail + ", photoVO=" + photoVO + ", address=" + address
				+ ", storyId=" + storyId + ", title=" + title + ", file=" + file + ", storyList=" + storyList + "]";
	}



	
}
