package com.mvc.banda.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.banda.model.vo.AccountVo;
import com.mvc.banda.model.vo.ChatVo;
import com.mvc.banda.model.vo.FeedVo;
import com.mvc.banda.model.vo.FollowVo;
import com.mvc.banda.model.vo.PetVo;

@Repository
public class SI_dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String NAMESPACE = "SI-mapper.";

	public AccountVo mypage_allselect(String id) {
		
		List<PetVo> petlist = pet_selectlist(id);
		List<FeedVo> feedlist = feed_selectlist(id);
		
		AccountVo vo = sqlSession.selectOne(NAMESPACE+"acc_selectone",id);
		vo.setPet_list(petlist);
		vo.setFeed_list(feedlist);
		
		return vo;
	}
	
	public AccountVo acc_selectone(String id) {
		
		AccountVo vo = null;
		
		try {
			vo = sqlSession.selectOne(NAMESPACE+"acc_selectone", id);			
		} catch (Exception e) {
			System.out.println("[error] : acc_selectone");
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public List<PetVo> pet_selectlist(String id){
		
		List<PetVo> list = null;
		
		try {
			
			list = sqlSession.selectList(NAMESPACE+"pet_selectlist",id);
			
		} catch (Exception e) {
			System.out.println("[error] : pet_selectlist");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<FeedVo> feed_selectlist(String id){
		
		List<FeedVo> list = null;
		
		try {
			
			list = sqlSession.selectList(NAMESPACE+"feed_selectlist", id);
			
		} catch (Exception e) {
			System.out.println("[error] : feed_selectlist");
			e.printStackTrace();		
		}
		
		return list;
	}
	
	public List<ChatVo> chat_selectlist(String id){
		return null;
	}
	
	public List<FollowVo> follow_selectlist(String id){
		return null;
	}

	public PetVo pet_selectOne(int p_no) {

		PetVo pet = null;
		
		try {
			
			pet = sqlSession.selectOne(NAMESPACE+"pet_selectOne", p_no);
			
		} catch (Exception e) {
			System.out.println("[error] : pet_selectOne");
			e.printStackTrace();	
		}
		
		return pet;
	}
	
	
	
}
