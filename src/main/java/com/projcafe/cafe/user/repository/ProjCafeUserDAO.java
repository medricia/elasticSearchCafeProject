package com.projcafe.cafe.user.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("projCafeUserDAO")
public class ProjCafeUserDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionDaoSupport(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//Create
	public void insertUser(ProjCafeUserVO vo) {
		getSqlSession().insert("ProjCafeUserDTO.insertMember", vo);
	}
	
	//(admin)유저 정보 리스트 조회
	public List<ProjCafeUserVO> getList(ProjCafeUserVO vo){
		return getSqlSession().selectList("ProjCafeUserDTO.getMemberList", vo);
	}

	//유저 정보 조회
	public ProjCafeUserVO getUserInfo(String MEMBER_ID) {
		return getSqlSession().selectOne("ProjCafeUserDTO.getMember", MEMBER_ID);
	}
	
	// 유저 정보 수정
	public void updateUserInfo(ProjCafeUserVO vo) {
		getSqlSession().update("ProjCafeUserDTO.updateMember", vo);
	}
	
	// 유저정보 삭제
	public void deleteUserInfo(Map<String,Object> map) {
		getSqlSession().delete("ProjCafeUserDTO.deleteMember", map);
	}
	public void deleteUserChildData(String MEMBER_ID) {
		getSqlSession().delete("ProjCafeUserDTO.deleteMemberReviewimage", MEMBER_ID);
		getSqlSession().delete("ProjCafeUserDTO.deleteMemberReview", MEMBER_ID);
		getSqlSession().delete("ProjCafeUserDTO.deleteMemberGiftycorn", MEMBER_ID);
	}
	
}
