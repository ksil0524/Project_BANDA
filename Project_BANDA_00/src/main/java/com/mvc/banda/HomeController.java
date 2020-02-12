package com.mvc.banda;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

	
	@RequestMapping("/boardDetail.do")
	public String boardDetail() {
		return "temp/boardDetail";
	}
	
	
	@RequestMapping("/boardListExchange.do")
	public String boardListExchange() {
		return "temp/boardListExchange";
	}
	
	
	@RequestMapping("/boardListFree.do")
	public String boardListFree() {
		return "temp/boardListFree";
	}
	
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "temp/boardWrite";
	}
	
	
	@RequestMapping("/mapDrugstore.do")
	public String mapDrugstore() {
		return "temp/mapDrugstore";
	}
	
	
	@RequestMapping("/mapHospital.do")
	public String mapHospital() {
		return "temp/mapHospital";
	}
	
	
	@RequestMapping("/mapPark.do")
	public String mapPark() {
		return "temp/mapPark";
	}
	
	
	@RequestMapping("/myChat.do")
	public String myChat() {
		return "temp/myChat";
	}
	
	
	@RequestMapping("/mypageAccount.do")
	public String mypageAccount() {
		return "temp/mypageAccount";
	}
	
	@RequestMapping("/mypageFeed.do")
	public String mypageFeed() {
		return "temp/mypageFeed";
	}
	
	@RequestMapping("/mypageFollw.do")
	public String mypageFollw() {
		return "temp/mypageFollw";
	}
	
	@RequestMapping("/mypagePets.do")
	public String mypagePets() {
		return "temp/mypagePets";
	}
}
