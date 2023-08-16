package com.projcafe.cafe.board.repository;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.data.elasticsearch.annotations.Setting;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(indexName = "cafeinfo")
@Setting(settingPath = "./static/es-settings.json")
public class ProjCafeVO {
	
	@Id
	private String _ID;
	
	@Field(type = FieldType.Long)
	private int CAFE_ID;
	
	@Field(type = FieldType.Text)
	private String CAFE_NAME;

	@Field(type = FieldType.Text)
	private String CAFE_LOCATION;
	@Field(type = FieldType.Text)
	private String CAFE_OPERATETIME;
	@Field(type = FieldType.Text)
	private String CAFE_PHONENUMBER;
	@Field(type = FieldType.Text)
	private String CAFE_SNS;
	@Field(type = FieldType.Text)
	private String CAFE_INTRODUCTION;
	@Field(type = FieldType.Keyword)
	private String CAFE_IMAGE;
	@Field(type = FieldType.Text)
	private String GIFTYCORN_CLN;
	@Field(type = FieldType.Keyword)
	private MultipartFile UPLOADIMAGE;
	@Field(type = FieldType.Double)
	private String CAFE_LAT;
	@Field(type = FieldType.Double)
	private String CAFE_LONG;
	@Field(type = FieldType.Text)
	private String SEARCHCONDITION; // 카페 리스트 검색 기능 추가
	@Field(type = FieldType.Text)
	private String SEARCHKEYWORD; // 카페 리스트 검색 기능 추가
	private int STARTPAGE; //페이징
	private int ENDPAGE; //페이징
	private int MAXPAGE; //페이징
	
	
	
}
