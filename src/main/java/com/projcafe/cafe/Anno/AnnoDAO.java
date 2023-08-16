package com.projcafe.cafe.Anno;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("annoDAO")
public class AnnoDAO extends SqlSessionDaoSupport {
	@Autowired
	public void setSqlSessionDaoSupport(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertAnno(AnnoVO vo) {
		getSqlSession().insert("ProjCafeAnnoDTO.insertAnno", vo);
	}
	
	public List<AnnoVO> getAnnolist(Map<String, Object> map) {
		return getSqlSession().selectList("ProjCafeAnnoDTO.getAnnoList", map);
	}
	public List<AnnoVO> getAnnolistALL(AnnoVO vo) {
		return getSqlSession().selectList("ProjCafeAnnoDTO.getAnnoListALL", vo);
	}
	
	public AnnoVO getAnno(int ANNO_ID) {
		return getSqlSession().selectOne("ProjCafeAnnoDTO.getAnno", ANNO_ID);
	}
	
	//Update
		public void updateAnno(AnnoVO vo) {
			getSqlSession().update("ProjCafeAnnoDTO.UpdateAnno", vo);
		}

	//Delete
	public void deleteAnno(int ANNO_ID) {
		getSqlSession().delete("ProjCafeAnnoDTO.deleteAnno", ANNO_ID);
	}
	
}
