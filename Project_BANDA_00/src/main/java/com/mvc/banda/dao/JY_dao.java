package com.mvc.banda.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.banda.model.vo.AccountVo;
import com.mvc.banda.model.vo.FeedVo;
import com.mvc.banda.model.vo.FollowVo;

@Repository
public class JY_dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	String NAMESPACE = "JY-mapper.";
	
	//login
	public AccountVo jy_login(AccountVo vo) {
		return sqlSession.selectOne(NAMESPACE+"jy_login", vo);
	}
	
	//main_selectList
	public AccountVo main_selectList(String id) {
		
		int count = feed_count();
		//System.out.println(count);
		
		List<FollowVo> follow_list = null;
		List<FeedVo> feed_list = null;
		List<String> follow_name = new ArrayList<String>();
		
		follow_list = follow_list(id);
		
		for(int i = 0; i<follow_list.size();i++) {
			follow_name.add(follow_list.get(i).getFd_id());
		}
			
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", follow_name);
		m.put("count", count);
		
		feed_list = feed_list(m);
		count = feed_list.size();
		//System.out.println(count);
		
		if(count < 4) {
			System.out.println("4개 미만의 게시물");
		}
		else if(count % 4 != 0) {
			count = count - (count%4);
		}
		
		m.put("count", count);
		
		feed_list = feed_list(m);
		
		AccountVo vo = new AccountVo();
		vo.setId(id);
		vo.setFeed_list(feed_list);
		vo.setFollow_list(follow_list);
		
		return vo;
	}
	
	//main_selectListN
	public List<FeedVo> main_selectListN() {
		
		int count = feed_count();
		
		if(count % 4 != 0) {
			count = count - (count%4);
		}
		
		return feed_list_random(count);
	}
	
	//main_selectFollow
	public List<FollowVo> main_selectFollow(String id){
		
		System.out.println(follow_list(id).size());
		
		return follow_list(id);
	}
	
	//아이디에 해당하는 followVo 반환
	public List<FollowVo> follow_list(String id){
		
		return sqlSession.selectList(NAMESPACE+"main_selectList", id);
		
	}
	
	//feed list 반환 - id o
	public List<FeedVo> feed_list(Map<String, Object> m){
		
		return sqlSession.selectList(NAMESPACE+"main_selectList_feed", m);
	}
	
	//feed list - 최신 리스트
	public List<FeedVo> feed_list_random(int count){
		
		return sqlSession.selectList(NAMESPACE + "main_selectList_feed_random", count);
	}
	
	//feed count - default
	public int feed_count() {
		
		return sqlSession.selectOne(NAMESPACE + "feed_count");
	}

}
