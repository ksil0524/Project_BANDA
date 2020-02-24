package com.mvc.banda.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.banda.model.vo.MapVo;

@Repository
public class HJ_dao {

	//NameSpace
	private String namespace="HJ-mapper.";
	
	//SqlSession
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<String> map_autocompleteAjax(HashMap<String, String> searchMap){
		/*
		 * 검색어 자동완성
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200213
		*/
		List<String> list = new ArrayList<String>();
		
		try {
			
			list = sqlSession.selectList(namespace+"autocompleteSelect", searchMap);
			
		} catch (Exception e) {
			System.out.println("[[Error]] : map_autocompleteAjax_Dao");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MapVo> map_defaultLocationAjax(HashMap<String, String> searchMap){
		/*
		 * Map 클라이언트 행정동 기본 위치 정보 
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200221
		 */
		
		List<MapVo> list = new ArrayList<MapVo>();
		
		try {
			
			list = sqlSession.selectList(namespace+"defaultLocationSelect", searchMap);
			
		} catch (Exception e) {
			System.out.println("[[Error]] : map_defaultLocationAjax");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<MapVo> map_searchLocationAjax(HashMap<String, String> searchMap){
		/*
		 * Map 검색 위치 정보 
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200221
		 */
		
		List<MapVo> list = new ArrayList<MapVo>();
		
		try {
			
			list = sqlSession.selectList(namespace+"searchLocationSelect", searchMap);
			
		} catch (Exception e) {
			System.out.println("[[Error]] : map_searchLocationAjax");
			e.printStackTrace();
		}
		
		return list;
	}
	
}
