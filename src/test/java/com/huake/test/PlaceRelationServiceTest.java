package com.huake.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.AppVersionInfo;
import com.huake.entity.PlaceRelation;
import com.huake.entity.TqhSiteBanner;
import com.huake.service.app.AppVersionInfoService;
import com.huake.service.banner.TqhSiteBannerService;
import com.huake.service.place.PlaceRelationService;

@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class PlaceRelationServiceTest extends SpringTransactionalTestCase{

	@Autowired
	private PlaceRelationService placeRelationService;
	
	@Autowired
	private TqhSiteBannerService tqhSiteBannerService;
	
	@Autowired
	private AppVersionInfoService appVersionInfoService;
	
	@Test
	public void getAllProvince(){
		List<PlaceRelation> pr =  placeRelationService.findAllProvince(1);
		System.out.println(pr.size());
		for(PlaceRelation p : pr){
			System.out.println(p.getName());
		}
	}
	@Test
	public void getcityByProvince(){
		List<PlaceRelation> pr =  placeRelationService.findAllCity(268);
		System.out.println(pr.size());
		for(PlaceRelation p : pr){
			System.out.println(p.getName());
		}
	}

	/**
	 * 网站Banner测试
	 */
	@Test
	public void bannerTest(){
		List<TqhSiteBanner>	tb = tqhSiteBannerService.findAllBannners();
		System.out.println("长度"+tb.size());
		for(TqhSiteBanner t :tb){
			System.out.println("ID"+t.getId()+"    名字"+t.getTitle()+"   时间"+t.getSeqDate());
		}
	}
	/**
	 * 查询app下载链接
	 */
	@Test
	public void findApp(){
		System.out.println("app Android下载地址:"+appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQH_ANDROID));
		System.out.println("app IOS下载地址:"+appVersionInfoService.findApp(AppVersionInfo.APP_CATEGORY_TQH_IOS));
	}
}
