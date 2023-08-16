package com.projcafe.cafe.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornVO;
import com.projcafe.cafe.Giftycorn.service.GiftycornService;
import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.GiftycornCafeList.service.GiftycornCafeListService;
import com.projcafe.cafe.board.repository.ProjCafeDAO;
import com.projcafe.cafe.board.repository.ProjCafeVO;
import com.projcafe.cafe.board.repository.ProjcafesearchkeywordVO;
import com.projcafe.cafe.board.service.ProjCafeSearchservice;
import com.projcafe.cafe.board.service.ProjCafeService;
import com.projcafe.cafe.menu.repository.ProjCafeMenuVO;
import com.projcafe.cafe.menu.service.ProjCafeMenu;
import com.projcafe.cafe.review.repository.ProjCafeReviewVO;
import com.projcafe.cafe.review.service.ProjCafeReviewService;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;
import com.projcafe.cafe.user.service.ProjCafeUserService;

@Controller
@SessionAttributes("cafeInfo")
public class ProjCafeController {
		
		@Autowired
		ProjCafeMenu projCafeMenu;
		@Autowired
		ProjCafeService projCafeService;
		@Autowired
		GiftycornCafeListService CafeList;
		@Autowired
		ProjCafeUserService memberID;
		@Autowired
		GiftycornService getGiftycorn;
		
		
		@Autowired
		ProjCafeSearchservice search;
		
		
		@Autowired
		ProjCafeDAO dao;
		
		@Autowired
		ProjCafeReviewService getReview;
		
		
		@ModelAttribute("conditionMap") // key
		public Map<String, String> searchConditionMap(){
			Map<String, String> conditionMap = new HashMap<>();
			
			conditionMap.put("이름", "CAFE_NAME");
			conditionMap.put("위치", "CAFE_LOCATION");
			
			return conditionMap; // value
		}
		
		@ModelAttribute("giftycornCafeList")
		public Map<String, Integer> SelectGiftyCornCafe(ProjCafeGiftycornCafeListVO vo){
			Map<String, Integer> conditionMap = new LinkedHashMap<>();
			
			List<ProjCafeGiftycornCafeListVO> infoList = CafeList.getGiftycornCafeList(vo);
			
			for(int i = 0; i < infoList.size(); i++) {
				conditionMap.put(infoList.get(i).getGIFTYCORN_CAFE_NAME(), infoList.get(i).getGIFTYCORN_CLN());
			}
			return conditionMap; 
		}
		
