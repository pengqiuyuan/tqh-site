package com.huake.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.Member;

public interface MemberDao extends PagingAndSortingRepository<Member, Long>,JpaSpecificationExecutor<Member>{
	
	Member findByEmail(String email);
	Member findByEmailAndStatus(String email,Integer status);
}
