package com.huake.web.controller.mgr;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.huake.entity.Member;
import com.huake.service.member.MemberService;
import com.huake.util.RemoteParser;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	private static final String CHAT_ZHIBO = "zhibo";
	
	private static final String CHAT_SILIAO = "siliao";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RemoteParser remoteParser;
	
	@Value("#{envProps.livePath}")
	private String livePath;
	
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		Member member = getCurrentMember();
		if(member == null){
			Member mem =new Member();
			model.addAttribute("member",mem);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}else{
			model.addAttribute("member",member);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}
		return "/chat/index";
	}
	
	@RequestMapping(value="liveRoom/{id}",method = RequestMethod.GET)
	public String liveRoom(Model model,@PathVariable final String id){
		Member member = getCurrentMember();
		if(member == null){
			Member mem =new Member();
			model.addAttribute("member",mem);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}else{
			model.addAttribute("member",member);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}
		
		String url=livePath+id;
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		String htmlContent="";//捕捉内容
		try {
//			htmlContent=remoteParser.parseHtmlContent(url, tagMap, null, "utf-8");
			htmlContent=remoteParser.parseHtmlContent("http://192.168.1.50/specials/test1.html", tagMap, removeMap, "utf-8");

		} catch (Exception e) {
			logger.debug("***********************************异常************");
		}
		
		model.addAttribute("htmlContent",htmlContent);
		model.addAttribute("id",id);
		return "/chat/liveRoom";
	}
	
	/**
	 * 60刷新一次比赛比分
	 */
	@RequestMapping(value="/refreshLiving",method=RequestMethod.GET,consumes="application/json", produces="application/json")
	@ResponseBody
	@ResponseStatus(value=HttpStatus.OK)
	public Map<String,String> refreshLiving(@RequestParam(value = "id", required = false) Integer id)
	{
		Map<String,String> map=new HashMap<String,String>();
		String url=livePath+id;
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		String htmlContent="";//捕捉内容
		try {
//			htmlContent=remoteParser.parseHtmlContent(url, tagMap, null, "utf-8");
			htmlContent=remoteParser.parseHtmlContent("http://192.168.1.50/specials/test1.html", tagMap, removeMap, "utf-8");

		} catch (Exception e) {
			logger.debug("***********************************异常************");
		}
		map.put("html", htmlContent);
		return map;
	}
	
	
	
	
	/**
	 * 直播聊天
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/chat2",method = RequestMethod.GET)
	public String chat(Model model) {
		Member member = getCurrentMember();
		if(member == null){
			Member mem =new Member();
			model.addAttribute("member",mem);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}else{
			model.addAttribute("member",member);
			model.addAttribute("channelName",CHAT_ZHIBO);
		}
		return "/chat/chat2";
	}
	
	@RequestMapping(value="live",method=RequestMethod.GET)
	public ModelAndView live(@RequestParam(value = "id", required = false) Integer id){

		ModelAndView mav = new ModelAndView();
		Member member = getCurrentMember();
		if(member == null){
			Member mem =new Member();
			mav.addObject("member",mem);
			mav.addObject("channelName",CHAT_ZHIBO);
		}else{
			mav.addObject("member",member);
			mav.addObject("channelName",CHAT_ZHIBO);
		}
		
		String url=livePath+id;
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		
		String htmlContent="";//捕捉内容
		try {
//			htmlContent=remoteParser.parseHtmlContent(url, tagMap, null, "utf-8");
			htmlContent=remoteParser.parseHtmlContent("http://192.168.1.50/specials/test1.html", tagMap, removeMap, "utf-8");

		} catch (Exception e) {
			logger.debug("***********************************异常************");
		}
		
		mav.addObject("htmlContent",htmlContent);
		mav.addObject("id",id);
		mav.setViewName("/chat/live");
		return mav;
	}
	/**
	 * 获取当前用户信息
	 * @return
	 */
	@ModelAttribute("currentMember")
	public Member getCurrentMember(){
		return memberService.getCurrentMember();
	}
}
