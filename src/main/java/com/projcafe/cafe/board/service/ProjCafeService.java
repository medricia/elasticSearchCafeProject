package com.projcafe.cafe.board.service;

import java.util.List;
import java.util.Map;

import com.projcafe.cafe.board.repository.ProjCafeVO;

public interface ProjCafeService {

	public void insertCafe(ProjCafeVO cafe);
	public List<ProjCafeVO> getCafeList(ProjCafeVO cafe);
	public List<ProjCafeVO> CafeList(Map<String, Object> map);
	public ProjCafeVO getCafe(int cafe_ID);
	public void updateCafe(ProjCafeVO cafe);
	public void deleteCafe(int cafe_ID);
	//public void deleteBookmark(Map<String, Object> map);
	public void deleteCafeTable(int CAFE_ID);
	int getCafeListCount(ProjCafeVO vo);
}
