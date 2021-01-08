package com.spring.gogidang.menu;

import java.util.ArrayList;

import com.spring.gogidang.store.StoreVO;

public interface MenuService {

	public ArrayList<MenuVO> getMenuList();
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO);
	public int insertMenu(MenuVO menuVO);
	
	
}
