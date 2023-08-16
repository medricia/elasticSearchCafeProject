package com.projcafe.cafe.menu.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjCafeMenuDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertCafeMenu(ProjCafeMenuVO cafe) {
		mybatis.insert("CafeMenuDAO.insertCafeMenu", cafe);
	}

	
	public List<ProjCafeMenuVO> getCafeMenuList(int cafe_id) {
		return mybatis.selectList("CafeMenuDAO.getCafeMenuList", cafe_id);
	}

	
	public void updateCafeMenu(ProjCafeMenuVO cafe) {
		mybatis.update("CafeMenuDAO.updateCafeMenu",cafe);
		
	}

	
	public void deleteCafeMenu(int cafe_Menu_ID) {
		mybatis.delete("CafeMenuDAO.deleteCafeMenu",cafe_Menu_ID);
		
	}
	
	
}
