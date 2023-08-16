package com.projcafe.cafe.GiftycornCafeList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListDAO;
import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;
import com.projcafe.cafe.user.repository.ProjCafeUserVO;

@Service("projCafeGiftycornCafeListService")
public class ProjCafeGiftycornCafeListService implements GiftycornCafeListService {
	
	@Autowired
	ProjCafeGiftycornCafeListDAO dao;
	
	@Override
	public void createGiftycornCafeList(ProjCafeGiftycornCafeListVO vo) {
		dao.insertGiftycornCafe(vo);
	}
	@Override
	public List<ProjCafeGiftycornCafeListVO> getGiftycornCafeList(ProjCafeGiftycornCafeListVO vo) {
		return dao.getGiftycornCafeList(vo);
	}
	@Override
	public ProjCafeGiftycornCafeListVO getGiftycornCafeInfo(int GIFTYCORN_CLN) {
		return dao.getGiftycornCafe(GIFTYCORN_CLN);
	}
	@Override
	public void updateGiftycornCafeList(ProjCafeGiftycornCafeListVO vo) {
		dao.updateGiftycornCafe(vo);
	}
	@Override
	public void deleteGiftycornCafeList(int GIFTYCORN_CLN) {
		dao.deleteGiftycornCafe(GIFTYCORN_CLN);
	}
	
}
