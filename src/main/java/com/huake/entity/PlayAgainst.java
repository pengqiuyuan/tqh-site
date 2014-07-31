package com.huake.entity;
/**
 * 直播间比分表
 * @author zhenghongwei
 *
 */
public class PlayAgainst {

	/**
	 * one代表playerOne  two代表playTwo
	 */
	public static final String 	BREAK_ONE="one";
	public static final String 	BREAK_TWO="two";
	private String playerOneName;
	private String playerTwoName;
	private String PlayerOneNum;
	private String PlayerTwoNum;
	private String playerOnePic;
	private String playerTwoPic;
	private String playerOneCore;
	private String playerTwoCore;
	private String playerOneBreak;
	private String playerTwoBreak;
	public String getPlayerOneName() {
		return playerOneName;
	}
	public void setPlayerOneName(String playerOneName) {
		this.playerOneName = playerOneName;
	}
	public String getPlayerTwoName() {
		return playerTwoName;
	}
	public void setPlayerTwoName(String playerTwoName) {
		this.playerTwoName = playerTwoName;
	}
	public String getPlayerOneNum() {
		return PlayerOneNum;
	}
	public void setPlayerOneNum(String playerOneNum) {
		PlayerOneNum = playerOneNum;
	}
	public String getPlayerTwoNum() {
		return PlayerTwoNum;
	}
	public void setPlayerTwoNum(String playerTwoNum) {
		PlayerTwoNum = playerTwoNum;
	}
	public String getPlayerOnePic() {
		return playerOnePic;
	}
	public void setPlayerOnePic(String playerOnePic) {
		this.playerOnePic = playerOnePic;
	}
	public String getPlayerTwoPic() {
		return playerTwoPic;
	}
	public void setPlayerTwoPic(String playerTwoPic) {
		this.playerTwoPic = playerTwoPic;
	}
	public String getPlayerOneCore() {
		return playerOneCore;
	}
	public void setPlayerOneCore(String playerOneCore) {
		this.playerOneCore = playerOneCore;
	}
	public String getPlayerTwoCore() {
		return playerTwoCore;
	}
	public void setPlayerTwoCore(String playerTwoCore) {
		this.playerTwoCore = playerTwoCore;
	}
	public String getPlayerOneBreak() {
		return playerOneBreak;
	}
	public void setPlayerOneBreak(String playerOneBreak) {
		this.playerOneBreak = playerOneBreak;
	}
	public String getPlayerTwoBreak() {
		return playerTwoBreak;
	}
	public void setPlayerTwoBreak(String playerTwoBreak) {
		this.playerTwoBreak = playerTwoBreak;
	}
	public static String getBreakOne() {
		return BREAK_ONE;
	}
	public static String getBreakTwo() {
		return BREAK_TWO;
	}
	
}
