package com.projcafe.cafe.board.repository;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.data.elasticsearch.annotations.Setting;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Document(indexName = "cafesearch")
@Setting(settingPath = "./static/es-settings.json")
public class ProjcafesearchkeywordVO {
	
	@Id
	@Field(type = FieldType.Keyword)
	private String id;
	
	@Field(type = FieldType.Keyword)
	private String SEARCHKEYWORD; // 카페 리스트 검색 기능 추가
	
	@Field(type= FieldType.Date)
	private String timestamp;
	
}
