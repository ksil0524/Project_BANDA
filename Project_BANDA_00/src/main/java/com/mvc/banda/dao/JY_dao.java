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
		
		List<FollowVo> follow_list = null;
		List<FeedVo> feed_list = null;
		List<String> follow_name = new ArrayList<String>();
		
		follow_list = follow_list(id);
		
		for(int i = 0; i<follow_list.size();i++) {
			follow_name.add(follow_list.get(i).getFd_id());
		}
			
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("name", follow_name);
			
		feed_list = feed_list(m);
			
		AccountVo vo = new AccountVo();
		vo.setId(id);
		vo.setFeed_list(feed_list);
			
		//System.out.println(vo);
		
		return vo;
	}
	
	//아이디에 해당하는 followVo 반환
	public List<FollowVo> follow_list(String id){
		
		return sqlSession.selectList(NAMESPACE+"main_selectList", id);
		
	}
	
	//feed list 반환
	public List<FeedVo> feed_list(Map<String, Object> m){
		
		return sqlSession.selectList(NAMESPACE+"main_selectList_feed", m);
	}

}
