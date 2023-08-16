package com.projcafe.cafe.GiftycornCafeList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.GiftycornCafeList.service.GiftycornCafeListService;

@Controller
public class ProjCafeGiftycornCafeListController {
	
	@Autowired
	GiftycornCafeListService CafeListService;
	
	@RequestMapping("/getgiftycornCafeListService.cafe")
	public String getGiftycornCafeForm(Model model, ProjCafeGiftycornCafeListVO vo) {
		List<ProjCafeGiftycornCafeListVO> InfoList = CafeListService.getGiftycornCafeList(vo);
			
		model.addAttribute("InfoList", InfoList);
		
		return "AboutGiftycornCafeList/readgiftycorncafelist";
	}
	
	@RequestMapping("/getCafeListServiceInfo.cafe")
	public String getGiftycornCafeInfo(Model model, ProjCafeGiftycornCafeListVO vo) {
		ProjCafeGiftycornCafeListVO info = CafeListService.getGiftycornCafeInfo(vo.getGIFTYCORN_CLN());
		model.addAttribute("info", info);
		
		return"AboutGiftycornCafeList/getgiftycorncafe";
	}
	
	
	@RequestMapping(value = "/creategiftycornCafeListService.cafe", method = RequestMethod.GET)
	public String insertGiftyCafeForm() {
		return "AboutGiftycornCafeList/creategiftycorncafelist";
	}
	
	@RequestMapping(value = "/creategiftycornCafeListService.cafe", method = RequestMethod.POST)
	public String insertGiftyCafeProc(ProjCafeGiftycornCafeListVO vo) {
		CafeListService.createGiftycornCafeList(vo);
		return "redirect:getgiftycornCafeListService.cafe";
	}

	@RequestMapping(value= "/updategiftycornCafeListService.cafe", method = RequestMethod.GET)
	public String UpdateGiftyCafeForm(ProjCafeGiftycornCafeListVO vo, Model model) {
		List<ProjCafeGiftycornCafeListVO> InfoList = CafeListService.getGiftycornCafeList(vo);
		model.addAttribute("InfoList", InfoList);
		
		return "AboutGiftycornCafeList/updategiftycorncafelist";
	}
	
	@RequestMapping(value = "/updategiftycornCafeListService.cafe", method = RequestMethod.POST)
	public String UpdateGiftyCafeProc(ProjCafeGiftycornCafeListVO vo) {
		CafeListService.updateGiftycornCafeList(vo);
		
		return "redirect:getgiftycornCafeListService.cafe";
	}
	@GetMapping("/deletegiftycornCafeListService.cafe")
	public String DeleteGiftyCafeInfo(ProjCafeGiftycornCafeListVO vo, Model model) {
		List<ProjCafeGiftycornCafeListVO> InfoList = CafeListService.getGiftycornCafeList(vo);
		model.addAttribute("InfoList", InfoList);
		return "AboutGiftycornCafeList/deletegiftycorncafelist";
	};
	@PostMapping("/deletegiftycornCafeListService.cafe")
	public String DeleteGiftyCafeProc(ProjCafeGiftycornCafeListVO vo) {
		CafeListService.deleteGiftycornCafeList(vo.getGIFTYCORN_CLN());
		
		return "redirect:getgiftycornCafeListService.cafe";
	};
	
}

