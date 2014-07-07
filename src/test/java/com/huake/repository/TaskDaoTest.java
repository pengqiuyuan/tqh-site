/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.huake.repository;

import static org.assertj.core.api.Assertions.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.Task;
import com.huake.repository.TaskDao;

@ContextConfiguration(locations = { "/applicationContext.xml" })
public class TaskDaoTest extends SpringTransactionalTestCase {

	@Autowired
	private TaskDao taskDao;

	@Test
	public void findTasksByUserId() throws Exception {
		Page<Task> tasks = taskDao.findByUserId(2L, new PageRequest(0, 100, Direction.ASC, "id"));
		assertThat(tasks.getContent()).hasSize(5);
		assertThat(tasks.getContent().get(0).getId()).isEqualTo(1);

		tasks = taskDao.findByUserId(99999L, new PageRequest(0, 100, Direction.ASC, "id"));
		assertThat(tasks.getContent()).isEmpty();
		assertThat(tasks.getContent()).isEmpty();
	}
}
