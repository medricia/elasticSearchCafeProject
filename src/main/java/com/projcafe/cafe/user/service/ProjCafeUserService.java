package com.projcafe.cafe.user.service;

import java.util.List;
import java.util.Map;

import com.projcafe.cafe.user.repository.ProjCafeUserVO;

public interface ProjCafeUserService {

	void createInfo(ProjCafeUserVO vo);
	List<ProjCafeUserVO> GetInfoList(ProjCafeUserVO vo);
	ProjCafeUserVO getInfo(String MEMBER_ID);
	void updateInfo(ProjCafeUserVO vo);
	void deleteInfo(Map<String,Object> map);
	void deleteChild(String MEMBER_ID);
}