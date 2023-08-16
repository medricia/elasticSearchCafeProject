package com.projcafe.cafe.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.board.repository.ProjCafeVO;
import com.projcafe.cafe.board.service.ProjCafeService;
import com.projcafe.cafe.review.repository.ProjCafeReviewVO;
import com.projcafe.cafe.review.service.ProjCafeReviewService;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;
import com.projcafe.cafe.user.service.ProjCafeUserService;

@Controller
public class ProjCafeReviewController {
	
	@Autowired
	ProjCafeReviewService projCafeReview;
	@Autowired
	ProjCafeService getCafe;
	@Autowired
	ProjCafeUserService getusernickname;

	@ModelAttribute("getUserNickname")
	public Map<String, String> getUserNickname(ProjCafeUserVO vo){
		Map<String, String> conditionMap = new LinkedHashMap<>();
		
		List<ProjCafeUserVO> infoList = getusernickname.GetInfoList(vo);
		
		for(int i = 0; i < infoList.size(); i++) {
			conditionMap.put(infoList.get(i).getMEMBER_NICKNAME(),infoList.get(i).getMEMBER_ID());
		}
		return conditionMap; 
	}

	
	@ModelAttribute("ReviewCafeList")
	public Map<String, Integer> SelectGiftyCornCafe(ProjCafeVO vo){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		
		List<ProjCafeVO> infoList = getCafe.getCafeList(vo);
		
		for(int i = 0; i < infoList.size(); i++) {
			conditionMap.put(infoList.get(i).getCAFE_NAME(),infoList.get(i).getCAFE_ID());
		}
		return conditionMap; 
	}
	
	// 리뷰 등록 화면
	@RequestMapping(value="/insertCafeReview.cafe", method = RequestMethod.GET)
	public String insertCafeReviewForm(ProjCafeReviewVO vo, Model model) {
		
		//0504 수정
		//getCafe.getCafe(vo.getCafe_ID());
		//model.addAttribute("cafeID", getCafe.getCafe(vo.getCafe_ID()));
		
		ProjCafeVO cafe = getCafe.getCafe(vo.getCafe_ID());
		model.addAttribute("cafe_ID", cafe);
		
		return "AboutReview/createReview";
	}
			
	// 리뷰 등록 처리
	@RequestMapping(value="/insertCafeReview.cafe", method = RequestMethod.POST)
	public String insertCafeReviewProc(ProjCafeReviewVO vo, HttpSession session) throws Exception {	
		
		//파일 저장 위치
		String Folder = "resources/Image/ReviewImage";
		String ReivewSaveFolder = session.getServletContext().getRealPath(Folder);
		
		//저장할 위치가 없을 경우 폴더 생성
		File dir = new File(ReivewSaveFolder);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
        List<MultipartFile> uploadFiles = vo.getUPLOADIMAGE();
        System.out.println(vo.getUPLOADIMAGE().toString());
        
        List<String> namelist = new ArrayList<>();
		
        if(! uploadFiles.isEmpty()) {
        	for(MultipartFile uploadFile :uploadFiles) {
				System.out.println("단일 파일: "+uploadFile.toString());
				if(! uploadFile.getOriginalFilename().isBlank()) {
					UUID uuid = UUID.randomUUID();
					
		            SimpleDateFormat sdf = new SimpleDateFormat("ssSSS");
		           
					String reName = sdf.format(System.currentTimeMillis()) + "_" + uuid;
		            
					File destination = new File(ReivewSaveFolder + "/" + reName);
					uploadFile.transferTo(destination);
					String name = Folder +"/" + reName;
					namelist.add(name);
					vo.setREVIEW_IMAGE_LIST(namelist);
				}
        	}
		}
		
		projCafeReview.insertCafeReview(vo);
		
		//0504수정
		//return "redirect:getCafeReviewList.cafe";
		return "redirect:getCafe.cafe?CAFE_ID=" + vo.getCafe_ID();
	}
	
