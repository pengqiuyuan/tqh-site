package com.huake.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;
import com.huake.entity.PlaceRelation;
import com.huake.service.place.PlaceRelationService;

@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class PlaceRelationServiceTest extends SpringTransactionalTestCase{

	@Autowired
	private PlaceRelationService placeRelationService;
	
	@Test
	public void getAllProvince(){
		List<PlaceRelation> pr =  placeRelationService.findAllProvince(1);
		System.out.println(pr.size());
		for(PlaceRelation p : pr){
			System.out.println(p.getName());
		}
	}
	@Test
	public void getcityByProvince(){
		List<PlaceRelation> pr =  placeRelationService.findAllCity(268);
		System.out.println(pr.size());
		for(PlaceRelation p : pr){
			System.out.println(p.getName());
		}
	}

}
