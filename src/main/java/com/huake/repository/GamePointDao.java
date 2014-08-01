package com.huake.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.GamePoint;

public interface GamePointDao extends PagingAndSortingRepository<GamePoint, Long> , JpaSpecificationExecutor<GamePoint>{

	@Modifying
	@Query("select gp from GamePoint gp where status=?1 order by tupDate desc")
	public List<GamePoint> findByStatusOrderByUpDateDesc(String status);
}
