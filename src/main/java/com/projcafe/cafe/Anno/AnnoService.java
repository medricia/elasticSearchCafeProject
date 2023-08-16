package com.projcafe.cafe.Anno;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.review.repository.ProjCafeReviewVO;


@Service
public class AnnoService {
	  @Autowired
	    private AnnoDAO dao;

	    public void CreateAnno(AnnoVO vo) {
	        dao.insertAnno(vo);
	    }
	    
	    public List<AnnoVO> GetInfoList(Map<String, Object> map) {
			return dao.getAnnolist(map);
		}
	    
	    public List<AnnoVO> getALLList(AnnoVO vo){
	    	return dao.getAnnolistALL(vo);
	    }
		public AnnoVO getInfo(int ANNO_ID) {
			return dao.getAnno(ANNO_ID);
		}
		
		public void updateAnno(AnnoVO vo) {
			dao.updateAnno(vo);
			
		}
		public void deleteAnno(int ANNO_ID) {
			dao.deleteAnno(ANNO_ID);
		}
		
	    
}
