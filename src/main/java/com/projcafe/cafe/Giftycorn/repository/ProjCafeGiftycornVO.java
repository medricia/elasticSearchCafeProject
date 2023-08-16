package com.projcafe.cafe.Giftycorn.repository;

import org.springframework.web.multipart.MultipartFile;

public class ProjCafeGiftycornVO {
	private String MEMBER_ID;
	private int GIFTYCORN_ID;
	private int GIFTYCORN_CLN;
	private String GIFTYCORN_IMAGE_LOCATION;
	private String GIFTYCORN_START_DATE;
	private String GIFTYCORN_LIMIT_DATE;
	private String GIFTYCORN_MEMO;
	private MultipartFile UPLOADIMAGE;
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getGIFTYCORN_ID() {
		return GIFTYCORN_ID;
	}
	public void setGIFTYCORN_ID(int gIFTYCORN_ID) {
		GIFTYCORN_ID = gIFTYCORN_ID;
	}
	public int getGIFTYCORN_CLN() {
		return GIFTYCORN_CLN;
	}
	public void setGIFTYCORN_CLN(int gIFTYCORN_CLN) {
		GIFTYCORN_CLN = gIFTYCORN_CLN;
	}
	public String getGIFTYCORN_IMAGE_LOCATION() {
		return GIFTYCORN_IMAGE_LOCATION;
	}
	public void setGIFTYCORN_IMAGE_LOCATION(String gIFTYCORN_IMAGE_LOCATION) {
		GIFTYCORN_IMAGE_LOCATION = gIFTYCORN_IMAGE_LOCATION;
	}
	public String getGIFTYCORN_START_DATE() {
		return GIFTYCORN_START_DATE;
	}
	public void setGIFTYCORN_START_DATE(String gIFTYCORN_START_DATE) {
		GIFTYCORN_START_DATE = gIFTYCORN_START_DATE;
	}
	public String getGIFTYCORN_LIMIT_DATE() {
		return GIFTYCORN_LIMIT_DATE;
	}
	public void setGIFTYCORN_LIMIT_DATE(String gIFTYCORN_LIMIT_DATE) {
		GIFTYCORN_LIMIT_DATE = gIFTYCORN_LIMIT_DATE;
	}
	public String getGIFTYCORN_MEMO() {
		return GIFTYCORN_MEMO;
	}
	public void setGIFTYCORN_MEMO(String gIFTYCORN_MEMO) {
		GIFTYCORN_MEMO = gIFTYCORN_MEMO;
	}
	public MultipartFile getUPLOADIMAGE() {
		return UPLOADIMAGE;
	}
	public void setUPLOADIMAGE(MultipartFile uPLOADIMAGE) {
		UPLOADIMAGE = uPLOADIMAGE;
	}
	
	

}
