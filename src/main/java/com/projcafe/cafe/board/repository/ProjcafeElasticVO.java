package com.projcafe.cafe.board.repository;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.data.elasticsearch.annotations.Setting;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(indexName = "projcafe15")
@Setting(settingPath = "./static/es-settings.json")
public class ProjcafeElasticVO {
	
	@Id
	private String _ID;
	
	@Field(type = FieldType.Long)
	@JsonProperty("cafe_id")
	private int cafe_id;
	
	@Field(type = FieldType.Text)
	@JsonProperty("cafe_name")
	private String cafe_name;

	@Field(type = FieldType.Text)
	@JsonProperty("cafe_location")
	private String cafe_location;
	@Field(type = FieldType.Text)
	@JsonProperty("cafe_operatetime")
	private String cafe_operatetime;
	@Field(type = FieldType.Text)
	@JsonProperty("cafe_phonenumber")
	private String cafe_phonenumber;
	@Field(type = FieldType.Text)
	@JsonProperty("cafe_sns")
	private String cafe_sns;
	@Field(type = FieldType.Text)
	@JsonProperty("cafe_introduction")
	private String cafe_introduction;
	@Field(type = FieldType.Keyword)
	@JsonProperty("cafe_image")
	private String cafe_image;
	@Field(type = FieldType.Text)
	@JsonProperty("giftycorn_cln")
	private String giftycorn_cln;
	
	private MultipartFile UPLOADIMAGE;
	@Field(type = FieldType.Double)
	@JsonProperty("cafe_lat")
	private double cafe_lat;
	@Field(type = FieldType.Double)
	@JsonProperty("cafe_long")
	private double cafe_long;
	@Field(type = FieldType.Text)
	private String SEARCHCONDITION; // 카페 리스트 검색 기능 추가
	@Field(type = FieldType.Text)
	private String SEARCHKEYWORD; // 카페 리스트 검색 기능 추가
	
	private int STARTPAGE; //페이징
	private int ENDPAGE; //페이징
	private int MAXPAGE; //페이징
	
	
	
}


