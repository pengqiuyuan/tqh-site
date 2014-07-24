package com.huake.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.lang3.StringUtils;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.HasAttributeFilter;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.nodes.RemarkNode;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


//Spring Bean的标识.
@Component
//类中所有public函数都纳入事务管理的标识.
@Transactional
public class RemoteParser {

		Logger logger = LoggerFactory.getLogger(RemoteParser.class);
		
//		@Resource(name = "imageService")
//		private ImageService avatarService;
		

		
		/** 连接集合标志 */
		public static String LINK_LIST = "linkList";
		/** 标题集合标志 */
		public static String TITLE_LIST = "titleList";
		/** 单标签标志 */
		public static String SINGLE_TAG = "singleTag";
		/** 连接正则表达式 */
		public static String LINK_REGX = "<a.*href=\"(.*shtml?)\".*>(.*?)</a>";
		/** 正则表达式对象 */
		public static String TH_REGX="<th>&nbsp;</th>";
		public static String TD_REGX="<td>&nbsp;</td>";
		/*zhiyong add*/
		public Pattern pt = Pattern.compile(LINK_REGX);
		public Pattern pth = Pattern.compile(TH_REGX);
		public Pattern ptd = Pattern.compile(TD_REGX);
		
		public String parseHtmlContent(String resourceUrl,
				Map<String, String> tagMap, Map<String, String> removeTagMap,
				String encoding) {
			
			try {
				Parser parser = new Parser();
				String orginHtml = fetchFile(resourceUrl);
				parser.setInputHTML(orginHtml);
				parser.setEncoding(encoding);
				// 第一步取得指定属性/标签内容
				String tempKey = null;
				String tempValue = null;
				String[] tempValueArr = null;
				StringBuilder sb = new StringBuilder();
				NodeFilter filter = null;
				int i=0;
				for (Iterator<String> it = tagMap.keySet().iterator(); it.hasNext();) {
					i++;
					tempKey = it.next();
					tempValue = tagMap.get(tempKey);
					if (tempValue.contains("|")) {
						tempValueArr = tempValue.split("\\|");
					} else {
						tempValueArr = new String[] { tempValue };
					}
					for (String value : tempValueArr) {
						filter = populateFilter(tempKey, value);
						appendHtmlByFilter(parser, filter, sb);
					}
				}
				// 第二步过滤指定属性/标签内容
				
				String contentHtml = sb.toString();
				if(removeTagMap!=null){
				for (Iterator<String> it = removeTagMap.keySet().iterator(); it
						.hasNext();) {
					tempKey = it.next();
					tempValue = removeTagMap.get(tempKey);
					if (tempValue.contains("|")) {
						tempValueArr = tempValue.split("\\|");
					} else {
						tempValueArr = new String[] { tempValue };
					}
					for (String value : tempValueArr) {
						filter = populateFilter(tempKey, value);
						contentHtml = removeHtmlByFilter(parser, filter,
								contentHtml);
					}
				  }
				}
				// 第三步过滤注释
				filter = new NodeClassFilter(RemarkNode.class);
				contentHtml = removeHtmlByFilter(parser, filter, contentHtml);
				contentHtml=contentHtml.replace("View Game", "");
				contentHtml=contentHtml.replace("<th>v</th>", "");
				contentHtml=contentHtml.replace("<th class=\"right\">Player 1</th>", "");
				contentHtml=contentHtml.replace("<th class=\"left\">Player 2</th>", "");

				contentHtml=contentHtml.replace("<h1>Frames</h1>", "<p>场次</p>");
				contentHtml=contentHtml.replace("<h1>Points</h1>", "<p>比分</p>");
				contentHtml=contentHtml.replace("<h1>Break</h1>", "<p>Break</p>");
				//去除包含nbsp;的th tr td
				contentHtml=contentHtml.replace("<tr>&nbsp;</tr>", "");
				contentHtml=contentHtml.replace("<th>&nbsp;</th>", "");
				contentHtml=contentHtml.replace("<td>&nbsp;</td>", "");
				contentHtml=contentHtml.replace("<td colspan=\"3\">", "<td colspan=\"2\">");
				
				contentHtml=contentHtml.replace("<tr><th><span style=\"visibility:hidden;\">TableName</span></th><th class=\"right\">Player 1</th><th>v</th<th class=\"left\">Player 2</th><th class=\"left\"><a href=\"http://www.worldsnooker.livesport.tv/\"><img src=\"http://3f76916fc51b3e65f1fe-732c75fe8657c98942557ae4ad757ff6.r18.cf3.rackcdn.com/icn_tv.png\" alt=\"TV\" width=\"15\" height=\"15\"></a></th></tr>", "");
				contentHtml=contentHtml.replace("<tr><th><span style=\"visibility:hidden;\">TableName</span></th><th class=\"right\"> Player 1</th><th>v</th><th class=\"left\">Player 2</th></tr> ", "");
				
				contentHtml=contentHtml.replace("<table class=\"outer\">", "<table class=\"outer container-fluid against active\" style=\"background-color: #c7c7c7;margin-top:5px;\">");

				Document doc = Jsoup.parse(contentHtml);
				Elements links = doc.select("span[style=visibility:hidden;]").parents().parents();
				for(Element ele:links){
					ele.toString().replaceAll(ele.toString(), "");
					logger.debug("############    "+ele.html());
				}
				
				Elements colgroup = doc.select("colgroup");
				for(Element ele:colgroup){
					ele.html("");
					ele.toString().replace(ele.toString(), "");
					ele.remove();
				}
				return contentHtml;
			} catch (ParserException e) {
				logger.error("parse exception:", e);
			}
			return "";
		}
		
		
		
		
//		public Player parseBasketballPlayerContentWithQQHtml(String content, Map<String, String> needTagMap, String encoding) {
//			final Player player = new Player();
//			try{
//				Parser parser = new Parser();
//				parser.setInputHTML( StringUtil.replace(content, "&nbsp;", ""));
//				parser.setEncoding(encoding);
//				
//				NodeVisitor visitor = new NodeVisitor() {
//					@Override
//					public void visitTag(Tag tag) {
//						if (tag.getTagName().equals("DIV")) {
//							/*获取名字，位置，球队，号码*/
//							if("pt".equals(tag.getAttribute("class"))){
//								NodeList nodelist = tag.getChildren();
//	                            for (int i = 0; i < nodelist.size(); i++) {
//	                            	Node node = (Node) nodelist.elementAt(i);
//	                        		 if (node instanceof HeadingTag) {
//	                        			 HeadingTag head = (HeadingTag) nodelist.elementAt(i);
//	                        			 /*处理字符*/
//	                        			 String[] names = StringUtil.split(head.toPlainTextString().trim(), " ");
//	                        			 
//	                        			 if( names.length > 0){
//	                        				 if(names[0].indexOf("(") > 0){
//	                            				 Pattern pattern = Pattern.compile("(.*)\\((.*)\\)", Pattern.CASE_INSENSITIVE);
//	                        					 Matcher m = pattern.matcher(names[0]);
//	                        					 while(m.find()){
//	                        						 player.setName(m.group(1));
//	                        						 player.setEnName(m.group(2));
//	                        					 }
//	                        				 }else player.setName(names[0]);
//	                        				 
//	                        				 //得分后卫 | 洛杉矶湖人 | 24
//	                        				 String[] other = StringUtil.split(names[1], "|");
//	                        				 player.setPlayAs(other[0]);
//	                        				 player.setClubTeamNumber(Integer.parseInt(other[2]));
//	                        				 //TODO 关联俱乐部
//	                        				 player.setClubTeam(other[1]);
//	                        			 }
//	                        		 }
//	                        		 
//	                        		 if( node instanceof ImageTag ){
//	                        			 ImageTag avatar = (ImageTag) nodelist.elementAt(i);
//	                        			 String imageURL = avatar.getAttribute("src");
//	                        			 String finishAccessURL = avatarService.fetchImage(imageURL, ImageService.PLAYER_AVATAR);
//	                        			 player.setAvatar(finishAccessURL);
//	                        			 
//	                        		 }
//	                        		 
//	                            }
//							}
//							
//							if("pp".equals(tag.getAttribute("class"))){
//								NodeList nodelist = tag.getChildren();
//	                            for (int i = 0; i < nodelist.size(); i++) {
//	                            	Node node = (Node) nodelist.elementAt(i);
//	                            	
//	                            	if( node instanceof ImageTag ){
//			               			 	ImageTag avatar = (ImageTag) nodelist.elementAt(i);
//			               			 	String imageURL = avatar.getAttribute("src");
//			               			 	System.out.println("Image URl:>>>" + imageURL);
//			               			 	String finishAccessURL = avatarService.fetchImage(imageURL, ImageService.PLAYER_AVATAR);
//			               			 	player.setAvatar(finishAccessURL);
//		               		 		}
//	                            }
//							}
//							
//							/*获取身高，体重等*/
//							if("pileft".equals(tag.getAttribute("class"))){
//								NodeList nodelist = tag.getChildren();
//	                            for (int i = 0; i < nodelist.size(); i++) {
//	                            	Node node = (Node) nodelist.elementAt(i);
//	                        		 if (node instanceof org.htmlparser.tags.BulletList) {
//	                        			 BulletList bullet = (BulletList) nodelist.elementAt(i);
//	                        			 NodeList bullets = bullet.getChildren();
//	                        			 for (int j = 0; j < bullets.size(); j++) {
//	                        				 Node bulletNode = (Node) bullets.elementAt(j);
//	                        				 if (bulletNode instanceof org.htmlparser.tags.Bullet) {
//	                        					 Pattern pattern = Pattern.compile("(出生年月:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 Matcher m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//	                        						try{
//	                        							player.setBirth( sdf.parse(m.group(2)));
//	                        						}catch(Exception e){
//	                        							logger.error("date format exception:", e);
//	                        						}
//	                        						
//	                        					 }//end birth
//	                        					 
//	                        					 pattern = Pattern.compile("(身高:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						player.setHeight( m.group(2));
//	                        					 }//end height
//	                        					 
//	                        					 pattern = Pattern.compile("(体重:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						player.setWeight( m.group(2));
//	                        					 }//end weight
//	                        					 
//	                        					 pattern = Pattern.compile("(出生地点:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						player.setBirthplace( m.group(2));
//	                        					 }//end birthplace
//	                        					 
//	                        					 pattern = Pattern.compile("(目前年薪:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						player.setSalary( m.group(2));
//	                        					 }//end birthplace
//	                        					 
//	                        					 pattern = Pattern.compile("(毕业大学:)(.*)", Pattern.CASE_INSENSITIVE);
//	                        					 m = pattern.matcher(bulletNode.toPlainTextString().trim());
//	                        					 while (m.find()) {
//	                        						player.setUniversity( m.group(2));
//	                        					 }//end birthplace
//	                        				 }
//	                        			 }
//	                        		 }
//	                            }
//							}
//						}
//					}
//					
//				};
//				
//				parser.visitAllNodesWith(visitor);
//			}catch(Exception e){
//				logger.error("parser exception:", e);
//			}
////			logger.debug(">>>中文姓名:" + player.getName());
////			logger.debug(">>>英文姓名:" + player.getEnName());
////			logger.debug(">>>生日:" + player.getBirth());
////			logger.debug(">>>身高:" + player.getHeight());
////			logger.debug(">>>体重:" + player.getWeight());
////			logger.debug(">>>出生地点:" + player.getBirthplace());
////			logger.debug(">>>年薪:" + player.getSalary());
//			
//			return player;
//		}

