package com.huake.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.Member;

public interface MemberDao extends PagingAndSortingRepository<Member, Long>,JpaSpecificationExecutor<Member>{
	
	public Member findByEmail(String email);
	public Member findByEmailAndStatus(String email,Integer status);
	public Member findByNickNameAndStatus(String nickName,Integer status);
}
