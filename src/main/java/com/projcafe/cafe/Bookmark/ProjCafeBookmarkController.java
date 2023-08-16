package com.projcafe.cafe.Bookmark;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.projcafe.cafe.board.repository.ProjCafeVO;
import com.projcafe.cafe.board.service.ProjCafeService;

@Controller
@SessionAttributes("BookmarkInfo")
public class ProjCafeBookmarkController {
	@Autowired
	ProjCafeBookmarkService service;
	
	@Autowired
	@Qualifier("projCafeService")
	ProjCafeService getCafe;
	
	@ModelAttribute("getCafeID")
	public Map<String, Integer> SelectGiftyCornCafe(ProjCafeVO vo){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		
		List<ProjCafeVO> infoList = getCafe.getCafeList(vo);
		
		for(int i = 0; i < infoList.size(); i++) {
			conditionMap.put(infoList.get(i).getCAFE_NAME(), infoList.get(i).getCAFE_ID());
		}
		
		return conditionMap; 
	}
	
	@GetMapping("/createBookmark.cafe")
	public String CreateBookmark(ProjCafeBookmarkVO vo, Model model) {
		System.out.println(vo.getCAFE_ID());
		model.addAttribute("CafeID",vo.getCAFE_ID());
		
		return "AboutCafeBookmark/BookmarkIsCreate";	
	}
	
	@PostMapping("/createBookmark.cafe")
	public String CreateBookmarkProc(ProjCafeBookmarkVO vo) {
		service.createBookmark(vo);
		return "AboutCafeBookmark/BookmarkIsCreate";
	}
	
	@RequestMapping("/getBookmarkList.cafe")
	public String Member_ID(ProjCafeBookmarkVO vo, Model model) {
		List<ProjCafeBookmarkVO> list = service.getBookmark(vo.getMEMBER_ID());
		model.addAttribute("Bookmark", list);
		
		return "AboutCafeBookmark/BookmarkList";
	}

	@RequestMapping("/GetBookmark.cafe")
	public String readBookmark(ProjCafeBookmarkVO vo, Model model) {
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("MEMBER_ID", vo.getMEMBER_ID());
		map.put("CAFE_ID", vo.getCAFE_ID());

		model.addAttribute("BookmarkInfo", service.getBookmarkInfo(map));
		
		return "AboutCafeBookmark/getBookmarkInfo";
	}
	
	@RequestMapping(value="updateBookmark.cafe",method = RequestMethod.GET)
	public String updateBookmark(@ModelAttribute("BookmarkInfo") ProjCafeBookmarkVO vo) {
		return "AboutCafeBookmark/updateBookmarkInfo";
	}

	@RequestMapping(value="updateBookmark.cafe",method = RequestMethod.POST)
	public String updateBookmarkInfo(ProjCafeBookmarkVO vo) {
		service.updateBookmark(vo);
		return "AboutCafeBookmark/BookmarkIsUpdate";		
	}
	
	@RequestMapping("deleteBookmark.cafe")
	public String deleteBookmark(ProjCafeBookmarkVO vo) {
		Map<String,Object> map = new HashMap<>();
		
		map.put("MEMBER_ID", vo.getMEMBER_ID());
		map.put("CAFE_ID", vo.getCAFE_ID());
		
		service.deleteBookmark(map);
		return "AboutCafeBookmark/BookmarkIsCreate";
	}
	
}
