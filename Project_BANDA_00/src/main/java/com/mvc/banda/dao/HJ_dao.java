package com.mvc.banda.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HJ_dao {

	//NameSpace
	private String namespace="HJ-mapper.";
	
	//SqlSession
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<String> map_autocompleteAjax(String keyword){
		/*
		 * 검색어 자동완성
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200213
		*/
		List<String> list = new ArrayList<String>();
		
		try {
			
			list = sqlSession.selectList(namespace+"autocompleteSelect", keyword);
			
		} catch (Exception e) {
			System.out.println("[[Error]] : map_autocompleteAjax_Dao");
			e.printStackTrace();
		}
		
		return list;
	}
}
