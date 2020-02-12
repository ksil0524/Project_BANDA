package com.mvc.banda;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.banda.biz.BandaBiz;
import com.mvc.banda.model.vo.AccountVo;

@Controller
public class BandaController {
	
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
	
	
	
	
	
	// < 정유진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 정재호 파트  시작 >  
	
	
	
	
	
	// < 정재호 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 최주예 파트  시작 >  
	
	
	
	
	
	// < 최주예 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 주희진 파트  시작 >  
	
	@RequestMapping(value="/autocompleteAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> autocompleteAjax(HttpSession session, String value){
		
		/* Test Code */
		System.out.println("검색어 value: " + value);
		
		List<String> list = new ArrayList<String>(); 
		list.add("1"); 
		list.add("2");
		list.add("3");
		 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("success", true);
		/* Test Code */
		
		return map;
	}
	
	
	
	
	// < 주희진 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	//------------------------------------------------------------------------------------------------------------------------------------
	// < 하나경 파트  시작 >  
	
	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
}
