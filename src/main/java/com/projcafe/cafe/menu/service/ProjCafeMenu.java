package com.projcafe.cafe.menu.service;

import java.util.List;

import com.projcafe.cafe.menu.repository.ProjCafeMenuVO;

public interface ProjCafeMenu {

	public void insertCafeMenu(ProjCafeMenuVO cafe);
	public void updateCafeMenu(ProjCafeMenuVO cafe);
	public void deleteCafeMenu(int cafe_Menu_ID);
	public List<ProjCafeMenuVO> getCafeMenuList(int cafe_id);
	
}
