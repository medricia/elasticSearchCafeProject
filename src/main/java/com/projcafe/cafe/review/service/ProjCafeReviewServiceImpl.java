package com.projcafe.cafe.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.review.repository.ProjCafeReviewDAO;
import com.projcafe.cafe.review.repository.ProjCafeReviewVO;

@Service("reviewService")
public class ProjCafeReviewServiceImpl implements ProjCafeReviewService{

	@Autowired
	ProjCafeReviewDAO projCafeReview;
	
	@Override
	public void insertCafeReview(ProjCafeReviewVO cafe) {
		projCafeReview.insertCafeReview(cafe);
		
		List<String> ImageList = cafe.getREVIEW_IMAGE_LIST();
        try {
        	for(String image : ImageList) {
        		ProjCafeReviewVO imagelist = new ProjCafeReviewVO();
        		imagelist.setREVIEW_IMAGE(image);
	        	projCafeReview.insertCafeImage(imagelist);
	        }
		} catch (Exception e) {
			e.getMessage();
		}
        
	}

	@Override
	public List<ProjCafeReviewVO> getCafeReviewList(ProjCafeReviewVO cafe) {
		return projCafeReview.getCafeReviewList(cafe);
	}
	@Override
	public List<ProjCafeReviewVO> getCafeReviewCafeID(int CAFE_ID) {
		return projCafeReview.getCafeReviewCafeIDList(CAFE_ID);
	}
	
	@Override
	public List<ProjCafeReviewVO> getCafeReviewMemberList(String MEMBER_ID) {
		return projCafeReview.getCafeReviewMemberList(MEMBER_ID);
	}
	
	@Override
	public ProjCafeReviewVO getCafeReview(int cafe_Review_Number) {
		return projCafeReview.getCafeReview(cafe_Review_Number);
	}
	
	public List<ProjCafeReviewVO> getCafeReviewImage(int cafe_Review_Number){
		return projCafeReview.getCafeImage(cafe_Review_Number);
	}

	@Override
	public void updateCafeReview(ProjCafeReviewVO cafe) {
		List<String> ImageList = cafe.getREVIEW_IMAGE_LIST();
		System.out.println("카페 이미지 단일 태그: "+cafe.getREVIEW_IMAGE_LIST());
		System.out.println("카페 이미지 리스트: " + ImageList);
		if(ImageList != null) {
			try {
	        	for(String image : ImageList) {
	    			projCafeReview.updateCafeNonImage(cafe.getCafe_Review_Number());
	        		ProjCafeReviewVO imagelist = new ProjCafeReviewVO();
	        		imagelist.setREVIEW_IMAGE(image);
	        		imagelist.setCafe_Review_Number(cafe.getCafe_Review_Number());
	        		projCafeReview.updateCafeImage(imagelist);
		        }
			} catch (Exception e) {
				e.getMessage();
			}
		}
		
		projCafeReview.updateCafeReview(cafe);
	}

	@Override
	public void deleteCafeReview(int cafe_Review_Number) {
		
		
		projCafeReview.deleteReviewImage(cafe_Review_Number);
		
		projCafeReview.deleteCafeReview(cafe_Review_Number);
	}

}
