package com.mvc.banda.dao;
import java.util.List;

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
		
		System.out.println(id);
		List<FollowVo> follow_list = null;
		
		try {
			follow_list = sqlSession.selectList(NAMESPACE+"main_selectList", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(follow_list.get(0).getFd_id());
		
		return null;
	}

}
