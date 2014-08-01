package com.huake.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.jsoup.select.Evaluator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.huake.entity.PlayAgainst;


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
				Document doc = Jsoup.parse(contentHtml);
				Elements tables = doc.select("table.outer");
				Elements colgroups = doc.select("colgroup");
				colgroups.remove();
				for(Element el :tables){
					Element firstTr = el.getElementsByTag("tr").first();
					Element lastTr = el.getElementsByTag("tr").last();
					firstTr.remove();
					lastTr.remove();
				}
				return tables.toString();
			} catch (ParserException e) {
				logger.error("parse exception:", e);
			}
			return "";
		}
		
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
		/**
		 * 将页面中的对阵信息取出封装
		 * @param html
		 * @return
		 */
		public List<PlayAgainst> playList(String html){
			List<PlayAgainst> list = new ArrayList<PlayAgainst>();
			Document doc = Jsoup.parse(html);
			Elements tables = doc.select("table.outer");
			for(Element el :tables){
				PlayAgainst pa = new PlayAgainst();
				String playerOneName = el.getElementsByTag("img").first().attr("alt");
				String playerTwoName = el.getElementsByTag("img").last().attr("alt");
				String playerOnePic = el.getElementsByTag("img").first().attr("src");
				String playerTwoPic = el.getElementsByTag("img").last().attr("src");
				String playerOneNum = el.getElementsByClass("frames").first().text().toString();
				String playerTwoNum = el.getElementsByClass("frames").last().text().toString();
				String playerOneCore = el.getElementsByClass("points").first().text().toString();
				String playerTwoCore = el.getElementsByClass("points").last().text().toString();
				String playerOneBreak = el.getElementsByClass("breaks").first().text().toString();
				String playerTwoBreak = el.getElementsByClass("breaks").last().text().toString();
				pa.setPlayerOneName(playerOneName);
				pa.setPlayerTwoName(playerTwoName);
				pa.setPlayerOnePic(playerOnePic);
				pa.setPlayerTwoPic(playerTwoPic);
				pa.setPlayerOneNum(playerOneNum);
				pa.setPlayerTwoNum(playerTwoNum);
				pa.setPlayerOneCore(playerOneCore);
				pa.setPlayerTwoCore(playerTwoCore);
				pa.setPlayerOneBreak(playerOneBreak);
				pa.setPlayerTwoBreak(playerTwoBreak);
				list.add(pa);
			}
			return list;
		}
		/**
		 * 60秒刷新比分表进行html组装
		 * @param list
		 * @return
		 */
		public String instructHtml(List<PlayAgainst> list){
			String html="";
			for(PlayAgainst pa : list){
				 html += "<li class='active' style='background-color: #c7c7c7;margin-top:5px;max-height:110px;'>"+
              			"<a href='#'>"+
          				"<div class='container-fluid against'>"+
          					"<div class='row' style='max-height:56px;'>"+
          						"<div class='col-xs-3 col-sm-3 col-md-3' style='max-height:56px;'>"+
          							"<p><img src='"+pa.getPlayerOnePic()+"'class='player_thunm'></p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='against_head'>"+pa.getPlayerOneCore()+"</p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='against_head'>：</p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='against_head'>"+pa.getPlayerTwoCore()+"</p>"+
          						"</div>"+
          						"<div class='col-xs-3 col-sm-3 col-md-3'>"+
          							"<p><img src='"+pa.getPlayerTwoPic()+"' class='player_thunm'></p>"+
          						"</div>"+
          						"</div>"+
          						"<div class='row' style='max-height:10px;'>"+
          						"<div class='col-xs-3 col-sm-3 col-md-3'>"+
          							"<p class='against_foot'>"+pa.getPlayerOneName()+"</p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='against_foot'>("+pa.getPlayerOneNum()+")</p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='turn_num against_foot'>"+pa.getPlayerOneBreak()+" break "+pa.getPlayerTwoBreak()+"</p>"+
          						"</div>"+
          						"<div class='col-xs-2 col-sm-2 col-md-2'>"+
          							"<p class='against_foot'>("+pa.getPlayerTwoNum()+")</p>"+
          						"</div>"+
          						"<div class='col-xs-3 col-sm-3 col-md-3'>"+
          							"<p class='against_foot'>"+pa.getPlayerTwoName()+"</p>"+
          						"</div>"+
          					"</div>"+
          				"</div>"+
					"</a>"+
				"</li>"	;
			}
			return html;
		}
	}

