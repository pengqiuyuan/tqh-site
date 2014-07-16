package com.huake.service.place;

import java.util.Date;

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
	public void add(Place place){
		place.setCrtDate(new Date());
		place.setUpDate(new Date());
		place.setStatus(Place.STATUS_NOT_CHECK);
		placeDao.save(place);
	}
}
