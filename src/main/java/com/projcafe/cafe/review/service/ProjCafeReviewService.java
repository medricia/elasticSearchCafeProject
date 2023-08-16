package com.projcafe.cafe.review.service;

import java.util.List;

import com.projcafe.cafe.review.repository.ProjCafeReviewVO;

public interface ProjCafeReviewService {

	void insertCafeReview(ProjCafeReviewVO cafe);

	List<ProjCafeReviewVO> getCafeReviewList(ProjCafeReviewVO cafe);

	public List<ProjCafeReviewVO> getCafeReviewImage(int cafe_Review_Number);
	
	ProjCafeReviewVO getCafeReview(int cafe_Review_Number);
	
	public List<ProjCafeReviewVO> getCafeReviewMemberList(String MEMBER_ID);
	
	void updateCafeReview(ProjCafeReviewVO cafe);

	void deleteCafeReview(int cafe_Review_Number);

	List<ProjCafeReviewVO> getCafeReviewCafeID(int CAFE_ID);

}