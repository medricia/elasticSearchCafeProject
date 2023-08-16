package com.projcafe.cafe.Anno;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AnnoVO {
	private int ANNO_ID;
	private String ANNO_TITLE;
	private Date ANNO_DATE;
	private String ANNO_CONTEXT;
	private String ANNO_IMAGE;
	private MultipartFile UPLOADIMAGE;
	private int STARTPAGE;
	private int ENDPAGE;
	
	public int getANNO_ID() {
		return ANNO_ID;
	}
	public void setANNO_ID(int aNNO_ID) {
		ANNO_ID = aNNO_ID;
	}
	public String getANNO_TITLE() {
		return ANNO_TITLE;
	}
	public void setANNO_TITLE(String aNNO_TITLE) {
		ANNO_TITLE = aNNO_TITLE;
	}
	public Date getANNO_DATE() {
		return ANNO_DATE;
	}
	public void setANNO_DATE(Date aNNO_DATE) {
		ANNO_DATE = aNNO_DATE;
	}
	public String getANNO_CONTEXT() {
		return ANNO_CONTEXT;
	}
	public void setANNO_CONTEXT(String aNNO_CONTEXT) {
		ANNO_CONTEXT = aNNO_CONTEXT;
	}
	public String getANNO_IMAGE() {
		return ANNO_IMAGE;
	}
	public void setANNO_IMAGE(String aNNO_IMAGE) {
		ANNO_IMAGE = aNNO_IMAGE;
	}
	public MultipartFile getUPLOADIMAGE() {
		return UPLOADIMAGE;
	}
	public void setUPLOADIMAGE(MultipartFile uPLOADIMAGE) {
		UPLOADIMAGE = uPLOADIMAGE;
	}
	public int getSTARTPAGE() {
		return STARTPAGE;
	}
	public void setSTARTPAGE(int sTARTPAGE) {
		STARTPAGE = sTARTPAGE;
	}
	public int getENDPAGE() {
		return ENDPAGE;
	}
	public void setENDPAGE(int eNDPAGE) {
		ENDPAGE = eNDPAGE;
	}
	
	
	
}
