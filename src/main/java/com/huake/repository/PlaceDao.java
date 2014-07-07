package com.huake.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.Place;

public interface PlaceDao extends PagingAndSortingRepository<Place, Long> , JpaSpecificationExecutor<Place>{

}
