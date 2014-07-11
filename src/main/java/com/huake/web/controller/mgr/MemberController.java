package com.huake.web.controller.mgr;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.huake.entity.Member;
import com.huake.service.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final Map<String,String> map = new HashMap<String,String>();
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="index",method=RequestMethod.GET)
	private String index() throws Exception{
		
		return "/index/show";
	}
	
	@RequestMapping(value="move",method=RequestMethod.GET)
	private String move() throws Exception{
		
		return "/index/move";
	}
	/*@RequestMapping(value="/login", method = RequestMethod.GET)
	private String loginForm() throws Exception{
		//ModelAndView mav = new ModelAndView();
		//mav.setViewName("index/login");
		return "index/login";
	}*/
	/**
	 * 用户登录
	 * @return
	 * @throws IOException
	 * @throws AppBizException
	 */
	/*@RequestMapping(value="/login", method = RequestMethod.POST)
	//@ResponseBody
	//@ResponseStatus(value = HttpStatus.OK)
	private String login(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) throws Exception{
		//System.out.println("会员"+member.getEmail()+"********"+member.getPassword());
		//return memberService.login(member, redirectAttributes);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "index/login";
	}*/
	
	/**
	 * 用户注册 验证邮箱或者昵称
	 * @return
	 */
	@RequestMapping(value="/validate",method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	private Map<String,String>  vilidateEmailOrNickName(@RequestParam(value="email",required=false) String email,@RequestParam(value="nickName",required=false) String nickName) throws Exception{
		return	memberService.vilidateEmailOrNickName(email, nickName, map);
	}
	/**
	 * 会员注册
	 * @param member
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register",method = RequestMethod.POST,consumes="application/json",produces="application/json;charset=UTF-8")
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	private Map<String,String> register(@RequestBody Member member) throws Exception{
		System.out.println("开始注册"+member.getEmail()+"    " +member.getNickName()+"      "+member.getPassword());
		return memberService.register(member,map);
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
