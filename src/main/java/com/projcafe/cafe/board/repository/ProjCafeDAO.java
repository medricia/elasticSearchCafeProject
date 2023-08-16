package com.projcafe.cafe.board.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjCafeDAO{

	@Autowired
	SqlSessionTemplate mybatis;
	
	//카페 등록
	public void insertCafe(ProjCafeVO cafe) {
		mybatis.insert("CafeDAO.insertCafe",cafe);
	};
	
	//카페 리스트 조회
	public List<ProjCafeVO> getCafeList(ProjCafeVO cafe){
			return mybatis.selectList("CafeDAO.getCafeList", cafe);
	}
	
	public List<ProjCafeVO> CafeList(Map<String, Object> map){
		//System.out.println("전달 벨류: " + map.values());
		//System.out.println("전달 키: " + map.keySet());
		
		return mybatis.selectList("CafeDAO.thisisCafeList", map);
	}

	//카페 리스트 수 계산
	public int getCafeListCount(ProjCafeVO vo) {
	    return mybatis.selectOne("CafeDAO.thisisCafeListCount", vo);
	}
	
	//카페 상세조회
	public ProjCafeVO getCafe(int cafe_ID) {
		return mybatis.selectOne("CafeDAO.getCafe", cafe_ID);
	}
	
	//카페 수정
	public void updateCafe(ProjCafeVO cafe) {
		mybatis.update("CafeDAO.updateCafe", cafe);	
	}
	
	//카페 북마크 삭제
	//public void deleteCafeBookmark(Map<String, Object> map) {
		//mybatis.delete("CafeDAO.deleteBookmark", map);
	//}
	
	//카페 삭제
	public void deleteCafeTable(int CAFE_ID) {
		mybatis.delete("CafeDAO.deleteBookmark", CAFE_ID);
		mybatis.delete("CafeDAO.deleteCafeMenu", CAFE_ID);
		mybatis.delete("CafeDAO.deleteCafeRImage", CAFE_ID);
		mybatis.delete("CafeDAO.deleteCafeReview", CAFE_ID);
		
		
	}
	
	public void deleteCafe(int CAFE_ID) {
		mybatis.delete("CafeDAO.deleteCafe", CAFE_ID);
	}

	
}
