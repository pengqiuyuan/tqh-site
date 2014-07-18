package com.huake.service.banner;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.entity.TqhSiteBanner;
import com.huake.repository.TqhSiteBannerDao;

@Component
@Transactional
public class TqhSiteBannerService {

	@Autowired
	private TqhSiteBannerDao tqhSiteBannerDao;
	
	public List<TqhSiteBanner> findAllBannners(){
		return tqhSiteBannerDao.findByStatusOrderBySeqDateDesc(TqhSiteBanner.STATUS_VALIDE);
	}
	
}
