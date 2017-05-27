package org.kosta.rebicycle.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BicycleVO {
	private int bicycleNo;
	/*private String memberId;*/
	private MemberVO memberVO; //자전거 소유인
	private List<CalendarVO> possibleList; //대여가능일
	
	private int purchasePrice; //purchasePrice 구매가격
	
	private int rentPrice; //일일렌트가격
	private String detail;//상세정보
	private String address; //자전거 위치 주소
	
	private MapVO mapVO;
	/*//위치VO?
	private String latitude; //자전거 위치 위도
	private String longitude; //자전거 위치 경도
	*/
	
	private List<MultipartFile> file;//걍 파일
	
	private PhotoVO photoVO;
	/*
	private String photo1;//db에 넣을 파일명
	private String photo2;
	private String photo3;
	*/
	private CategoryVO categoryVO;
	/*
	//categoryVO
	private int categoryNo;
	pirvate String categoryName;

	*/
	
	public BicycleVO() {
		super();
	}

	
	
	
		
}
