package com.huake.service.live;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.huake.entity.GamePoint;
import com.huake.repository.GamePointDao;

@Component
@Transactional
public class GamePointService {

	@Autowired
	private GamePointDao gamePointDao;
	
	public GamePoint findByStatusOrderByUpDateDesc(String status){
		List<GamePoint>  list= gamePointDao.findByStatusOrderByUpDateDesc(GamePoint.STATUS_VALID);
		Assert.notEmpty(list);
		return list.get(0);
	}
	
}