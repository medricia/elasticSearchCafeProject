package com.projcafe.cafe.review.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjCafeReviewDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<ProjCafeReviewVO> cList(int cafe_Review_Number){
		return mybatis.selectList("ProjCafeReviewVO.cList",cafe_Review_Number);
	}
	
	//0504�닔�젙 異붽�
	public List<ProjCafeReviewVO> cafeIDList(int cafe_ID){
		return mybatis.selectList("CafeReviewDAO.getCafeReviewCAFEID",cafe_ID);
	}
	
	public void insertCafeReview(ProjCafeReviewVO cafe) {
		mybatis.insert("CafeReviewDAO.insertCafeReview", cafe);
	}
	
	public void insertCafeImage(ProjCafeReviewVO cafe) {
		mybatis.insert("CafeReviewDAO.insertReviewImage", cafe);
	}
	
	public List<ProjCafeReviewVO> getCafeReviewList(ProjCafeReviewVO cafe){
		return mybatis.selectList("CafeReviewDAO.getCafeReviewList",cafe);
		
	}
	public List<ProjCafeReviewVO> getCafeReviewCafeIDList(int CAFE_ID){
		return mybatis.selectList("CafeReviewDAO.getCafeReviewCAFEID",CAFE_ID);
	}
	
	
	public List<ProjCafeReviewVO> getCafeReviewMemberList(String MEMBER_ID){
		return mybatis.selectList("CafeReviewDAO.getCafeReviewMemberID",MEMBER_ID);
		
	}
	
	public List<ProjCafeReviewVO> getCafeImage(int cafe_Review_Number){
		return mybatis.selectList("CafeReviewDAO.getCafeImage",cafe_Review_Number);
	}
	
	public ProjCafeReviewVO getCafeReview(int cafe_Review_Number) {
		return mybatis.selectOne("CafeReviewDAO.getCafeReview",cafe_Review_Number);
	}
	
	public void updateCafeReview(ProjCafeReviewVO cafe) {
		mybatis.update("CafeReviewDAO.UpdateReviewTitle",cafe);
	}
	
	public void updateCafeImage(ProjCafeReviewVO cafe) {
		mybatis.update("CafeReviewDAO.UpdateReviewImage",cafe);
	}
	
	public void updateCafeNonImage(int getCafe_Review_Number) {
		mybatis.update("CafeReviewDAO.UpdateReviewImageD", getCafe_Review_Number);
		
	}
	
	
	public void deleteReviewImage(int cafe_Review_Number) {
		mybatis.delete("CafeReviewDAO.deleteCafeImage", cafe_Review_Number);
	}
	public void deleteCafeReview(int cafe_Review_Number) {
		mybatis.delete("CafeReviewDAO.deleteCafeReview",cafe_Review_Number);
	}

}