		// 글 목록 보기
		@RequestMapping(value = "/getCafeList.cafe")
		public String getCafeList(ProjCafeVO vo, Model model, HttpServletRequest request, @RequestParam(value = "reset", required = false, defaultValue = "false") boolean reset){
			HttpSession session = request.getSession();
			
			// 검색 이후의 화면인지, 초기 화면인지 판별하여 처리
		    if (reset) {
		        // 검색 조건을 초기화 
		        session.removeAttribute("searchCondition");
		        session.removeAttribute("searchKeyword");
		        vo.setSTARTPAGE(1);
		    } else {
		        // 이전 검색 조건을 유지
		        vo.setSEARCHKEYWORD(vo.getSEARCHKEYWORD());
		        vo.setSEARCHCONDITION(vo.getSEARCHCONDITION());
		        vo.setSTARTPAGE(vo.getSTARTPAGE());
		    }
			
			 // 세션에 저장된 검색어와 검색 조건을 읽어옵니다.
		    String searchCondition = (String) session.getAttribute("searchCondition");
		    String searchKeyword = (String) session.getAttribute("searchKeyword");
			
		    if (searchCondition == null) {
		        searchCondition = "CAFE_NAME";
		    }
		    
		    if (searchKeyword == null) {
		        searchKeyword = "";
		    }

		    // 요청 파라미터에서 검색어와 검색 조건을 읽어옵니다.
		    String requestSearchCondition = vo.getSEARCHCONDITION();
		    String requestSearchKeyword = vo.getSEARCHKEYWORD();
		    
		    if (requestSearchCondition != null && !requestSearchCondition.isEmpty()) {
		        searchCondition = requestSearchCondition;
		    }
		    
		    if (requestSearchKeyword != null && !requestSearchKeyword.isEmpty()) {
		        searchKeyword = requestSearchKeyword;
		    }
		    
		    // 세션에 검색어와 검색 조건을 저장합니다.
		    session.setAttribute("searchCondition", searchCondition);
		    session.setAttribute("searchKeyword", searchKeyword);
		    
			int page = 1; // 디폴트 1페이지
			int limit = 10;//한 페이지 당 보여줄 화면 갯수
			
			Map<String,Object> map = new HashMap<>();
			
			String pageData = request.getParameter("page");
			
			if(pageData != null) {
				page = Integer.parseInt(pageData);
			} 
			
			// CafeVO 객체에 검색어와 검색 조건을 설정합니다.
		    vo.setSEARCHCONDITION(searchCondition);
		    vo.setSEARCHKEYWORD(searchKeyword);
			
			
			
			int listCount = projCafeService.getCafeListCount(vo);
			
			int endPage = (int) (Math.ceil(((page + 10) / 10) * 10.0));
   		 	int startPage = endPage - 9;
    			int maxPage = (int) (Math.ceil((listCount * 1.0) / limit));
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
		
			int startrow = (page - 1) * 10 + 1;
			int endrow = startrow + limit - 1;
			int maxrow = (int) ((listCount * 1.0)/limit);
			
			vo.setSTARTPAGE(startrow);
			vo.setENDPAGE(endrow);
			vo.setMAXPAGE(maxrow);
			
			map.put("STARTPAGE",vo.getSTARTPAGE());
			map.put("ENDPAGE",vo.getENDPAGE());
			map.put("MAXPAGE",vo.getMAXPAGE());
			
			System.out.println("검색 조건 : " + vo.getSEARCHCONDITION());
			System.out.println("검색 단어 : " + vo.getSEARCHKEYWORD());
			
			if(vo.getSEARCHCONDITION() == null) {
				vo.setSEARCHCONDITION("CAFE_NAME");
			}
			
			if(vo.getSEARCHKEYWORD() != "") {
				ProjcafesearchkeywordVO entity = new ProjcafesearchkeywordVO();
			    entity.setSEARCHKEYWORD(searchKeyword);

			    search.save(entity);
			 }
			
			System.out.println("map에 넣기 전 searchcondition : " + vo.getSEARCHCONDITION());
			System.out.println("map에 넣기 전 searchkeyword : " + vo.getSEARCHKEYWORD());
			map.put("SEARCHCONDITION", vo.getSEARCHCONDITION());
			map.put("SEARCHKEYWORD", vo.getSEARCHKEYWORD());
			
			List<ProjCafeVO> cafelist = projCafeService.CafeList(map);
			
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("listCount", listCount);
			
			model.addAttribute("cafeList", cafelist);
			
			
			
			
			return "AboutCafe/CafeList";
		}
		
		// 상세 목록 보기
		@RequestMapping("/getCafe.cafe")
		public String getCafe(Model model, ProjCafeVO vo,HttpSession session) {
			
			List<ProjCafeReviewVO> reviewlist = getReview.getCafeReviewCafeID(vo.getCAFE_ID());
			model.addAttribute("cafeReviewList", reviewlist);
			
			List<ProjCafeMenuVO> list = projCafeMenu.getCafeMenuList(vo.getCAFE_ID());
			model.addAttribute("MENU", list);
			ProjCafeVO map = projCafeService.getCafe(vo.getCAFE_ID());
			model.addAttribute("MapInfo", map);
			
			String MemberID = (String) session.getAttribute("LoginMEMBER");
			
			System.out.println("session MemberID: "+MemberID);
			List<ProjCafeGiftycornVO> MEMBERGIFTY = getGiftycorn.getGiftycornNotDup(MemberID);
			
			for(ProjCafeGiftycornVO name : MEMBERGIFTY) {
				System.out.println("기프티콘 CLN 검색: "+ name.getGIFTYCORN_CLN());
			}
			
			model.addAttribute("GiftycornList", MEMBERGIFTY);

			List<ProjCafeGiftycornVO> giftyList = getGiftycorn.getGiftycornMemberlist(MemberID);
			model.addAttribute("getGiftycornMEMBERInfo", giftyList);
			
			ProjCafeVO cafe = projCafeService.getCafe(vo.getCAFE_ID());
			model.addAttribute("cafeInfo", cafe);

			System.out.println("기프티콘 CLN 검색: "+ cafe.getGIFTYCORN_CLN());
			System.out.println("카페 이름 검색: "+ cafe.getCAFE_NAME());
			
			return "AboutCafe/getCafeInfo";
		}
		
