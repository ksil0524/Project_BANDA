package com.mvc.banda.biz;

import java.util.List;

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
			
			//main_selectList
			public AccountVo main_selectList(String id) {
				
				return jy_dao.main_selectList(id);
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
	
	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
	
}
