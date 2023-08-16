package com.projcafe.cafe.Giftycorn.service;

import java.util.List;

import com.projcafe.cafe.Giftycorn.repository.ProjCafeGiftycornVO;

public interface GiftycornService {

	void createGiftycorn(ProjCafeGiftycornVO vo);

	List<ProjCafeGiftycornVO> getGiftycornlist(ProjCafeGiftycornVO vo);

	ProjCafeGiftycornVO getGiftycornInfo(int GIFTYCORN_ID);
	public List<ProjCafeGiftycornVO> getGiftycornMemberlist(String MEMBER_ID);
	void updateGiftycorn(ProjCafeGiftycornVO vo);

	void deleteGiftycorn(int GIFTYCORN_ID);

	List<ProjCafeGiftycornVO> getGiftycornNotDup(String MEMBER_ID);

}