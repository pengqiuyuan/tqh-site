package com.huake.service.place;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.entity.Place;
import com.huake.repository.PlaceDao;

@Component
@Transactional
public class PlaceService {
	
	@Autowired
	private PlaceDao placeDao;
	
	/**
	 * 添加场馆
	 * @return
	 */
	public Place add(){
		return null;
	}
}
