package com.huake.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.TqhSiteBanner;

public interface TqhSiteBannerDao extends PagingAndSortingRepository<TqhSiteBanner, Long>,JpaSpecificationExecutor<TqhSiteBanner>{

	/**
	 * 获取所有Banner
	 * @param status
	 * @return
	 */
	public List<TqhSiteBanner> findByStatusOrderBySeqDateDesc(String status);
}
