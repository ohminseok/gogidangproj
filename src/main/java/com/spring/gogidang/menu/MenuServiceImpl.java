package com.spring.gogidang.menu;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MenuMapper;
import com.spring.mapper.StoreMapper;

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

}
