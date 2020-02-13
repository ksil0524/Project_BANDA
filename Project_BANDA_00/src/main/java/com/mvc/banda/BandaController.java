package com.mvc.banda;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/mypage_allselect.do")
	public String mypage_allselect(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60);
		
		String id = "bomi";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);
		
		session.setAttribute("accvo", accvo);
		System.out.println("mypage_allselect");
		
		return "temp/mypagePets";
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
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	//login
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public Map<String, Boolean> login(@RequestBody AccountVo vo) {
		
		AccountVo vo1 = biz.login(vo);
		Boolean chk = false;
		
		if(passwordEncoder.matches(vo.getPassword(), vo1.getPassword())) {
			session.setAttribute("login", vo1);
			session.setMaxInactiveInterval(60*60);
			chk = true;
			
		} 
		
		
		Map<String, Boolean> m = new HashMap<String, Boolean>();
		m.put("chk", chk);
		
		return m;
	}
	
	//logout
	@ResponseBody
	@RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public Map<String, Boolean> logout() {
		
		session.invalidate();
		System.out.println("로그아웃성공");

		Map<String, Boolean> m = new HashMap<String, Boolean>();
		m.put("chk", true);
		
		return m;
	}
	
	
	@RequestMapping("/register.do")
	public String register(AccountVo vo) {
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		System.out.println("test:"+vo.getPassword());
		
		if(biz.register(vo)>0) {
			return "redirect:login.do";
		}else {
			return "redirect:";
		}
		
		
		
	
	}
	
	


	
	
	
	
	// < 정유진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정재호 파트  시작 >  
	
	@RequestMapping("/search_feedlist.do")
	public String search_feedlist() {
		
		return "index";
	}
	
	
	
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
	
	@RequestMapping(value="/map_autocompleteAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> map_autocompleteAjax(HttpSession session, String keyword){
		/*
		 * 검색어 자동완성
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200213
		*/
		
		/* Test Code */
		System.out.println("검색어 value: " + keyword);
		
		List<String> list = biz.map_autocompleteAjax(keyword); 
		/*
		 * list.add("1"); list.add("2"); list.add("3");
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("success", true);
		/* Test Code end*/
		
		return map;
	}
	
	
	
	
	// < 주희진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 하나경 파트  시작 >  
	
	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
}
