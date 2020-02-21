package com.mvc.banda;

import javax.annotation.Resource;
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
import com.mvc.banda.model.vo.CommentVo;
import com.mvc.banda.model.vo.FeedNoVo;
import com.mvc.banda.model.vo.BoardVo;
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
		
		session.removeAttribute("accvo");
		
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
			PetVo vo = biz.mypage_selectPet(lastpno);
			
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
		
		session.removeAttribute("accvo");
		
		session.setMaxInactiveInterval(60*60);
		
		String id = "user06";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);
		
		session.setAttribute("accvo", accvo);
		System.out.println("mypage_allselect");
		
		return "temp/mypageAccount";
	}
	
	@RequestMapping(value="/mypage_acco_changeprofileimg.do", method = RequestMethod.POST)
	public String mypage_acco_changeprofileimg(HttpServletRequest request, Model model, @RequestParam String account_id, MultipartFile profile_img) throws IllegalStateException, IOException {
		
		
		String savepath = request.getSession().getServletContext().getRealPath("resources\\images\\filemanager\\account\\account_profile\\"+account_id);
		System.out.println("savepath : "+savepath);
		
		String filename = profile_img.getOriginalFilename();
		
		System.out.println(filename);
		
		File updateprofileimg = new File(savepath+"\\"+filename);
		System.out.println(updateprofileimg);
		profile_img.transferTo(updateprofileimg);
		
		//image.jpg 가지는 객체
		File imagefile = new File(savepath+"\\image.jpg");
		//image.jpg 삭제
		imagefile.delete();
 		//업로드한 이미지 이름 image.jpg로 바꿔서 붙혀넣기
		updateprofileimg.renameTo(imagefile);
 		//업로드한 이미지 삭제
 		updateprofileimg.delete();
 		
 		return "redirect:mypage_accountpage.do";
	}
	
	
	@RequestMapping("/mypage_accountupdate.do")
	public String mypage_accountupdate(AccountVo accvo) {
		
		System.out.println("mypage_accountupdate");
		System.out.println(accvo);
		int res = biz.mypage_accountupdate(accvo);
		
		return "redirect:mypage_accountpage.do";
	}
	
	
	@RequestMapping("/mypage_followpage.do")
	public String mypage_followpage(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("mypage_followpage");

		HttpSession session = request.getSession();
		
		session.removeAttribute("accvo");
		
		session.setMaxInactiveInterval(60*60);
		
		String id = "ADMIN";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);
		
		// 해당하는 아이디가  팔로우하고 있는 계정들 정보 리스트
		List<AccountVo> fr_acclist = biz.mypage_fr_accountSelectList(accvo.getId());
		System.out.println("fr_acclist : " + fr_acclist);

		// 해당하는 아이디를  팔로우하고 있는 계정들 정보 리스트
		List<AccountVo> fd_acclist = biz.mypage_fd_accountSelectList(accvo.getId());
		System.out.println("fd_acclist : " + fd_acclist);
		
		session.setAttribute("accvo", accvo);
		model.addAttribute("fr_acclist", fr_acclist);
		model.addAttribute("fd_acclist", fd_acclist);
		
		return "temp/mypageFollw";
		
	}
	
	@RequestMapping("/mypage_unfollow.do")
	@ResponseBody
	public Map<String, Boolean> mypage_unfollow(@RequestBody String[] idarr){
		
		System.out.println("mypage_unfollow");
		
		String fr_id = idarr[0];
		String fd_id = idarr[1];
		FollowVo fvo = new FollowVo(fr_id, fd_id);
		
		int res = biz.mypage_unfollow(fvo);

		Map<String, Boolean> resMap = new HashMap<String, Boolean>();
		
		if(res>0) {
			resMap.put("res", true);
		}else {
			resMap.put("res", false);
		}
		
		return resMap;
	}
	
	
	@RequestMapping("/mypage_follow.do")
	@ResponseBody
	public Map<String, Boolean> mypage_follow(@RequestBody String[] idarr){
		
		System.out.println("mypage_follow");
		
		String fr_id = idarr[0];
		String fd_id = idarr[1];
		FollowVo fvo = new FollowVo(fr_id, fd_id);
		
		int res = biz.mypage_follow(fvo);

		Map<String, Boolean> resMap = new HashMap<String, Boolean>();
		
		if(res>0) {
			resMap.put("res", true);
		}else {
			resMap.put("res", false);
		}
		
		return resMap;
	}
	
	@RequestMapping("/mypage_feedpage.do")
	public String mypage_feedpage(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		System.out.println("mypage_feedpage");

		HttpSession session = request.getSession();
		
		session.removeAttribute("accvo");
		
		session.setMaxInactiveInterval(60*60);
		
		String id = "user06";
		
		AccountVo accvo = biz.mypage_allselect(id);
		System.out.println(accvo);

		session.setAttribute("accvo", accvo);
		
		return "temp/mypageFeed";
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
	
	@RequestMapping("/index_search_test")
	public String index_search_test() {
		
		return null;
	}
		
	
	@RequestMapping(value="/circleheader_autosearch.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> autosearch(HttpSession session, String keyword, String searchtype){
		/*
		 * 검색어 자동완성
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200219
		*/
		System.out.println("재호 - 자동검색 데이터 확인: " + keyword + "/ " + searchtype);
		List<String> list = biz.circleheader_autosearch(keyword, searchtype);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("success", true);
		return map;
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
	public String main_selectList(Model model) {
		
		
		if(session.getAttribute("vo") != null) {
			
			AccountVo vo = (AccountVo)session.getAttribute("vo");
			String id = vo.getId();
			System.out.println("세션존재");
			
			List<FollowVo> fvo = biz.main_selectFollow(id);

			if(fvo.size() != 0) {
				System.out.println("로그인성공/ 팔로우 있음");
				
				AccountVo vo2 = (AccountVo)biz.main_selectList(id);
				//System.out.println(vo2);
				
				model.addAttribute("fvo", vo2);
				
			} else {
				
				System.out.println("로그인성공/ 팔로우 없음");
				List<FeedVo> fvo2 = biz.main_selectListN();
				
				model.addAttribute("frvo",fvo2);
			}

			
		} else {
			
			System.out.println("세션없음");
			List<FeedVo> fvo = biz.main_selectListN();
			
			model.addAttribute("frvo",fvo);
			
		}
		
		return "index";
	}
	
	//내피드리스트 가져오기
	@RequestMapping("/mypageFeed_list.do")
	public String mypageFeed_list(Model model){
		
		AccountVo vo = (AccountVo)session.getAttribute("vo");
		String id = vo.getId();
		
		List<FeedVo> fvo = biz.my_feedList(id);
		
		model.addAttribute("fvo",fvo);			
		
		return "temp/mypageFeed";
	}
	
	//다른사람피드이동
	@RequestMapping("/main_otherfeed.do")
	public String main_otherfeed(Model model, String id) {
		
		Map<String, Object> m = biz.main_otherfeed(id);
		model.addAttribute("acc",m);
		
		return "temp/otherFeed";
	}
	
	//피드 하나가져오기
	@RequestMapping(value = "/each_feed.do",  method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> each_feed(@RequestBody FeedNoVo f) {
		
		Boolean chk = false;
		
		System.out.println(f.getFeedno());
		int feedno = f.getFeedno();
		FeedVo feed = biz.each_feed(feedno);
		
		Map<String, Object> m = new HashMap<String, Object>();
		
		if(feed != null) {
			chk = true;
			m.put("chk", chk);
			m.put("feed", feed);
		} else {
			m.put("chk", chk);
		}
		return m;
	}
	
	//댓글 삽입
	@RequestMapping("/main_insert_comment.do")
	@ResponseBody
	public Map<String, Object> main_insert_comment(@RequestBody CommentVo c){
		
		Boolean chk = false;
		Map<String, Object> m = new HashMap<String, Object>();
		
		//삽입
		int res = biz.main_insert_comment(c);
		
		//가져오기
		int feedno = c.getCom_pno();
		List<CommentVo> c2 = new ArrayList<CommentVo>();
		
		c2 = biz.main_select_comment(feedno);
		
		if(res > 0) {
		
			chk = true;
			m.put("chk", chk );
			m.put("comment_list",c2);
		
		} else {
			m.put("chk", chk );
			m.put("comment_list",c2);
		}
		
		return m;
	}
	
	//댓글삭제
	@RequestMapping("/main_delete_comment.do")
	@ResponseBody
	public Map<String, Object> main_delete_comment(@RequestBody CommentVo c){
		
			
			Boolean chk = false;
			
			Map<String, Object> m = new HashMap<String, Object>();
			
			//삭제
			int res = biz.main_delete_comment(c);
			
			//리스트
			int feedno = c.getCom_pno();
			List<CommentVo> c2 = new ArrayList<CommentVo>();
			
			c2 = biz.main_select_comment(feedno);
			
			if(res>0) {
				chk = true; 
				m.put("chk", chk);
				m.put("comment_list",c2);
			} else {
				m.put("chk", chk);
				m.put("comment_list",c2);
			}
		
		return m;
	}
	
	//댓글수정
	@RequestMapping("/main_update_comment.do")
	@ResponseBody
	public Map<String, Object> main_update_comment(@RequestBody CommentVo c){
		
		Map<String, Object> m = new HashMap<String, Object>();
		Boolean chk = false;
		
		int res = biz.main_update_comment(c);
		
		int feed_no = c.getCom_pno();
		List<CommentVo> clist = biz.main_select_comment(feed_no);
		
		if(res>0) {
			
			chk = true;
			m.put("chk", chk);
			m.put("comment_list", clist);
			
		} else {
			m.put("chk", chk);
			m.put("comment_list", clist);
		}

		return m;
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
	
	@RequestMapping(value="/map_searchlist.do")
	public String map_searchlist(Model model, String city, String district, String keyword ){
		/*
		 * 검색
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200218
		*/
		
		return "";
	}
	
	@RequestMapping(value="/mapHospitalTest.do")
	public String map_searchlist(Model model){
		/*
		 * 병원 검색
		 * 
		 * @author 주희진
		 * @version 1.0
		 * @date 200219
		*/
		
		model.addAttribute("longitude","33.450701");
		model.addAttribute("latitude","126.570667");
		
		return "temp/mapHospital";
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

	//게시글을 공지로 바꾸기
	@RequestMapping(value="/boardSetNotice.do")
	public String boardSetNotice(int board_no) {
		int res = biz.boardSetNotice(board_no);
		if(res>0) {
			return "redirect:boardListFree_test.do";
		} else {
			return "redirect:boardDetail_test.do?board_no="+board_no;
		}
	}

	//공지글을 일반 게시글로 내리기
	@RequestMapping(value="/boardSetNoticeCancel.do")
	public String boardNoticeCancel(int board_no) {
		int res = biz.boardNoticeCancel(board_no);
		if(res>0) {
			return "redirect:boardListFree_test.do";
		} else {
			return "redirect:boardDetail_test.do?board_no="+board_no;
		}		
	}
	
	//게시글 폼
	@RequestMapping(value="/boardWriteForm.do")
	public String boardWriteForm(Model model, String board_cate) {
		model.addAttribute("category", board_cate);
		System.out.println("카테고리 : "+board_cate);
		
		return "temp/boardWrite";
	}
	
	//게시판 글쓰기
	@RequestMapping(value="/boardWriteRes.do", method=RequestMethod.POST)
	public String boardWrite(HttpServletRequest request, Model model, BoardVo vo, MultipartFile boardfile) throws IllegalStateException, IOException {
		System.out.println(vo);
		int res = biz.boardWrite(vo);
		
		if(res>0) {	//insert 성공시
			int boardno = biz.getLastBoardSeq();	//insert한 게시글의 시퀀스번호 갖고옴
			BoardVo vo2 = biz.selectOneBoard(boardno);	//시퀀스 번호와 게시글 번호 일치하는지 확인
			
			//저장경로 생성
			String storagePath = request.getSession().getServletContext().getRealPath("resources\\images\\filemanager\\board\\"+vo2.getBoard_no());
			
			System.out.println("저장경로 : "+storagePath);
			
			//저장경로 정보 셋팅
			File folder = new File(storagePath);	
			
			//저장경로 디렉토리가 없을 경우 생성
			if(!folder.exists()) {
				try {
					folder.mkdir();	//storagePath의 경로 생성
					System.out.println("폴더가 생성되었습니다.");
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			//올릴려는 파일의 실제 이름을 fileName에 넣는다
			String fileName = boardfile.getOriginalFilename();
			
			//저장경로에 fileName까지 셋팅
			File insertImg = new File(storagePath+"\\"+fileName);
			
			//실제 가지고온 파일을 transerTo 메소드로 저장경로에 저장
			boardfile.transferTo(insertImg);
			
			//파일 이름 바꿔주기
			File imgFile = new File(storagePath+"\\boardImg.jpg");
			
			//실제로 가지고온 파일이름을 imgFile에서 셋팅해놓은 boardImg.jpg로 변경(복붙해서 이름 변경)
			insertImg.renameTo(imgFile);
			
			//원본파일(실제로 가지고온 파일 - insertImg) 삭제
			insertImg.delete();
			
			//상세 보기로 이동
			return "redirect:boardDetail_test.do?board_no="+boardno;
			
		} else {
			System.out.println("[ERROR] BOARD WRITE");
			
			return "rediect:boardWriteForm.do";
		}
		
	}
	
	//게시글 수정 폼
	@RequestMapping(value="/boardUpdateForm.do")
	public String boardUpdateForm(Model model, int board_no) {
		model.addAttribute("detail", biz.selectOneBoard(board_no));
		
		return "temp/boardUpdate";
	}
	
	//게시글 수정
	@RequestMapping(value="/boardUpdateRes.do", method=RequestMethod.POST)
	public String boardUpdate(HttpServletRequest request, Model model, BoardVo vo, MultipartFile updateboardfile) throws IllegalStateException, IOException {
		int res = biz.boardUpdate(vo);
		
		//수정하려는 파일의 원본 이름을 가져옴
		String fileName = updateboardfile.getOriginalFilename();
		
		if(fileName == "") {
			//기존 파일과 같을 경우
			return "redirect:boardDetail_test.do?board_no="+vo.getBoard_no();
		} else {			
			String storagePath = request.getSession().getServletContext().getRealPath("resources\\images\\filemanager\\board\\"+vo.getBoard_no());
			
			
			File updateBoardImg = new File(storagePath+"\\"+fileName);
			
			updateboardfile.transferTo(updateBoardImg);
			
			//파일 이름 바꿔주기
			File imgFile = new File(storagePath+"\\boardImg.jpg");
			
			//실제로 가지고온 파일이름을 imgFile에서 셋팅해놓은 boardImg.jpg로 변경(복붙해서 이름 변경)
			updateBoardImg.renameTo(imgFile);
			
			//원본파일(실제로 가지고온 파일 - updateBoardImg) 삭제
			updateBoardImg.delete();
			
			return "redirect:boardDetail_test.do?board_no="+vo.getBoard_no();
		}
	}
	
	//게시글 삭제
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(String board_cate, int board_no) {
		System.out.println("삭제할 게시글의 카테고리 : " + board_cate);
		
		int res = biz.boardDelete(board_no);
		if(res>0 && board_cate.equals("SH")) {
			return "redirect:boardListFree_test.do";							
		} else if(res>0 && board_cate.equals("EX")) {
			return "redirect:boardListExchange_test.do";						
		} else {
			return "redirect:boardDetail_test.do?board_no="+board_no;						
		}
	}
	
	//댓글 작성
	@RequestMapping(value="/boardComWrite.do")
	public String boardComWrite(CommentVo vo, int com_pno) {
		int res = biz.boardComWrite(vo, com_pno);
		if(res>0) {
			return "redirect:boardDetail_test.do?board_no="+com_pno;			
		} else {
			return "redirect:boardDetail_test.do?board_no="+com_pno;			
		}
	}
	
	//댓글 수정
	public String boardComUpdate(CommentVo vo, int board_no) {
		int res = biz.boardComUpdate(vo);
		
		if(res>0) {
			return "redirect:boardDetail_test.do?board_no="+board_no;			
		} else {
			return "redirect:boardDetail_test.do?board_no="+board_no;			
		}
	}
	
	//댓글 삭제
	@RequestMapping(value="/boardComDelete.do")
	public String boardComDelete(int board_no, int com_no) {
		int res = biz.boardComDelete(com_no);
		
		if(res>0) {
			return "redirect:boardDetail_test.do?board_no="+board_no;			
		} else {
			return "redirect:boardDetail_test.do?board_no="+board_no;			
		}
	}
	
	// < 하나경 파트  끝 > 
	//------------------------------------------------------------------------------------------------------------------------------------
	
}
