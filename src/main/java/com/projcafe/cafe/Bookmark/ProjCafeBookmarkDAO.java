package com.projcafe.cafe.Bookmark;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("projCafeBookmarkDAO")
public class ProjCafeBookmarkDAO extends SqlSessionDaoSupport {
	@Autowired
	public void setSqlSessionDaoSupport(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//create
	public void createBookmark(ProjCafeBookmarkVO vo) {
		getSqlSession().insert("ProjCafeBookmarkDTO.insertBookmark", vo);
	}
	
	//read
	public List<ProjCafeBookmarkVO> readBookmark(String MEMBER_ID){
		return getSqlSession().selectList("ProjCafeBookmarkDTO.getBookmarkList", MEMBER_ID);
	}
	
	//readOne
	public ProjCafeBookmarkVO readBookmarkInfo(Map<String, Object> map) {
		return getSqlSession().selectOne("ProjCafeBookmarkDTO.getBookmarkInfo", map);
	}
	
	//update
	public void updateBookmark(ProjCafeBookmarkVO vo) {
		getSqlSession().update("ProjCafeBookmarkDTO.updateBookmark", vo);
	}
	
	//delete
	public void deleteBookmark(Map<String, Object> map) {

		getSqlSession().delete("ProjCafeBookmarkDTO.deleteBookmark", map);
	}
	
}
