package com.projcafe.cafe.user.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornVO;
import com.projcafe.cafe.Giftycorn.service.GiftycornService;
import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.GiftycornCafeList.service.GiftycornCafeListService;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;
import com.projcafe.cafe.user.service.ProjCafeUserService;

@Controller("projCafeUserController")
@SessionAttributes("userInfo")
public class ProjCafeUserController {
	
	@Autowired
	ProjCafeUserService Serivce;
	@Autowired
	GiftycornCafeListService CafeListService;
	@Autowired
	GiftycornService Giftycorn;
	
	@ModelAttribute("getCafeList")
	public Map<String, Integer> getGiftyCornCafe(ProjCafeGiftycornCafeListVO vo){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		
		List<ProjCafeGiftycornCafeListVO> infoList = CafeListService.getGiftycornCafeList(vo);
		for(int i = 0; i < infoList.size(); i++) {
			System.out.println(infoList.get(i).getGIFTYCORN_CAFE_NAME());
			System.out.println(infoList.get(i).getGIFTYCORN_CLN());

			conditionMap.put(infoList.get(i).getGIFTYCORN_CAFE_NAME(),infoList.get(i).getGIFTYCORN_CLN());
		}
		return conditionMap; 
	}
	
	
	@ModelAttribute("GENDER_SELECT")
	public Map<String, String> GENDERConditionMap(){
	    Map<String, String> conditionMap = new HashMap<>();
	    
	    conditionMap.put("여성","F");
	    conditionMap.put("남성","M");
	    conditionMap.put("선택하지 않음","NONE");

	    List<String> valuesList = new ArrayList<>(conditionMap.values());
	    Collections.sort(valuesList);

	    Map<String, String> sortedMap = new LinkedHashMap<>();
	    for(String value : valuesList){
	        for(Map.Entry<String, String> entry : conditionMap.entrySet()){
	            if(entry.getValue().equals(value)){
	                sortedMap.put(entry.getKey(), entry.getValue());
	            }
	        }
	    }
	    return sortedMap;
	}


	@ModelAttribute("MONTH_SELECT")
	public Map<String, Integer> MONTHConditionMap(){
		Map<String, Integer> conditionMap = new LinkedHashMap<>();
		for(int i=1;i<=12;i++) {
			conditionMap.put(i+"월", i);
		}
	    return conditionMap;
	}
	
	@RequestMapping("/checkID.cafe")
	public String checkID(ProjCafeUserVO vo, Model model) {
		
		
		List<ProjCafeUserVO> list = Serivce.GetInfoList(vo);
		
		model.addAttribute("userInfolist", list);
		
		return "AboutUser/checkID";
	}
	
	@GetMapping("/dologin.cafe")
	public String login() {
		return "Aboutlogin/dologin";
	}
	
	@PostMapping("/dologin.cafe")
	public String login(ProjCafeUserVO vo, HttpSession session) {
		List<ProjCafeUserVO> list = Serivce.GetInfoList(vo);
		System.out.println("입력한 id: "+vo.getMEMBER_ID());
		System.out.println("입력한 password: "+vo.getMEMBER_PW());
		
		for(ProjCafeUserVO check : list) {
			System.out.println("id:"+check.getMEMBER_ID());
			System.out.println("pw:" + check.getMEMBER_PW());
			
			if(check.getMEMBER_ID().equals(vo.getMEMBER_ID())) {
				System.out.println("아이디 존재");
				ProjCafeUserVO pwCheck = Serivce.getInfo(vo.getMEMBER_ID());
				
				if(pwCheck.getMEMBER_PW().equals(vo.getMEMBER_PW())) {
					System.out.println("패스워드 존재");
					session.setAttribute("LoginMEMBER", vo.getMEMBER_ID());
					return "goIndex";
				}
				
			}
			
		}
		
		return "Aboutlogin/dologin";
	}
	
	@RequestMapping("/dologout.cafe")
	public String logout() {
		return "Aboutlogin/dologout";
	}
	
