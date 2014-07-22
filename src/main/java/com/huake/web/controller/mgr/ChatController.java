package com.huake.web.controller.mgr;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huake.entity.Member;
import com.huake.service.member.MemberService;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	private static final String CHAT_ZHIBO = "zhibo";
	
	private static final String CHAT_SILIAO = "siliao";
	
	@Autowired
	private MemberService memberService;
	
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
	
	@RequestMapping(value="liveRoom",method = RequestMethod.GET)
	public String liveRoom(){
		return "/chat/liveRoom";
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
	
	/**
	 * 获取当前用户信息
	 * @return
	 */
	@ModelAttribute("currentMember")
	public Member getCurrentMember(){
		return memberService.getCurrentMember();
	}
}
