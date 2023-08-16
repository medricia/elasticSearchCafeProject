package com.projcafe.cafe.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.board.repository.ProjCafeDAO;
import com.projcafe.cafe.board.repository.ProjCafeVO;

@Service("projCafeService")
public class ProjCafeServiceImpl implements ProjCafeService{

	@Autowired
	private ProjCafeDAO cafedao;

	@Override
	public void insertCafe(ProjCafeVO cafe) {
		cafedao.insertCafe(cafe);
	}

	@Override
	public List<ProjCafeVO> getCafeList(ProjCafeVO cafe) {
		return cafedao.getCafeList(cafe);
	}

	@Override
	public List<ProjCafeVO> CafeList(Map<String, Object> map) {
		return cafedao.CafeList(map);
	}

	@Override
	public int getCafeListCount(ProjCafeVO vo) {
		return cafedao.getCafeListCount(vo);
	}
	
	@Override
	public ProjCafeVO getCafe(int CAFE_ID) {
		return cafedao.getCafe(CAFE_ID);
	}

	@Override
	public void updateCafe(ProjCafeVO cafe) {
		cafedao.updateCafe(cafe);
	}

	@Override
	public void deleteCafeTable(int CAFE_ID) {
		cafedao.deleteCafeTable(CAFE_ID);
	}
	
	//public void deleteBookmark(Map<String, Object> map) {
		//cafedao.deleteCafeBookmark(map);
	//}

	public void deleteCafe(int CAFE_ID) {
		cafedao.deleteCafe(CAFE_ID);
	}
	

}