	@RequestMapping("/getUserList.cafe")
	public String getUserInfoList(ProjCafeUserVO vo, Model model) {
		
		List<ProjCafeUserVO> list = Serivce.GetInfoList(vo);
	
		model.addAttribute("userInfolist", list);
		
		
		return "AboutUser/userList";
	}
	
	@RequestMapping("/getUserInfo.cafe")
	public String getGiftycornInfo(Model model, ProjCafeUserVO vo) {
		List<ProjCafeGiftycornVO> InfoList = Giftycorn.getGiftycornMemberlist(vo.getMEMBER_ID());
		int GiftycornSize = InfoList.size();
		
		model.addAttribute("GiftyCornInfoList", InfoList);
		model.addAttribute("GiftycornSize", GiftycornSize);
		ProjCafeGiftycornCafeListVO cafe = new ProjCafeGiftycornCafeListVO();
		List<ProjCafeGiftycornCafeListVO> CafeList = CafeListService.getGiftycornCafeList(cafe);
		model.addAttribute("CafeList", CafeList);
		
		ProjCafeUserVO userInfo = Serivce.getInfo(vo.getMEMBER_ID());
		
		model.addAttribute("userInfo", userInfo);
		
		return "AboutUser/getUserInfo";
	}
	
	@RequestMapping("/getRealUserInfo.cafe")
	public String getUserInfo(Model model, ProjCafeUserVO vo) {
		
		ProjCafeUserVO userInfo = Serivce.getInfo(vo.getMEMBER_ID());
		
		model.addAttribute("userInfo", userInfo);
		
		return "AboutUser/AboutUserInfo";
	}
	
	@RequestMapping(value = "/joinMember*.cafe", method = RequestMethod.GET)
	public String insertUserForm() {
		return "AboutUser/joinLoginform";
	}
	
	@RequestMapping(value = "/joinMember*.cafe", method = RequestMethod.POST)
	public String insertUserProc(ProjCafeUserVO vo) {
		Serivce.createInfo(vo);
		
		return "goIndex";
	}
	@GetMapping("/AreyousureUpdate.cafe")
	public String Areyousure() {
		return "AboutUser/checkPW";
	}
	@PostMapping("/AreyousureUpdate.cafe")
	public String Okay(ProjCafeUserVO vo) {
		List<ProjCafeUserVO> list = Serivce.GetInfoList(vo);
		System.out.println("입력한 id: "+vo.getMEMBER_ID());
		System.out.println("입력한 password: "+vo.getMEMBER_PW());
		
		for(ProjCafeUserVO check : list) {
			if(check.getMEMBER_ID().equals(vo.getMEMBER_ID())) {
				System.out.println("아이디 존재");
				ProjCafeUserVO pwCheck = Serivce.getInfo(vo.getMEMBER_ID());
				
				if(pwCheck.getMEMBER_PW().equals(vo.getMEMBER_PW())) {
					System.out.println("아이디 패스워드 패스워드 일치");
					return "AboutUser/PWisRight";
				}
				
			}
			
		}
		return "AboutUser/checkPW";
	}
	
	@GetMapping("/updateUserInfo.cafe")
	public String UpdateUserInfo(@ModelAttribute("userInfo") ProjCafeUserVO vo) {
		return "AboutUser/updateUserInfo";
	}
	@PostMapping("/updateUserInfo.cafe")
	public String UpdateUserProc(ProjCafeUserVO vo) {
		Serivce.updateInfo(vo);
		
		return "AboutUser/UserInfoIsUpdate";
		//return "redirect:getUserList.cafe";
		
	}
	@RequestMapping("/deleteUserInfo.cafe")
	public String DeleteUser() {
		return "AboutUser/deleteUserInfo";
	}
	
	@RequestMapping("/deleteUser.cafe")
	public String DeleteUserInfo(ProjCafeUserVO vo) {
		Map<String, Object> map = new HashMap<>();
		map.put("MEMBER_ID", vo.getMEMBER_ID());
		map.put("MEMBER_PW", vo.getMEMBER_PW());
		
		Serivce.deleteChild(vo.getMEMBER_ID());
		Serivce.deleteInfo(map);
		return "AboutUser/userInfoIsdelete";
	};
}
