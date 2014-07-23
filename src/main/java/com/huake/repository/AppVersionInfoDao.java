package com.huake.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.AppVersionInfo;

public interface AppVersionInfoDao extends PagingAndSortingRepository<AppVersionInfo, Long>,JpaSpecificationExecutor<AppVersionInfo>{

	public List<AppVersionInfo> findByCategoryOrderByCrtDateDesc(String category);
}
