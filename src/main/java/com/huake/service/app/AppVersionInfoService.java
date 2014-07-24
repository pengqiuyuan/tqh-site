package com.huake.service.app;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.repository.AppVersionInfoDao;

@Component
@Transactional
public class AppVersionInfoService {

	@Autowired
	private AppVersionInfoDao appVersionInfoDao;
	
	/**
	 * 查询台球会APP 
	 * @param category
	 * @return
	 */
	public String findApp(String category){
		return appVersionInfoDao.findByCategoryOrderByCrtDateDesc(category).get(0).getUrl();
	}
}
