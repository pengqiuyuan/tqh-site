package com.huake.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.huake.entity.Chat;

public interface ChatDao extends PagingAndSortingRepository<Chat, Long> , JpaSpecificationExecutor<Chat>{

}
