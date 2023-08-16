package com.projcafe.cafe.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.projcafe.cafe.menu.repository.ProjCafeMenuDAO;
import com.projcafe.cafe.menu.repository.ProjCafeMenuVO;

@Service("menuService")
public class ProjCafeMenuImpl implements ProjCafeMenu{
	
	@Autowired
	ProjCafeMenuDAO menudao;
	
	
	@Override
	public void insertCafeMenu(ProjCafeMenuVO cafe) {
		menudao.insertCafeMenu(cafe);
	}

	@Override
	public List<ProjCafeMenuVO> getCafeMenuList(int cafe_id) {
		return menudao.getCafeMenuList(cafe_id);
	}

	@Override
	public void updateCafeMenu(ProjCafeMenuVO cafe) {
		menudao.updateCafeMenu(cafe);
	}

	@Override
	public void deleteCafeMenu(int cafe_Menu_ID) {
		menudao.deleteCafeMenu(cafe_Menu_ID);
	}

	

}