	/* 현재 리뷰 리스트는 쓰지 않습니다.
	@RequestMapping("/getCafeReiviewMemberList.cafe")
	public String getCafeReviewMemberList(ProjCafeReviewVO vo, Model model) {
		List<ProjCafeReviewVO> list = projCafeReview.getCafeReviewMemberList(vo.getMEMBER_ID());
		model.addAttribute("MemberReviewList", list);
		return "AboutReview/MemberReview";
	}
	*/
	
	//리뷰 리스트
	@RequestMapping(value = "/getCafeReviewList.cafe")
	public String getCafeReviewList(ProjCafeReviewVO vo, Model model) {
		List<ProjCafeReviewVO> list = projCafeReview.getCafeReviewMemberList(vo.getMEMBER_ID());
		//0504 수정 관주
		//List<ProjCafeReviewVO> list = projCafeReview.getCafeReviewList(vo);
		model.addAttribute("cafeReviewList", list);
		return "AboutReview/ReviewList";
	}
	
	//리뷰 상세보기
	@RequestMapping("/getCafeReview.cafe")
	public String getCafeReview(Model model, ProjCafeReviewVO vo) {
		ProjCafeReviewVO cafe = projCafeReview.getCafeReview(vo.getCafe_Review_Number());
		List<ProjCafeReviewVO> list = projCafeReview.getCafeReviewImage(vo.getCafe_Review_Number());
		
		model.addAttribute("review", cafe);
		model.addAttribute("reviewImage", list);
		
		model.addAttribute("reviewImageBoolean", list);
		
		
		return "AboutReview/getReviewInfo";
	}
	
	//리뷰 수정
	@RequestMapping(value = "/updateCafeReview.cafe", method = RequestMethod.GET)
	public String updateCafeReview(ProjCafeReviewVO vo, Model model) { 
		ProjCafeReviewVO cafe = projCafeReview.getCafeReview(vo.getCafe_Review_Number());
		model.addAttribute("review", cafe);
		return "AboutReview/updateReviewInfo";
	}
	
	@RequestMapping(value = "/updateCafeReview.cafe", method = RequestMethod.POST)
	public String updateCafeReviewProc(ProjCafeReviewVO vo, HttpSession session) throws Exception{ 
		
		//파일 저장 위치
		String Folder = "resources/Image/ReviewImage";
		String ReivewSaveFolder = session.getServletContext().getRealPath(Folder);
		
		//저장할 위치가 없을 경우 폴더 생성
		File dir = new File(ReivewSaveFolder);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
        List<MultipartFile> uploadFiles = vo.getUPLOADIMAGE();
        System.out.println(vo.getUPLOADIMAGE().toString());
        
        List<String> namelist = new ArrayList<>();
		
        if(! uploadFiles.isEmpty()) {
        	for(MultipartFile uploadFile :uploadFiles) {
				System.out.println("단일 파일: "+uploadFile.toString());
				if(! uploadFile.getOriginalFilename().isBlank()) {
					UUID uuid = UUID.randomUUID();
					
		            SimpleDateFormat sdf = new SimpleDateFormat("ssSSS");
		           
					String reName = sdf.format(System.currentTimeMillis()) + "_" + uuid;
		            
					File destination = new File(ReivewSaveFolder + "/" + reName);
					uploadFile.transferTo(destination);
					String name = Folder +"/" + reName;
					namelist.add(name);
					vo.setREVIEW_IMAGE_LIST(namelist);
				}
        	}
		}
		
		projCafeReview.updateCafeReview(vo);
		return "AboutReview/ReviewIsUpdate";
	}
	
			
	//리뷰 삭제
	@RequestMapping("/deleteCafeReview.cafe")
	public String deleteCafeReview(ProjCafeReviewVO vo) {
		
		projCafeReview.deleteCafeReview(vo.getCafe_Review_Number());
		return "AboutReview/deleteReviewInfo";
	}
	
	
}
