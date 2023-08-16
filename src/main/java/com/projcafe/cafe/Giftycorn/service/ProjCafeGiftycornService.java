package com.projcafe.cafe.Giftycorn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornDAO;
import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornVO;

@Service("projCafeGiftycornService")
public class ProjCafeGiftycornService implements GiftycornService {
	
	@Autowired
	ProjCafeGiftycornDAO dao;
	
	@Override
	public void createGiftycorn(ProjCafeGiftycornVO vo) {
		dao.insertGiftycorn(vo);
	}
	@Override
	public List<ProjCafeGiftycornVO> getGiftycornlist(ProjCafeGiftycornVO vo) {
		return dao.getGiftycornlist(vo);
	}
	@Override
	public ProjCafeGiftycornVO getGiftycornInfo(int GIFTYCORN_ID) {
		return dao.getGiftycorn(GIFTYCORN_ID);
	}
	@Override
	public List<ProjCafeGiftycornVO> getGiftycornMemberlist(String MEMBER_ID) {
		return dao.getGiftycornMemberlist(MEMBER_ID);
	}
	@Override
	public List<ProjCafeGiftycornVO> getGiftycornNotDup(String MEMBER_ID) {
		return dao.getGiftycornNotDup(MEMBER_ID);
	}
	
	@Override
	public void updateGiftycorn(ProjCafeGiftycornVO vo) {
		dao.updateGiftycorn(vo);
	}
	@Override
	public void deleteGiftycorn(int GIFTYCORN_ID) {
		dao.deleteGiftycorn(GIFTYCORN_ID);
	}
	
	
	
}
