package com.huake.web.controller.mgr;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.huake.entity.Member;
import com.huake.entity.Place;
import com.huake.entity.PlaceDetail;
import com.huake.entity.PlaceRelation;
import com.huake.service.member.MemberService;
import com.huake.service.place.PlaceRelationService;
import com.huake.service.place.PlaceService;
import com.huake.util.ImageUploadService;

@Controller
@RequestMapping(value="/place")
public class PlaceController{
	
	public static final Logger logger = LoggerFactory.getLogger(PlaceController.class);
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private ImageUploadService imageService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PlaceRelationService placeRelationService;
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public String index(){
		return "/place/placeForm";
	}
	
	@RequestMapping(value = "/save",method = RequestMethod.POST)
	public String add(Place place,
			@RequestParam("fileInput_pic") List<CommonsMultipartFile> fileInputs){
		// 上传普通图片
		if (null != fileInputs) {
			for (CommonsMultipartFile fileInput : fileInputs) {
				if (fileInput != null
						&& fileInput.getOriginalFilename() != null
						&& !fileInput.getOriginalFilename().equals("")) {
					Map<String, String> result = imageService
							.uploadThumbnailsImage(fileInput, null);
					PlaceDetail pdetail = new PlaceDetail();
					pdetail.setEntry("pic");
					pdetail.setValue(result.get("url"));
					pdetail.setCrtDate(new Date());
					place.getPlaceDetails().add(pdetail);
				}
			}
		}
		placeService.add(place);
		return  "redirect:/index";
	}
	
	
	/**
	 * 获取当前用户信息
	 * @return
	 */
	@ModelAttribute("currentMember")
	public Member getCurrentMember(){
		return memberService.getCurrentMember();
	}
	/**
	 * 获取所有省 直辖市 或者 自治区
	 * @return
	 */
	@ModelAttribute("province")
	public List<PlaceRelation> getALlProvince(){
		return placeRelationService.findAllProvince(PlaceRelation.LEVEL_1);
	}
	@RequestMapping(value="/city",method = RequestMethod.GET)
	@ResponseBody
	@ResponseStatus(value = HttpStatus.OK)
	private List<PlaceRelation>  findCityOfProvince(@RequestParam(value="parentLevel",required=false) Integer parentLevel) throws Exception{
		return placeRelationService.findAllCity(parentLevel);
	}
}
