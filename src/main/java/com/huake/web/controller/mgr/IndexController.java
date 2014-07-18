package com.huake.web.controller.mgr;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.huake.entity.TqhSiteBanner;
import com.huake.service.banner.TqhSiteBannerService;

@Controller
@RequestMapping(value = "/index")
public class IndexController {

	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private TqhSiteBannerService tqhSiteBannerService;
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		List<TqhSiteBanner> banners = tqhSiteBannerService.findAllBannners();
		mav.addObject("banners",banners);
		mav.setViewName("index/index");
		return mav;
	}
}
