package com.huake.service.place;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.entity.PlaceRelation;
import com.huake.repository.PlaceRelationDao;

@Component
@Transactional
public class PlaceRelationService {
	
	@Autowired
	private PlaceRelationDao placeRelationDao;
	
	/**
	 * 查询所有省  自治区 或者 直辖市 
	 * @param level
	 * @return
	 */
	public List<PlaceRelation> findAllProvince(Integer level){
		return placeRelationDao.findByLevel(level);
	}
	/**
	 * 查询省  下的所有城市
	 * @param parentLevel
	 * @return
	 */
	public List<PlaceRelation> findAllCity(Integer parentLevel){
		return placeRelationDao.findByParentLevel(parentLevel);
	}
}
