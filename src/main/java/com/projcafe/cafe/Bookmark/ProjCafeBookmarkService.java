package com.projcafe.cafe.Bookmark;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Service;

@EnableAspectJAutoProxy(proxyTargetClass = true)
@Service
public class ProjCafeBookmarkService {
	@Autowired
	ProjCafeBookmarkDAO dao;
	
	public void createBookmark(ProjCafeBookmarkVO vo) {
		dao.createBookmark(vo);
	}
	public List<ProjCafeBookmarkVO> getBookmark(String MEMBER_ID) {
		return dao.readBookmark(MEMBER_ID);
	}
	public ProjCafeBookmarkVO getBookmarkInfo(Map<String, Object> map) {
		return dao.readBookmarkInfo(map);
	}
	
	public void updateBookmark(ProjCafeBookmarkVO vo) {
		dao.updateBookmark(vo);
	}
	public void deleteBookmark(Map<String, Object> map) {
		dao.deleteBookmark(map);
	}
	
	
}
