package com.projcafe.cafe.GiftycornCafeList.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("projCafeGiftycornCafeListDAO")
public class ProjCafeGiftycornCafeListDAO extends SqlSessionDaoSupport {
	
	@Autowired
	public void setSqlSessionDaoSupport(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//create
	public void insertGiftycornCafe(ProjCafeGiftycornCafeListVO vo) {
		getSqlSession().insert("ProjCafeGiftycornCafeListDTO.insertGiftycornCafeList", vo);
	}
	
	//read
	public List<ProjCafeGiftycornCafeListVO> getGiftycornCafeList(ProjCafeGiftycornCafeListVO vo) {
		return getSqlSession().selectList("ProjCafeGiftycornCafeListDTO.getGiftycornCafeList", vo);
	}
	
	public ProjCafeGiftycornCafeListVO getGiftycornCafe(int GIFTYCORN_CLN) {
		return getSqlSession().selectOne("ProjCafeGiftycornListDTO.getGiftycornCafe", GIFTYCORN_CLN);
	}

	//Update
	public void updateGiftycornCafe(ProjCafeGiftycornCafeListVO vo) {
		getSqlSession().update("ProjCafeGiftycornCafeListDTO.updateGiftycornCafeList", vo);
	}

	//Delete
	public void deleteGiftycornCafe(int GIFTYCORN_CLN) {
		getSqlSession().delete("ProjCafeGiftycornCafeListDTO.deleteGiftycornCafeList", GIFTYCORN_CLN);
	}

	
}
