package com.projcafe.cafe.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.user.repository.ProjCafeUserDAO;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;

@Service("projCafeUserService")
public class ProjCafeUserSerivceImpl implements ProjCafeUserService{
	
	@Autowired
	ProjCafeUserDAO dao;
	
	public void createInfo(ProjCafeUserVO vo) {
		dao.insertUser(vo);
	}
	public List<ProjCafeUserVO> GetInfoList(ProjCafeUserVO vo) {
		return dao.getList(vo);
	}
	public ProjCafeUserVO getInfo(String MEMBER_ID) {
		return dao.getUserInfo(MEMBER_ID);
	}
	public void updateInfo(ProjCafeUserVO vo) {
		dao.updateUserInfo(vo);
	}
	public void deleteChild(String MEMBER_ID) {
		dao.deleteUserChildData(MEMBER_ID);
	}
	public void deleteInfo(Map<String,Object> map) {
		dao.deleteUserInfo(map);
	}

}
