package com.mvc.banda.dao;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.banda.model.vo.BoardVo;

@Repository
public class NK_dao {
	private String NAMESPACE = "NK-mapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//무료나눔 게시글 목록 불러오기
	public List<BoardVo> selectListSh() {
		List<BoardVo> list = new ArrayList<BoardVo>();
			
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListSh");
		} catch(Exception e) {
			System.out.println("[ERROR] Share Board Select List");
			e.printStackTrace();
		}
			
		return list;
	}
		
	//무료나눔 공지 목록 불러오기
	public List<BoardVo> selectListShNotice() {
		List<BoardVo> list = new ArrayList<BoardVo>();
			
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListShNotice");
		} catch(Exception e) {
			System.out.println("[ERROR] Share Board Notice Select List");
			e.printStackTrace();
		}
			
		return list;
	}
	
	//물물교환 게시글 목록 불러오기
	public List<BoardVo> selectListEx() {
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListEx");
		} catch(Exception e) {
			System.out.println("[ERROR] Exchange Board Select List");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//물물교환 공지 목록 불러오기
	public List<BoardVo> selectListExNotice() {
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectListExNotice");
		} catch(Exception e) {
			System.out.println("[ERROR] Exchange Board Notice Select List");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//게시글 detail
	public BoardVo selectOneBoard(int board_no) {
		BoardVo vo = null;
		
		try {
			vo = sqlSession.selectOne(NAMESPACE+"selectOneBoard", board_no);
		} catch(Exception e) {
			System.out.println("[ERROR] Board Select One");
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//게시글을 공지로 등록하기
	public int boardSetNotice(int board_no) {
		int res = 0;
			
		try {
			res = sqlSession.update(NAMESPACE+"updateBoardToNotice", board_no);
		} catch(Exception e) {
			System.out.println("[ERROR] Board Set Board to Notice");			
			e.printStackTrace();
		}
			
		return res;
	}

	//공지글을 일반 게시글로 내리기
	public int boardNoticeCancel(int board_no) {
		int res = 0;
			
		try {
			res = sqlSession.update(NAMESPACE+"updateNoticeToBoard", board_no);
		} catch(Exception e) {
			System.out.println("[ERROR] Board Set Notice to Board");			
			e.printStackTrace();
		}
			
		return res;
	}	
}