		/**
		 * 组装过滤器
		 * 
		 * @param key 键
		 * @param value 值
		 * @return 过滤器
		 */
		protected NodeFilter populateFilter(String key, String value) {
			NodeFilter filter;
			if (SINGLE_TAG.equals(key)) {
				filter = new TagNameFilter(value);
				logger.debug("qqqqqqqqqqqqqqq");
			} else {
//				filter = new HasAttributeFilter(key, value);
				String[] ele=key.split("=");
				filter = new HasAttributeFilter(ele[0],ele[1]);
			}
			return filter;
		}

		/**
		 * 取得所有指定属性/标签的HTML
		 * 
		 * @param parser 解析器
		 * @param filter 过滤器
		 * @param sb
		 * @throws ParserException
		 */
		protected void appendHtmlByFilter(Parser parser, NodeFilter filter,
				StringBuilder sb) throws ParserException {
			NodeList nodes = parser.extractAllNodesThatMatch(filter);
			
			for (int i = 0; i < nodes.size(); i++) {
				Node textnode = (Node) nodes.elementAt(i);
				//sb.append(textnode.toHtml());
				
				sb.append(textnode.toHtml());
				
			}
		}

		/**
		 * 过滤指定属性标签HTML
		 * 
		 * @param parser 解析器
		 * @param filter 属性过滤器
		 * @param orginHtml 原始HTML
		 * @return 过滤后HTML
		 * @throws ParserException
		 */
		protected String removeHtmlByFilter(Parser parser, NodeFilter filter,
				String orginHtml) throws ParserException {
			parser.setInputHTML(orginHtml);
			NodeList nodes = parser.extractAllNodesThatMatch(filter);
			for (int i = 0; i < nodes.size(); i++) {
				Node textnode = (Node) nodes.elementAt(i);
				orginHtml = StringUtils.remove(orginHtml, textnode.toHtml());
			}
			return orginHtml;
		}


