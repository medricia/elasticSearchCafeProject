package com.projcafe.cafe.review.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProjCafeReviewVO {
	
	private int cafe_Review_Number;
	private int cafe_ID	;
	private String MEMBER_ID;
	private String cafe_Review_Title;
	private String cafe_Review_Content;
	private List<String> REVIEW_IMAGE_LIST;
	private String REVIEW_IMAGE;
	private List<MultipartFile> UPLOADIMAGE;
	
	
	public int getCafe_Review_Number() {
		return cafe_Review_Number;
	}
	public void setCafe_Review_Number(int cafe_Review_Number) {
		this.cafe_Review_Number = cafe_Review_Number;
	}
	public int getCafe_ID() {
		return cafe_ID;
	}
	public void setCafe_ID(int cafe_ID) {
		this.cafe_ID = cafe_ID;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getCafe_Review_Title() {
		return cafe_Review_Title;
	}
	public void setCafe_Review_Title(String cafe_Review_Title) {
		this.cafe_Review_Title = cafe_Review_Title;
	}
	public String getCafe_Review_Content() {
		return cafe_Review_Content;
	}
	public void setCafe_Review_Content(String cafe_Review_Content) {
		this.cafe_Review_Content = cafe_Review_Content;
	}
	public List<MultipartFile> getUPLOADIMAGE() {
		return UPLOADIMAGE;
	}
	public void setUPLOADIMAGE(List<MultipartFile> uPLOADIMAGE) {
		UPLOADIMAGE = uPLOADIMAGE;
	}
	public List<String> getREVIEW_IMAGE_LIST() {
		return REVIEW_IMAGE_LIST;
	}
	public void setREVIEW_IMAGE_LIST(List<String> rEVIEW_IMAGE_LIST) {
		REVIEW_IMAGE_LIST = rEVIEW_IMAGE_LIST;
	}
	public String getREVIEW_IMAGE() {
		return REVIEW_IMAGE;
	}
	public void setREVIEW_IMAGE(String rEVIEW_IMAGE) {
		REVIEW_IMAGE = rEVIEW_IMAGE;
	}
	

}
