package com.mvc.banda.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.banda.dao.HJ_dao;
import com.mvc.banda.dao.JH_dao;
import com.mvc.banda.dao.JI_dao;
import com.mvc.banda.dao.JY_dao;
import com.mvc.banda.dao.NK_dao;
import com.mvc.banda.dao.SI_dao;
import com.mvc.banda.dao.UJ_dao;
import com.mvc.banda.model.vo.AccountVo;
import com.mvc.banda.model.vo.PetVo;
import com.mvc.banda.model.vo.FeedVo;
import com.mvc.banda.model.vo.FollowVo;
import com.mvc.banda.model.vo.BoardVo;
import com.mvc.banda.model.vo.CommentVo;

@Service
public class BandaBiz {
	
	@Autowired
	private HJ_dao hj_dao;
	
	@Autowired
	private JH_dao jh_dao;
	
	@Autowired
	private JI_dao ji_dao;
	
	@Autowired
	private JY_dao jy_dao;
	
	@Autowired
	private NK_dao nk_dao;
	
	@Autowired
	private SI_dao si_dao;
	
	@Autowired
	private UJ_dao uj_dao;
	
	

	//------------------------------------------------------------------------------------------------------------------------------------
	// < 김성일 파트  시작 >  
	
	public AccountVo mypage_allselect(String id) {
		
		return si_dao.mypage_allselect(id);
		
	}
	
	public PetVo mypage_selectPet(int pno) {
		
		return si_dao.pet_selectOne(pno);
		
	}
	
	public int mypage_pet_update(PetVo petVo) {
		return si_dao.pet_update(petVo);
	}
	
	
	public int mypage_pet_insert(PetVo petVo) {
		return si_dao.pet_insert(petVo);
	}
	
	
	public int getLastPetSeq() {
		return si_dao.getLastPetSeq();
	}
	
	
	// < 김성일 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 김재익 파트  시작 >  
	
	
	
	
	
	// < 김재익 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정유진 파트  시작 >  
	
	//login
	public AccountVo login(AccountVo vo) {

		
		
		return uj_dao.login(vo);
	}
	
	public int register(AccountVo vo) {
		
		
		return uj_dao.register(vo);
		
	}


	
	
	
	// < 정유진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정재호 파트  시작 >  
	
	
	
	
	
	// < 정재호 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 최주예 파트  시작 >  
	
		//login
		public AccountVo jy_login(AccountVo vo) {
			
			return jy_dao.jy_login(vo);
		}
		
		//main_selectList - 로그인시
		public AccountVo main_selectList(String id) {
			
			return jy_dao.main_selectList(id);
		}
	
		//main_selectListN - 비로그인/ 팔로우없을떄
		public List<FeedVo> main_selectListN() {
			
			return jy_dao.main_selectListN();
		}
		
		//main_selectFollow - 로그인시 팔로우 판단
		public List<FollowVo> main_selectFollow(String id) {
			return jy_dao.main_selectFollow(id);
		}
		
		//내피드가져오기
		public List<FeedVo> my_feedList(String id){
			return jy_dao.my_feedList(id);
		}
		
		//피드하나가져오기
		public FeedVo each_feed(int feedno) {
			return jy_dao.each_feed(feedno);
		}
		
		//타인 피드 가져오기
		public Map<String, Object> main_otherfeed(String id){
			return jy_dao.main_otherfeed(id);
		}
		
		//답글 가져오기
		public List<CommentVo> main_select_comment(int feedno) {
			return jy_dao.main_select_comment(feedno);
		}
		
		//댓글 삽입
		public int main_insert_comment(CommentVo c) {
			return jy_dao.main_insert_comment(c);
		}

		//댓글 삭제
		public int main_delete_comment(CommentVo c) {
			return jy_dao.main_delete_comment(c);
		}
		
		//댓글 갱신
		public int main_update_comment(CommentVo c) {
			return jy_dao.main_update_comment(c);
		}

	
	// < 최주예 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 주희진 파트  시작 >  
	public List<String> map_autocompleteAjax(String keyword){
		/*
		 * 검색어 자동완성
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200213
		*/
		
		return hj_dao.map_autocompleteAjax(keyword);
		
	}









	
	
	
	
	// < 주희진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 하나경 파트  시작 >  
	
	//무료나눔 공지목록 출력
	public List<BoardVo> selectListShNotice() {
		return nk_dao.selectListShNotice();
	}

	//무료나눔 게시글목록 출력
	public List<BoardVo> selectListSh() {
		return nk_dao.selectListSh();
	}

	//물물교환 공지목록 출력
	public List<BoardVo> selectListExNotice() {
		return nk_dao.selectListExNotice();
	}
	
	//물물교환 게시글목록 출력
	public List<BoardVo> selectListEx() {
		return nk_dao.selectListEx();
	}
	
	//게시글 상세 보기
	public BoardVo selectOneBoard(int board_no) {
		return nk_dao.selectOneBoard(board_no);
	}	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
	
}
