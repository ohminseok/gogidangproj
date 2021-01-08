package com.spring.mapper;

import java.util.ArrayList;

import com.spring.gogidang.menu.MenuVO;
import com.spring.gogidang.store.StoreVO;

public interface MenuMapper {
	
	public ArrayList<MenuVO> getMenues();
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO);
	public int insertMenu(MenuVO menuVO);
	

}
