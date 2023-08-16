package com.projcafe.cafe.Giftycorn.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;

@Repository("projCafeGiftycornDAO")
public class ProjCafeGiftycornDAO extends SqlSessionDaoSupport {
	
	@Autowired
	public void setSqlSessionDaoSupport(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//create
	public void insertGiftycorn(ProjCafeGiftycornVO vo) {
		System.out.println("DAO CLN: "+vo.getGIFTYCORN_CLN());
		getSqlSession().insert("ProjCafeGiftycornDTO.insertGiftycorn", vo);
	}
	
	//read
	public List<ProjCafeGiftycornVO> getGiftycornlist(ProjCafeGiftycornVO vo) {
		return getSqlSession().selectList("ProjCafeGiftycornDTO.getGiftycornList", vo);
	}
	
	public List<ProjCafeGiftycornVO> getGiftycornMemberlist(String MEMBER_ID) {
		return getSqlSession().selectList("ProjCafeGiftycornDTO.getGiftycornMEMBERList", MEMBER_ID);
	}
	public List<ProjCafeGiftycornVO> getGiftycornNotDup(String MEMBER_ID) {
		return getSqlSession().selectList("ProjCafeGiftycornDTO.getGiftycornCafeNotDup", MEMBER_ID);
	}
	
	
	public ProjCafeGiftycornVO getGiftycorn(int GIFTYCORN_ID) {
		return getSqlSession().selectOne("ProjCafeGiftycornDTO.getGiftycorn", GIFTYCORN_ID);
	}
	
	//Update
	public void updateGiftycorn(ProjCafeGiftycornVO vo) {
		getSqlSession().update("ProjCafeGiftycornDTO.updateGiftycorn", vo);
	}

	//Delete
	public void deleteGiftycorn(int GIFTYCORN_ID) {
		getSqlSession().delete("ProjCafeGiftycornDTO.deleteGiftycorn", GIFTYCORN_ID);
	}
	
}
