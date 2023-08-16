package com.projcafe.cafe.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projcafe.cafe.board.repository.ProjcafeElasticVO;
import com.projcafe.cafe.board.repository.ProjcafesearchkeywordVO;
import com.projcafe.cafe.board.service.ProjCafeSearchservice;
import com.projcafe.cafe.board.service.ProjCafeServiceImpl2;

@Controller
public class ElasticController {
	@Autowired
	ProjCafeServiceImpl2 elasticsearch;
	@Autowired
	ProjCafeSearchservice search;
	
	public ProjcafeElasticVO getCafe(@RequestParam String cafe_id) {
		ProjcafeElasticVO person = new ProjcafeElasticVO();
		person = elasticsearch.findById(cafe_id);
		System.out.println(person);
		return person;
	}
	
	@GetMapping("/getname")
	public String getCafes(@RequestParam(required = false) String name, Model model, @RequestParam(required = false) Double lat, @RequestParam(required = false) Double lon) {
	    Pageable pageable;
    	
	    int startpage = 0; // 기본값을 0으로 설정
	    if(name==null) {
	    	name="";
	    }else if(name.contains("근처") || name.contains("주변")) {
	    	pageable = PageRequest.of(startpage, 10);
	        
	    	System.out.println(lat+"+"+lon);
	    	
	    	List<ProjcafeElasticVO> finename = elasticsearch.findClosestCafes(lat, lon, pageable);
		    model.addAttribute("elastic", finename);

	    }else {
	    	int endpage = startpage + 10; // 페이지 범위 계산

		    pageable = PageRequest.of(startpage, endpage);

		    List<ProjcafeElasticVO> finename = elasticsearch.findname(name, pageable);
		    model.addAttribute("elastic", finename);
	    }
	    
	    if(name != "") {
			ProjcafesearchkeywordVO entity = new ProjcafesearchkeywordVO();
		    entity.setSEARCHKEYWORD(name);

		    search.save(entity);
		 }

	    return "elastic/elastic";
	}
	
	@GetMapping("/getcafename")
	@ResponseBody
	public List<ProjcafeElasticVO> getCafes(@RequestParam(required = false) String name, @RequestParam(required = false) Integer startpage, @RequestParam(required = false) Double lat, @RequestParam(required = false) Double lon) {
	    Pageable pageable;
	    List<ProjcafeElasticVO> finename = null;
	    if(name==null) {
	    	name="";
	    }else if(lat != null || lon != null) {
	    	System.out.println("근처: "+ name);
	    	System.out.println(startpage);
	    	pageable = PageRequest.of(startpage, 9);
	    	
	    	finename = elasticsearch.findClosestCafes(lat, lon, pageable);
	    }else{
	    	 System.out.println(name);
			   
	 	    pageable = PageRequest.of(startpage, 9);

	 	    finename = elasticsearch.findname(name, pageable);
	    }
	   
	    return finename;
	}
	
	


	@GetMapping("/getcafe")
	public Iterable<ProjcafeElasticVO> getCafe() {
		Iterable<ProjcafeElasticVO> person = elasticsearch.findAll();
		System.out.println("person? "+ person);
		return person;
	}
	
}
