package com.projcafe.cafe.GiftycornCafeList.service;

import java.util.List;

import com.projcafe.cafe.GiftycornCafeList.repository.ProjCafeGiftycornCafeListVO;

public interface GiftycornCafeListService {

	void createGiftycornCafeList(ProjCafeGiftycornCafeListVO vo);

	List<ProjCafeGiftycornCafeListVO> getGiftycornCafeList(ProjCafeGiftycornCafeListVO vo);

	ProjCafeGiftycornCafeListVO getGiftycornCafeInfo(int GIFTYCORN_CLN);

	void updateGiftycornCafeList(ProjCafeGiftycornCafeListVO vo);

	void deleteGiftycornCafeList(int GIFTYCORN_CLN);

}