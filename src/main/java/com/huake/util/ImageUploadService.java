package com.huake.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;




//Spring Bean的标识.
@Component
// 类中所有public函数都纳入事务管理的标识.
@Transactional
public class ImageUploadService {

	final static Logger logger = LoggerFactory
			.getLogger(ImageUploadService.class);

	public static final String IMAGE_URL = "url";
	public static final String IMAGE_ORIGIN_URL = "origin";


	/**
	 * 用户上传头像
	 */
	public static final String IMAGE_MEMBERPIC = "member_pic";
	
	public static final String IMAGE = "tqhside";
	public static final int NUM_FIVE = 5;
	

	@Value("#{envProps.imagepath}")
	private String filePath;

	@Value("#{envProps.imgUrl}")
	private String imgUrl;
	

	/**
	 * 缩略图
	 * 
	 * @param file
	 * @param inputFileName
	 * @return
	 */
	public Map<String, String> uploadThumbnailsImage(CommonsMultipartFile file,String category) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
			StringBuilder fileName = new StringBuilder(sdf.format(new Date()));
			fileName.append(RandomUtils.get(NUM_FIVE));

			SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
			SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");

			String path = "/"+IMAGE+"/" + sdfYear.format(new Date())
					+ "/" + sdfMonth.format(new Date());

			String fullName = fileName.toString()
					+ ".origin."
					+ file.getOriginalFilename().split("\\.")[file
							.getOriginalFilename().split("\\.").length - 1];

			String fullPath = filePath + path + "/" + fullName;

			File saveFile = new File(filePath + path);

			String xsName = fileName
					.append(".xs.")
					.append(file.getOriginalFilename().split("\\.")[file
							.getOriginalFilename().split("\\.").length - 1])
					.toString();
			String xsPath = filePath + path + "/" + xsName;
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			}
			OutputStream out=new FileOutputStream(new File(fullPath));
			out.write(file.getBytes());
			
			try {
				FileOutputStream fos = new FileOutputStream(new File(fullPath));
				IOUtils.copy(file.getInputStream(), fos);

			} catch (IOException e) {
				logger.error("file upload exception:", e);
			}
			Thumbnails.of(fullPath).size(200, 200).toFile(xsPath);
			String finPath = imgUrl + path + "/" + xsName;
			String orginPath=imgUrl+path+"/"+fullName;
			Map<String, String> result = new HashMap<String, String>();
			result.put(IMAGE_URL, finPath);
			result.put(IMAGE_ORIGIN_URL, orginPath);
			return result;
		} catch (Exception e) {
			logger.error("upload  planRecord of pic fail.........");
			return null;
		}
	}


	/**
	 * 图片上传
	 * 
	 * @param file
	 * @param inputFileName
	 * @return
	 */
	public Map<String, String> uploadImage(InputStream file,
			String inputFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		StringBuilder fileName = new StringBuilder(sdf.format(new Date()));
		fileName.append(RandomUtils.get(NUM_FIVE));
		SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdfMonth = new SimpleDateFormat("MM");

		String path = "/" + IMAGE + "/" + sdfYear.format(new Date())
				+ "/" + sdfMonth.format(new Date());

		String fullName = fileName.append(".")
				.append(inputFileName.split("\\.")[1]).toString();

		String fullPath = filePath + path + "/" + fullName;

		File saveFile = new File(filePath + path);

		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}

		String finishPath = imgUrl + path + "/" + fullName;

		Map<String, String> result = new HashMap<String, String>();
		result.put(IMAGE_URL, finishPath);
		try {
			FileOutputStream fos = new FileOutputStream(new File(fullPath));
			IOUtils.copy(file, fos);

		} catch (IOException e) {
			logger.error("file upload exception:", e);
		}

		return result;
	}
}
