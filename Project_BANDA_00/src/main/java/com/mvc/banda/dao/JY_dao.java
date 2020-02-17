package com.mvc.banda.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.banda.model.vo.AccountVo;
import com.mvc.banda.model.vo.CommentVo;
import com.mvc.banda.model.vo.FeedVo;
import com.mvc.banda.model.vo.FollowVo;
import com.mvc.banda.model.vo.LikesVo;

@Repository
public class JY_dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	String NAMESPACE = "JY-mapper.";
	
	//login
		public AccountVo jy_login(AccountVo vo) {
			return sqlSession.selectOne(NAMESPACE+"jy_login", vo);
		}
		
		//main_selectList -> 로그인 시 ACCOUNTVO 반환
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
			
			List<Integer> feedno =new ArrayList<Integer>();
			
			for(FeedVo v : feed_list) {
				
				List<CommentVo> c = select_comment(v.getFeed_no());
				v.setComment_list(c);
				
				List<LikesVo> l = select_like(v.getFeed_no());
				v.setLike_list(l);
				
			}		
			
			AccountVo vo = new AccountVo();
			vo.setId(id);
			vo.setFeed_list(feed_list);
			vo.setFollow_list(follow_list);
			
			return vo;
		}
		
		//main_selectListN -> 로그인이 없거나 팔로우가 없는 경우 FEEDVO 반환
		public List<FeedVo> main_selectListN() {
			
			int count = feed_count();
			
			if(count % 4 != 0) {
				count = count - (count%4);
			}
			
			List<FeedVo> feed_list = feed_list_random(count);
			
			for(FeedVo v : feed_list) {
				
				List<CommentVo> c = select_comment(v.getFeed_no());
				v.setComment_list(c);
				
				List<LikesVo> l = select_like(v.getFeed_no());
				v.setLike_list(l);
				
			}
			
			return feed_list;
		}
		
		//main_selectFollow - 로그인시 팔로우 여부 판단
		public List<FollowVo> main_selectFollow(String id){
			
			return follow_list(id);
		}
		
		//my_feedList - 내 피드가져오기
		public List<FeedVo> my_feedList(String id){
			
			int count = feed_count();
			
			List<String> list = new ArrayList<String>();
			list.add(id);
			
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("name", list);
			m.put("count", count);
			
			List<FeedVo> fvo = feed_list(m);
			
			for(FeedVo v : fvo) {
				
				List<CommentVo> c = select_comment(v.getFeed_no());
				v.setComment_list(c);
				
				List<LikesVo> l = select_like(v.getFeed_no());
				v.setLike_list(l);
			}
			
					
			return fvo;
		}

		
		///////////////////////////////////////////////////////////////////////////////////////
		//sql
		
		//follow list
		public List<FollowVo> follow_list(String id){
			
			return sqlSession.selectList(NAMESPACE+"main_selectList", id);
			
		}
		
		//feed list - follow
		public List<FeedVo> feed_list(Map<String, Object> m){
			
			return sqlSession.selectList(NAMESPACE+"main_selectList_feed", m);
		}
		
		//feed list - random
		public List<FeedVo> feed_list_random(int count){
			
			return sqlSession.selectList(NAMESPACE + "main_selectList_feed_random", count);
		}
		
		//feed count - default
		public int feed_count() {
			
			return sqlSession.selectOne(NAMESPACE + "feed_count");
		}
		
		//commnet list
		public List<CommentVo> select_comment(int feedno){
			
			return sqlSession.selectList(NAMESPACE+"select_comment", feedno);
		}
		
		//like list
		public List<LikesVo> select_like(int feedno){
			
			List<LikesVo> l = sqlSession.selectList(NAMESPACE+"select_like",feedno);
				
			return sqlSession.selectList(NAMESPACE+"select_like",feedno);
		}

}
