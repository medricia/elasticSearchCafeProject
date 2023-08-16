package com.projcafe.cafe.Giftycorn.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornVO;
import com.projcafe.cafe.Giftycorn.service.GiftycornService;
import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.GiftycornCafeList.service.GiftycornCafeListService;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;
import com.projcafe.cafe.user.service.ProjCafeUserService;

@Controller
public class ProjCafeGiftycornController {
	
	@Autowired
	GiftycornService service;
		
	@Autowired
	GiftycornCafeListService CafeList;
	
	@Autowired
	ProjCafeUserService UserService;
	
	@ModelAttribute("giftycornCafeList")
	public Map<String, Integer> SelectGiftyCornCafe(ProjCafeGiftycornCafeListVO vo){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		
		List<ProjCafeGiftycornCafeListVO> infoList = CafeList.getGiftycornCafeList(vo);
		
		for(int i = 0; i < infoList.size(); i++) {
			conditionMap.put(infoList.get(i).getGIFTYCORN_CAFE_NAME(), infoList.get(i).getGIFTYCORN_CLN());
		}
		return conditionMap; 
	}
	
	@ModelAttribute("MONTH_SELECT")
	public Map<String, Integer> MONTHConditionMap(){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		for(int i=1;i<=12;i++) {
			conditionMap.put(i+"월", i);
		}
	    return conditionMap;
	}
	/* 현재 사용하지 않습니다.
	@RequestMapping("/getgiftycorn.cafe")
	public String getgiftycornForm(Model model, ProjCafeGiftycornVO vo) {
		List<ProjCafeGiftycornVO> InfoList = service.getGiftycornlist(vo);
			
		model.addAttribute("InfoList", InfoList);
		
		return "AboutGiftycorn/readGiftycorn";
	}
	*/
	@RequestMapping("/getgiftycornInfo.cafe")
	public String getgiftycornInfo(Model model, ProjCafeGiftycornVO vo) {
		ProjCafeGiftycornVO info = service.getGiftycornInfo(vo.getGIFTYCORN_ID());
		model.addAttribute("GiftycornInfo", info);
		
		return "AboutGiftycorn/getGiftyCorn";
	}
	
	@RequestMapping(value = "/creategiftycorn.cafe", method = RequestMethod.GET)
	public String insertGiftycornForm() {
		return "AboutGiftycorn/createGiftycorn";
	}
	
	@RequestMapping(value = "/creategiftycorn.cafe", method = RequestMethod.POST)
	public String insertGiftycornProc(ProjCafeGiftycornVO vo, HttpSession session) {
		System.out.println("기프티 넘버: "+ vo.getGIFTYCORN_CLN());
		
		//파일 저장 위치
		String Folder = "resources/Image/GiftycornImage";
		String GiftyCornSaveFolder = session.getServletContext().getRealPath(Folder);
		
		//저장할 위치가 없을 경우 폴더 생성
		File dir = new File(GiftyCornSaveFolder);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
		MultipartFile uploadFile = vo.getUPLOADIMAGE();
		if(! uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf("."));

            // 이름 값 변경을 위한 설정
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
            
            String reName = sdf.format(System.currentTimeMillis()) + "_" + ext;
            
			try {
				File destination = new File(GiftyCornSaveFolder + "/" + reName);
				uploadFile.transferTo(destination);
				vo.setGIFTYCORN_IMAGE_LOCATION(Folder +"/" + reName);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			vo.setGIFTYCORN_IMAGE_LOCATION("null");
		}
		service.createGiftycorn(vo);
		
		return "AboutGiftycorn/GiftycornIsUpdate";
	}
	
	@RequestMapping(value= "/updategiftycorn.cafe", method = RequestMethod.GET)
	public String UpdateGiftycornInfo(ProjCafeGiftycornVO vo, Model model) {
		ProjCafeGiftycornVO info = service.getGiftycornInfo(vo.getGIFTYCORN_ID());
		model.addAttribute("GiftycornInfo", info);
		return "AboutGiftycorn/updateGiftycorn";
	}
	
	@RequestMapping(value = "/updategiftycorn.cafe", method = RequestMethod.POST)
	public String UpdateGiftycornProc(ProjCafeGiftycornVO vo, HttpSession session) {
		
		//파일 저장 위치
		String Folder = "resources/Image/GiftycornImage";
		String GiftyCornSaveFolder = session.getServletContext().getRealPath(Folder);
		
		//저장할 위치가 없을 경우 폴더 생성
		File dir = new File(GiftyCornSaveFolder);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        
		MultipartFile uploadFile = vo.getUPLOADIMAGE();
		if(uploadFile != null) {
			String fileName = uploadFile.getOriginalFilename();
			String ext = fileName.substring(fileName.lastIndexOf("."));

            // 이름 값 변경을 위한 설정
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
            
            String reName = sdf.format(System.currentTimeMillis()) + "_" + ext;
            
			try {
				File destination = new File(GiftyCornSaveFolder + "/" + reName);
				uploadFile.transferTo(destination);
				vo.setGIFTYCORN_IMAGE_LOCATION(Folder +"/" + reName);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			ProjCafeGiftycornVO IMG = new ProjCafeGiftycornVO();
			IMG = service.getGiftycornInfo(vo.getGIFTYCORN_ID());
			vo.setGIFTYCORN_IMAGE_LOCATION(IMG.getGIFTYCORN_IMAGE_LOCATION());
		}
		
		service.updateGiftycorn(vo);
		
		return "AboutGiftycorn/GiftycornIsUpdate";
	}
	
	@RequestMapping("/deletegiftycorn.cafe")
	public String DeleteGiftycornInfo(ProjCafeGiftycornVO vo) {
		service.deleteGiftycorn(vo.getGIFTYCORN_ID());
		
		return "AboutGiftycorn/GiftycornIsUpdate";
	};
	
}
