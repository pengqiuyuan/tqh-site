package com.huake.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.huake.entity.PlaceRelation;

public interface PlaceRelationDao extends PagingAndSortingRepository<PlaceRelation, Long> , JpaSpecificationExecutor<PlaceRelation>{
	public List<PlaceRelation> findByLevel(Integer level);
	public List<PlaceRelation> findByParentLevel(Integer parentLevel);
}
