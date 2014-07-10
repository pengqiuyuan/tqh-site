package com.huake.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.huake.entity.Member;

public interface MemberDao extends PagingAndSortingRepository<Member, Long>,JpaSpecificationExecutor<Member>{

	public Member findByEmail(String email);
	public List<Member> findByEmailAndStatus(String email,Integer status);
	public List<Member> findByNickNameAndStatus(String nickName,Integer status);
	
}
