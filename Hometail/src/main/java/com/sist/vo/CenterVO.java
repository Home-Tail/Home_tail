package com.sist.vo;
/*
 * 이름             널? 유형            
	-------------- -- ------------- 
	NO                NUMBER(38)    
	CLASSIFICATION    NUMBER(38)    
	LOC               VARCHAR2(26)  
	NAME              VARCHAR2(200) 
	TEL               VARCHAR2(150) 
	POST              NUMBER(38)    
	LOTNO_ADDR        VARCHAR2(200) 
	ROADNO_ADDR       VARCHAR2(200) 
	WGS84_X           NUMBER(38,8)  
	WGS84_Y           NUMBER(38,7)  
 * 
 */
public class CenterVO {
	private int no;
	private int classification;
	private String loc;
	private String name;
	private String tel;
	private int post;
	private String lotno_addr;
	private String roadno_addr;
	private int wgs84_x;
	private int wgs84_y;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getClassification() {
		return classification;
	}
	public void setClassification(int classification) {
		this.classification = classification;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getLotno_addr() {
		return lotno_addr;
	}
	public void setLotno_addr(String lotno_addr) {
		this.lotno_addr = lotno_addr;
	}
	public String getRoadno_addr() {
		return roadno_addr;
	}
	public void setRoadno_addr(String roadno_addr) {
		this.roadno_addr = roadno_addr;
	}
	public int getWgs84_x() {
		return wgs84_x;
	}
	public void setWgs84_x(int wgs84_x) {
		this.wgs84_x = wgs84_x;
	}
	public int getWgs84_y() {
		return wgs84_y;
	}
	public void setWgs84_y(int wgs84_y) {
		this.wgs84_y = wgs84_y;
	}
	
	
}
