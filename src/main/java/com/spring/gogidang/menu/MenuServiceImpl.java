package com.spring.gogidang.menu;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.gogidang.store.StoreVO;
import com.spring.mapper.MenuMapper;

@Service("menuService") 
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MenuVO> getMenuList() {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		ArrayList<MenuVO> menuList = new ArrayList<MenuVO>();
		menuList = menuMapper.getMenues();
		return menuList;
	}
	
	@Override
	public ArrayList<MenuVO> selectMenu(MenuVO menuVO) {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		ArrayList<MenuVO> menuSelectList = new ArrayList<MenuVO>();
		menuSelectList = menuMapper.selectMenu(menuVO);
		return menuSelectList;
	}
	
	@Override
	public int insertMenu(MenuVO menuVO) {
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		int res = menuMapper.insertMenu(menuVO);
		return res;
	}

}
