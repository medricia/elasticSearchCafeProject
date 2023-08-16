package com.projcafe.cafe.FEtest.KJ.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.projcafe.cafe.GiftycornCafeList.service.GiftycornCafeListService;
import com.projcafe.cafe.board.repository.ProjCafeVO;
import com.projcafe.cafe.board.service.ProjCafeService;
import com.projcafe.cafe.user.service.ProjCafeUserService;



@Controller
@SessionAttributes("cafeInfo")
public class TestController {
	
	@Autowired
	ProjCafeService projCafeService;
	@Autowired
	GiftycornCafeListService CafeList;
	@Autowired
	ProjCafeUserService memberID;
	
	@RequestMapping("homeCafe.cafe")
	public String home() {
		return "/FE/Homeindex";
	}
	
	@RequestMapping("cafeInfo.cafe")
	public String cafeInfo() {
		return "/FE/CafeInfo";
	}
	@RequestMapping("mapGeneral.cafe")
	public String mapGeneral() {
		return "/FE/MapGeneral";
	}
	@RequestMapping("notice.cafe")
	public String notice() {
		return "/FE/Notice";
	}
	@RequestMapping("cafeMap.cafe")
	public String cafeMap(Model model, ProjCafeVO vo) {

		ProjCafeVO cafe = projCafeService.getCafe(vo.getCAFE_ID());
		model.addAttribute("MapInfo", cafe);
		
		return "AboutCafe/MapEvent";
	}
}