		@RequestMapping("/testMap")
		public String testMap(Model model, ProjCafeVO vo) {
			ProjCafeVO cafe = projCafeService.getCafe(vo.getCAFE_ID());
			
			List<ProjCafeVO> cafeList = projCafeService.getCafeList(vo);
			
			model.addAttribute("MapInfo", cafe);
			
			model.addAttribute("MapInfoList", cafeList);
			
			return "AboutCafe/practice";
		}
		
		// 글 등록 화면
		@RequestMapping(value="/insertCafe.cafe", method = RequestMethod.GET)
		public String insertCafeForm() {
			return "AboutCafe/CreateCafe";
		}
		
		// 글 등록 처리
		@RequestMapping(value="/insertCafe.cafe", method = RequestMethod.POST)
		public String insertCafeProc(ProjCafeVO vo, HttpSession session) {
			//파일 저장 위치
			String Folder = "resources/Image/CafeMainImage";
			String CafeMainImageSaveFolder = session.getServletContext().getRealPath(Folder);
			
			//저장할 위치가 없을 경우 폴더 생성
			File dir = new File(CafeMainImageSaveFolder);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
	        
			MultipartFile uploadFile = vo.getUPLOADIMAGE();
			if(! uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
	            
	            String reName = sdf.format(System.currentTimeMillis()) + "_" + vo.getCAFE_NAME();
	            
				try {
					File destination = new File(CafeMainImageSaveFolder + "/" + reName);
					uploadFile.transferTo(destination);
					vo.setCAFE_IMAGE(Folder +"/" + reName);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				vo.setCAFE_IMAGE("resources/defaultImage/defaultCoffeeLogo.jpg");
			}
			
			projCafeService.insertCafe(vo);
			return "redirect:getCafeList.cafe";
		}
		
		// 글 수정
		@RequestMapping(value = "/updateCafe.cafe", method = RequestMethod.GET)
		public String updateCafeInfo(@ModelAttribute("cafeInfo") ProjCafeVO vo) { 
			return "AboutCafe/updateCafeInfo";
		}
		
		@RequestMapping(value = "/updateCafe.cafe", method = RequestMethod.POST)
		public String updateCafeProc(ProjCafeVO vo, HttpSession session) { 
			//파일 저장 위치
			String Folder = "resources/Image/CafeMainImage";
			String CafeMainImageSaveFolder = session.getServletContext().getRealPath(Folder);
			
			//저장할 위치가 없을 경우 폴더 생성
			File dir = new File(CafeMainImageSaveFolder);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
	        
			MultipartFile uploadFile = vo.getUPLOADIMAGE();
			if(! uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
	            
	            String reName = sdf.format(System.currentTimeMillis()) + "_" + vo.getCAFE_NAME();
	            
				try {
					File destination = new File(CafeMainImageSaveFolder + "/" + reName);
					uploadFile.transferTo(destination);
					vo.setCAFE_IMAGE(Folder +"/" + reName);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				vo.setCAFE_IMAGE("resources/defaultImage/defaultCoffeeLogo.jpg");
			}
			
			projCafeService.updateCafe(vo);
			
			return "redirect:getCafeList.cafe";
		}
		
		// 글 삭제
		@RequestMapping("/deleteCafe.cafe")
		public String deleteCafe(ProjCafeVO vo, ProjCafeUserVO id) {
			Map<String,Object> map = new HashMap<>();
			List<ProjCafeUserVO> list = memberID.GetInfoList(id);
			for(ProjCafeUserVO memberID : list) {
				map.put("MEMBER_ID", memberID.getMEMBER_ID());
				map.put("CAFE_ID", vo.getCAFE_ID());
				
				//projCafeService.deleteBookmark(map);
			}
			projCafeService.deleteCafeTable(vo.getCAFE_ID());
			
			projCafeService.deleteCafe(vo.getCAFE_ID());
			return "AboutCafe/deleteCafeInfo";
		}
		
		
		// 실시간 랭킹 구현
		@RequestMapping("searchKeyword.cafe")
		public String searchkeyword(Model model) {
			
			model.addAttribute("rank");
			return "AboutCafe/keywordrank";
		}
	

}
