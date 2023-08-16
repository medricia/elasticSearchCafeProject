package com.projcafe.cafe.Anno;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

@Controller
@SessionAttributes("AnnoInfo")
public class AnnoController {

	    @Autowired
	    private AnnoService Service;
	    
	    @RequestMapping(value="/AnnoInsert.cafe",method = RequestMethod.GET)
	    public String createAnno() {
	        return "AboutAnno/CreateAnno2";
	    }
	    
	    @RequestMapping(value="/AnnoInsert.cafe",method=RequestMethod.POST)
	    public String createAnnoProc(AnnoVO vo, HttpSession session) throws Exception{
	    	
	    	//파일 저장 위치
			String Folder = "resources/Image/AnnoImage";
			String AnnoISaveFolder = session.getServletContext().getRealPath(Folder);
			
			//저장할 위치가 없을 경우 폴더 생성
			File dir = new File(AnnoISaveFolder);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
		        MultipartFile uploadFile = vo.getUPLOADIMAGE();
		        System.out.println(uploadFile);
		        if(uploadFile.getSize() != 0) {
					UUID uuid = UUID.randomUUID();
					
					File destination = new File(AnnoISaveFolder + "/" + uuid);
					uploadFile.transferTo(destination);
					String name = Folder +"/" + uuid;
					
					vo.setANNO_IMAGE(name);			
	        	}
		    Service.CreateAnno(vo);
	        return "redirect:GetAnnoList.cafe";
	    }
	    
	    
	    @RequestMapping("/GetAnnoList.cafe")
	    public String GetAnnoList(AnnoVO vo, Model model, HttpServletRequest request) {
	    	
	    	int page = 1; // 디폴트 1페이지
			int limit = 10;//한 페이지 당 보여줄 화면 갯수
			
			Map<String,Object> map = new HashMap<>();
			
			String pageData = request.getParameter("page");
			
			if(pageData != null) {
				page = Integer.parseInt(pageData);
			} 
			List<AnnoVO> listALL = Service.getALLList(vo);
			int listCount = listALL.size();
			
			int endPage = (int)(Math.ceil(listCount / 10.0)); 
			
			int startPage = endPage - 9;
			int maxPage = (int)(Math.ceil((listCount * 1.0)/limit));
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}

			int startrow = (page - 1) * 10 + 1;
			int endrow = startrow + limit - 1;
			
			vo.setSTARTPAGE(startrow);
			vo.setENDPAGE(endrow);
			
			map.put("STARTPAGE",vo.getSTARTPAGE());
			map.put("ENDPAGE",vo.getENDPAGE());
			
			List<AnnoVO> list = Service.GetInfoList(map);
			
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			
	    	model.addAttribute("AnnoList", list);
	    	
	    	return "AboutAnno/ReadAnnoList";
	    }
	    
	    @RequestMapping("/GetAnno.cafe")
	    public String GetAnno(AnnoVO vo, Model model) {
	    	AnnoVO getanno = Service.getInfo(vo.getANNO_ID());
	    	
	    	model.addAttribute("AnnoInfo", getanno);
	    	return "AboutAnno/ReadAnno";
	    }
	    
	    @GetMapping("/UpdateAnno.cafe")
	    public String UpdateAnno(@ModelAttribute("AnnoInfo") AnnoVO vo) {
	    	return "AboutAnno/UpdateAnno";
	    }
	    
	    @PostMapping("/UpdateAnno.cafe")
	    public String UpdateAnnoInfo(AnnoVO vo, Model model, HttpSession session) throws Exception{
	    	AnnoVO getanno = Service.getInfo(vo.getANNO_ID());
	    	model.addAttribute("AnnoInfo", getanno);
	    	
	    	//파일 저장 위치
			String Folder = "resources/Image/AnnoImage";
			String AnnoISaveFolder = session.getServletContext().getRealPath(Folder);
			//System.out.println(getanno.getANNO_IMAGE());
			
			
			//저장할 위치가 없을 경우 폴더 생성
			File dir = new File(AnnoISaveFolder);
	        if(!dir.exists()) {
	            dir.mkdirs();
	        }
		        MultipartFile uploadFile = vo.getUPLOADIMAGE();
				System.out.println(uploadFile);
		        if(uploadFile.getSize() != 0) {
			        System.out.println(uploadFile);

		        	String fileName = uploadFile.getOriginalFilename();
		        	try {
		        		File destination = new File(AnnoISaveFolder + "/" + fileName + "/" + fileName);
						uploadFile.transferTo(destination);
						String name = Folder +"/" + fileName + "/" + fileName;
						
						vo.setANNO_IMAGE(name);
					} catch (IOException e) {
						e.printStackTrace();
					}
	        	}else {
	        		vo.setANNO_IMAGE(getanno.getANNO_IMAGE());
	        	}
		    Service.updateAnno(vo);    
	    	return "AboutAnno/AnnoIsUpdate";
	    }
	    
	    @RequestMapping("/DeleteAnno.cafe")
	    public String deleteAnno(AnnoVO vo) {
	    	
	    	Service.deleteAnno(vo.getANNO_ID());
	    	return "redirect:GetAnnoList.cafe";
	    }
}
