package com.mvc.banda;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.banda.biz.BandaBiz;
import com.mvc.banda.model.vo.AccountVo;
import com.mvc.banda.model.vo.PetVo;
import com.mvc.banda.model.vo.FeedVo;
import com.mvc.banda.model.vo.FollowVo;

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
		
		String id = "user06";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);
		
		session.setAttribute("accvo", accvo);
		System.out.println("mypage_allselect");
		
		return "temp/mypagePets";
	}
	
	
	
	@RequestMapping("/change_pet.do")
	@ResponseBody
	public Map<String, PetVo> change_pet(@RequestBody int pno){
		
		System.out.println("change_pet");
		
		PetVo selectpet = biz.mypage_selectPet(pno);		
				
		Map<String, PetVo> resMap = new HashMap<String, PetVo>();
		resMap.put("petVo", selectpet);
		
		return resMap;
	}
	
	@RequestMapping(value = "/mypage_pet_update.do", method=RequestMethod.POST)
	public String mypage_pet_update(HttpServletRequest request, Model model, PetVo petVo, @RequestParam String p_birthtmp, MultipartFile updateimgInp) throws IllegalStateException, IOException {
		
		System.out.println("mypage_pet_update");
		
		Date date = null;
		
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(p_birthtmp);
			System.out.println(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		petVo.setP_birth(date);
		
		int res = biz.mypage_pet_update(petVo);
		
		///////////////////////////////////////////////
		
		String filename = updateimgInp.getOriginalFilename();
		
		System.out.println("filename : "+filename);
		
		//파일을 새로 업로드 하지 않았다면 바로 return
		if(filename == "") {
			return "redirect:mypage_allselect.do";
		}
			
		String savepath = request.getSession().getServletContext().getRealPath("resources\\images\\filemanager\\pet\\pet_profile\\"+petVo.getP_no());
		
		System.out.println(savepath);
		
		File updateimg = new File(savepath+"\\"+filename);
		
		updateimgInp.transferTo(updateimg);
		
		//파일 이름 바꿔주기 작업
		//image.jpg 가져오기
		File imagefile = new File(savepath+"\\image.jpg");
		//image.jpg 삭제
		imagefile.delete();
		//업로드한 이미지 이름 image.jpg로 바꿔서 붙혀넣기
		updateimg.renameTo(imagefile);
		//업로드한 이미지 삭제
		updateimg.delete();
		
		return "redirect:mypage_allselect.do";
	}
	
	/*
	 * 파일 관리 참고용
	 File folder = new File(newpath);

         if (!folder.exists()) {
            try{
                folder.mkdir(); //폴더 생성합니다.
                System.out.println("폴더가 생성되었습니다.");
                 } 
                 catch(Exception e){
                e.getStackTrace();
            }        
               }else {
            System.out.println("이미 폴더가 생성되어 있습니다.");
         }
	 */
	
	
	@RequestMapping(value="/mypage_pet_insert.do", method = RequestMethod.POST)
	public String mypage_pet_insert(HttpServletRequest request, Model model, PetVo petVo, @RequestParam String p_birthtmp, MultipartFile insertimgInp) throws IllegalStateException, IOException {
		
		System.out.println("mypage_pet_insert");
		
		Date date = null;
		
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(p_birthtmp);
			System.out.println(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		petVo.setP_birth(date);
		
		System.out.println(petVo);
		
		int res = biz.mypage_pet_insert(petVo);
		
		////////////////////////////////////////////////////
		
		if(res > 0) {
			
			int lastpno = biz.getLastPetSeq();
			
			System.out.println("lastpno : "+lastpno);
			
			PetVo vo = biz.mypage_selectPet(lastpno);
			
			System.out.println("vo : "+vo);
			
			String savepath = request.getSession().getServletContext().getRealPath("resources\\images\\filemanager\\pet\\pet_profile\\"+vo.getP_no());
			
			System.out.println("savepath : "+savepath);
			
			File folder = new File(savepath);

	         if (!folder.exists()) {
	            try{
	                folder.mkdir(); //폴더 생성합니다.
	                System.out.println("폴더가 생성되었습니다.");
	                 } 
	                 catch(Exception e){
	                e.getStackTrace();
	            }        
	               }else {
	            System.out.println("이미 폴더가 생성되어 있습니다.");
	         }

	         String filename = insertimgInp.getOriginalFilename();
	         
	         File insertimg = new File(savepath+"\\"+filename);
	         insertimgInp.transferTo(insertimg);
	         
	       //파일 이름 바꿔주기 작업
	 		//image.jpg 만들긴
	 		File imagefile = new File(savepath+"\\image.jpg");
	 		//업로드한 이미지 이름 image.jpg로 바꿔서 붙혀넣기
	 		insertimg.renameTo(imagefile);
	 		//업로드한 이미지 삭제
	 		insertimg.delete();

	 		
	 		return "redirect:mypage_allselect.do";
	 		
	 		
		}else {
			
			System.out.println("error : controller - mypage_pet_insert");
			
	 		return "redirect:mypage_allselect.do";

		}
		
	}
	
	@RequestMapping("/mypage_accountpage.do")
	public String mypage_accountpage(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60);
		
		String id = "user06";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);
		
		session.setAttribute("accvo", accvo);
		System.out.println("mypage_allselect");
		
		return "temp/mypageAccount";
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
		Boolean chk = true;
		
		if(vo1 == null) {
			
			chk = false;
			System.out.println("여기까지 들어옴1");
			
		}else {
			session.setAttribute("vo", vo1);
			session.setMaxInactiveInterval(60*60);
			System.out.println("여기까지 들어옴2");
		}
		
		
		Map<String, Boolean> m = new HashMap<String, Boolean>();
		m.put("chk", chk);
		System.out.println(m+"컨트롤러의 m");
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
		
		int res = biz.register(vo);
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		System.out.println("test:"+vo.getPassword());
		
		if(res>0) {
			return "redirect:login.do";
		}else {
			return "redirect:register.do";
		}
		
		
		
	
	}
	
	
	//메인 리스트 출력
	@RequestMapping("/uj_selectList.do")
	public String selectList(Model model) {
		
		
		if(session.getAttribute("vo") != null) {
			
			AccountVo vo = (AccountVo)session.getAttribute("vo");
			String id = vo.getId();
			
			System.out.println(id);
			
			System.out.println("세션존재");
			AccountVo vo1 = (AccountVo)biz.main_selectList(id);
			
			model.addAttribute("vo", vo1);
			
		} else {
			System.out.println("세션없음");
		}

		
		return "index";
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
	

//			//login
//			@ResponseBody
//			@RequestMapping(value = "/jy_login.do", method = RequestMethod.POST)
//			public Map<String, Boolean> jy_login(@RequestBody AccountVo vo) {
//				
//				AccountVo vo2 = biz.jy_login(vo);
//				Boolean chk = true;
//				
//				if(vo2==null) {
//					chk = false;
//				} else {
//					session.setAttribute("vo", vo2);
//					session.setMaxInactiveInterval(60*60);
//				}
//				
//				//System.out.println(session.getAttribute("vo"));
//				
//				Map<String, Boolean> m = new HashMap<String, Boolean>();
//				m.put("chk", chk);
//				
//				return m;
//			}
//			
//			//logout
//			@ResponseBody
//			@RequestMapping(value = "/jy_logout.do", method = RequestMethod.POST)
//			public Map<String, Boolean> jy_logout() {
//				
//				session.invalidate();
//				System.out.println("로그아웃성공");
//
//				Map<String, Boolean> m = new HashMap<String, Boolean>();
//				m.put("chk", true);
//				
//				return m;
//			}
//	
//			//메인 리스트 출력
//			@RequestMapping("/main_selectList.do")
//			public String main_selectList(Model model) {
//				
//				
//				if(session.getAttribute("vo") != null) {
//					
//					AccountVo vo = (AccountVo)session.getAttribute("vo");
//					String id = vo.getId();
//					
//					System.out.println(id);
//					
//					System.out.println("세션존재");
//					AccountVo vo2 = (AccountVo)biz.main_selectList(id);
//					
//					model.addAttribute("vo", vo2);
//					
//				} else {
//					System.out.println("세션없음");
//				}
//
//				
//				return "index";
//			}
//	
	
	
	
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
	
	//무료나눔
	@RequestMapping(value="/boardListFree_test.do")
	public String listShare(Model model) {
//		logger.info("BOARD SHARE LIST");		
		model.addAttribute("listShareNotice", biz.selectListShNotice());
		model.addAttribute("listShare", biz.selectListSh());
		return "temp/boardListFree";
	}

	//물물교환
	@RequestMapping(value="/boardListExchange_test.do")
	public String listExchange(Model model) {
//		logger.info("BOARD EXCHANGE LIST");
		model.addAttribute("listExchangeNotice", biz.selectListExNotice());
		model.addAttribute("listExchange", biz.selectListEx());
		return "temp/boardListExchange";
	}
	
	//게시글 상세
	@RequestMapping(value="/boardDetail_test.do")
	public String boardDetail(Model model, int board_no) {
//		logger.info("BOARD DETAIL");
		model.addAttribute("detail", biz.selectOneBoard(board_no));
		return "temp/boardDetail";
	}	
	
	
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
}
