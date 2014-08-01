package com.huake.web.controller.mgr;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.huake.entity.AppVersionInfo;
import com.huake.service.app.AppVersionInfoService;

@Controller
@RequestMapping(value="/app/**")
public class AppController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final Map<String,String> map = new HashMap<String,String>();
	
	@Autowired
	private AppVersionInfoService appVersionInfoService;
	
	/**
	 * 台球会客户端下载
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="tqh",method=RequestMethod.GET)
	private ModelAndView tqhAPP() throws Exception{
		ModelAndView mav= new ModelAndView();
		String iosUrl = appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQH_IOS);
		String androidUrl = appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQH_ANDROID);
		mav.addObject("iosUrl",iosUrl);
		mav.addObject("androidUrl", androidUrl);
		mav.setViewName("app/tqh");
		return mav;
	}
	/**
	 * 踢球视界客户端下载
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="tqsj",method=RequestMethod.GET)
	private ModelAndView tqsjAPP() throws Exception{
		ModelAndView mav= new ModelAndView();
		String iosUrl = appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQSJ_IOS);
		String androidUrl = appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQSJ_ANDROID);
		mav.addObject("iosUrl",iosUrl);
		mav.addObject("androidUrl", androidUrl);
		mav.setViewName("app/tqsj");
		return mav;
	}
	
}
