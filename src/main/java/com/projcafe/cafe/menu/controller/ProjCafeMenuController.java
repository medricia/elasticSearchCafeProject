package com.projcafe.cafe.menu.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.projcafe.cafe.menu.repository.ProjCafeMenuVO;
import com.projcafe.cafe.menu.service.ProjCafeMenu;

@Controller
public class ProjCafeMenuController {
	
		@Autowired
		ProjCafeMenu projCafeMenu;
		
		//메뉴 리스트 가져오기
		@RequestMapping(value = "/getCafeMenuList.cafe")
		public String getCafeMenuList(ProjCafeMenuVO vo, Model model) {
			
			List<ProjCafeMenuVO> list = projCafeMenu.getCafeMenuList(vo.getCafe_ID());
			model.addAttribute("MENU", list);
			
			return "AboutMenu/getMenuList";
			
		}
	
		// 메뉴 등록 화면
		@RequestMapping(value="/insertCafeMenu.cafe", method = RequestMethod.GET)
		public String insertCafeForm() {
			return "AboutMenu/createMenuform";
		}
			
		// 메뉴 등록 처리
		@RequestMapping(value="/insertCafeMenu.cafe", method = RequestMethod.POST)
		public String insertCafeMenuProc(ProjCafeMenuVO vo, HttpSession session) {
				
			projCafeMenu.insertCafeMenu(vo);
			return "redirect:getCafe.cafe?CAFE_ID=" + vo.getCafe_ID();
		}
			
		// 메뉴 수정
		@RequestMapping(value = "/updateCafeMenu.cafe", method = RequestMethod.GET)
		public String updateCafeMenu(ProjCafeMenuVO vo, Model model) { 
			System.out.println("카페 아이디가 들어오는가?" + vo.getCafe_ID());
			
			List<ProjCafeMenuVO> list = projCafeMenu.getCafeMenuList(vo.getCafe_ID());
			
			
			model.addAttribute("MENU", list);
			
			return "AboutMenu/updateMenuInfo";
		}
					
		@RequestMapping(value = "/updateCafeMenu.cafe", method = RequestMethod.POST)
		public String updateCafeInfo(ProjCafeMenuVO vo, Model model, HttpServletRequest request)	{		
			projCafeMenu.updateCafeMenu(vo);
			//model.addAttribute("CafeID", vo.getCafe_ID());
			String name = request.getParameter("Cafe_ID");
			model.addAttribute("CafeID", name);
			
			return "AboutMenu/MenuIsUpdate";
		}
			
		// 메뉴 삭제
		@RequestMapping("/deleteCafeMenu.cafe")
		public String deleteCafeMenu(ProjCafeMenuVO vo) {
				
			projCafeMenu.deleteCafeMenu(vo.getCafe_Menu_ID());
			return "AboutMenu/deleteMenuInfo";
		}
	
	
	
	
	
}
