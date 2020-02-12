package com.mvc.banda;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.banda.biz.BandaBiz;
import com.mvc.banda.model.vo.AccountVo;

@Controller
public class BandaController {
	
	@Autowired
	public HttpSession session;
	
	@Autowired
	private BandaBiz biz;
	
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 김성일 파트  시작 >  
	
	
	
	
	
	// < 김성일 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 김재익 파트  시작 >  
	
	
	
	
	
	// < 김재익 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정유진 파트  시작 >  
	
	
	
	
	
	// < 정유진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정재호 파트  시작 >  
	
	
	
	
	
	// < 정재호 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 최주예 파트  시작 >  
	
			//login
			@ResponseBody
			@RequestMapping(value = "/jy_login.do", method = RequestMethod.POST)
			public Map<String, Boolean> jy_login(@RequestBody AccountVo vo) {
				
				AccountVo vo2 = biz.jy_login(vo);
				Boolean chk = true;
				
				if(vo2==null) {
					chk = false;
				} else {
					session.setAttribute("vo", vo2);
					session.setMaxInactiveInterval(60*60);
				}
				
				//System.out.println(session.getAttribute("vo"));
				
				Map<String, Boolean> m = new HashMap<String, Boolean>();
				m.put("chk", chk);
				
				return m;
			}
			
			//logout
			@ResponseBody
			@RequestMapping(value = "/jy_logout.do", method = RequestMethod.POST)
			public Map<String, Boolean> jy_logout() {
				
				session.invalidate();
				System.out.println("로그아웃성공");

				Map<String, Boolean> m = new HashMap<String, Boolean>();
				m.put("chk", true);
				
				return m;
			}
	
			//메인 리스트 출력
			@RequestMapping("/main_selectList.do")
			public String main_selectList() {
				
				if(session.getAttribute("vo") != null) {
					
					AccountVo vo = (AccountVo)session.getAttribute("vo");
					String id = vo.getId();
					
					System.out.println(id);
					
					System.out.println("세션존재");
					AccountVo vo2 = (AccountVo)biz.main_selectList(id);
					
				} else {
					System.out.println("세션없음");
				}

				
				return "index";
			}
	
	
	
	
	// < 최주예 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 주희진 파트  시작 >  
	
	
	
	
	
	// < 주희진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 하나경 파트  시작 >  
	
	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
}
