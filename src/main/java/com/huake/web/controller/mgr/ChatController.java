package com.huake.web.controller.mgr;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.huake.entity.GamePoint;
import com.huake.entity.Member;
import com.huake.entity.PlayAgainst;
import com.huake.service.live.GamePointService;
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
	
	@Autowired
	private GamePointService gamePointService;
	
	/**
	 * 60刷新一次比赛比分
	 */
	@RequestMapping(value="/refreshLiving",method=RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value=HttpStatus.OK)
	public Map<String,String> refreshLiving(@RequestParam(value="url",required=false) final String url){
		Map<String,String> map=new HashMap<String,String>();
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		String htmlContent="";//捕捉内容
		try {
			htmlContent=remoteParser.parseHtmlContent(url, tagMap, removeMap, "utf-8");
			htmlContent = remoteParser.instructHtml(remoteParser.playList(htmlContent));
		} catch (Exception e) {
			logger.debug("***********************************异常************");
		}
		map.put("html", htmlContent);
		return map;
	}
	
	@RequestMapping(value="live",method=RequestMethod.GET)
	public ModelAndView live(){
		ModelAndView mav = new ModelAndView();
		List<PlayAgainst> listPa = new ArrayList<PlayAgainst>();
		Member member = getCurrentMember();
		if(member == null){
			Member mem =new Member();
			mav.addObject("member",mem);
			mav.addObject("channelName",CHAT_ZHIBO);
		}else{
			mav.addObject("member",member);
			mav.addObject("channelName",CHAT_ZHIBO);
		}
		GamePoint gamePoint = gamePointService.findByStatusOrderByUpDateDesc(GamePoint.STATUS_VALID);
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		
		String htmlContent="";//捕捉内容
		try {
			htmlContent=remoteParser.parseHtmlContent(gamePoint.getUrl(), tagMap, removeMap, "utf-8");
			listPa = remoteParser.playList(htmlContent);
		} catch (Exception e) {
			logger.debug("***********异常************");
		}
		mav.addObject("listPa",listPa);
		mav.addObject("gamePoint",gamePoint);
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