		protected String fetchFile(String url) {
			HttpClient httpClient = new HttpClient();
			httpClient.getHttpConnectionManager().getParams()
					.setConnectionTimeout(10000);
			GetMethod getMethod = new GetMethod(url);
		/*	getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, 5000);
			getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
					new DefaultHttpMethodRetryHandler());
			getMethod.getParams().setParameter("http.protocol.cookie-policy", CookiePolicy.BROWSER_COMPATIBILITY);
			getMethod.addRequestHeader("Content-Type", "text/html; charset=gb2312");
*/			try {
				int statusCode = httpClient.executeMethod(getMethod);
				if (statusCode != HttpStatus.SC_OK) {
					System.err.println("Method failed: "
							+ getMethod.getStatusLine());
				}
				InputStream response = getMethod.getResponseBodyAsStream();
				
				return inputStream2String(response, "gb2312");
			} catch (HttpException e) {
				System.out.println("Please check your provided http address!");
				logger.error("Http异常:\n", e);
			} catch (IOException e) {
				logger.error("网络异常:\n", e);
			}catch (Exception e) {
				logger.error("ggggggggggggg异常:\n", e);
			}
			finally {
				getMethod.releaseConnection();
			}
			return "";
		}

		private String inputStream2String(InputStream is, String encoding) throws Exception{
			BufferedReader in = new BufferedReader(new InputStreamReader(is, encoding));
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}
			return buffer.toString();
		}







	}

