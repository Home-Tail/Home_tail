package com.sist.vo;
/*
 * 	이름       널?       유형             
	-------- -------- -------------- 
	PETNO    NOT NULL NUMBER         
	ID       NOT NULL VARCHAR2(255)  
	TITLE    NOT NULL VARCHAR2(255)  
	CATE     NOT NULL NUMBER         
	KIND     NOT NULL NUMBER         
	SUB_KIND NOT NULL NUMBER         
	POSTER   NOT NULL CLOB           
	SEX               VARCHAR2(255)  
	AGE               NUMBER         
	WEIGHT            VARCHAR2(30)   
	COLOR             VARCHAR2(100)  
	POINT             VARCHAR2(1000) 
	REGDATE  NOT NULL DATE           
	PDATE    NOT NULL DATE           
	LOC      NOT NULL VARCHAR2(1000) 
	MAPLOC            VARCHAR2(2000) 
	TEL      NOT NULL VARCHAR2(100)  
	CONTENT           CLOB    
 */
import java.util.*;
public class ReportVO {
		private int petno,cate,kind,sub_kind,age;
		private String id,title,poster,sex,weight,color,point,loc,maploc,tel,content;
		private Date regdate,pdate;
		
		public int getPetno() {
			return petno;
		}
		public void setPetno(int petno) {
			this.petno = petno;
		}
		public int getCate() {
			return cate;
		}
		public void setCate(int cate) {
			this.cate = cate;
		}
		public int getKind() {
			return kind;
		}
		public void setKind(int kind) {
			this.kind = kind;
		}
		public int getSub_kind() {
			return sub_kind;
		}
		public void setSub_kind(int sub_kind) {
			this.sub_kind = sub_kind;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getPoster() {
			return poster;
		}
		public void setPoster(String poster) {
			this.poster = poster;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getWeight() {
			return weight;
		}
		public void setWeight(String weight) {
			this.weight = weight;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public String getPoint() {
			return point;
		}
		public void setPoint(String point) {
			this.point = point;
		}
		public String getLoc() {
			return loc;
		}
		public void setLoc(String loc) {
			this.loc = loc;
		}
		public String getMaploc() {
			return maploc;
		}
		public void setMaploc(String maploc) {
			this.maploc = maploc;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public Date getPdate() {
			return pdate;
		}
		public void setPdate(Date pdate) {
			this.pdate = pdate;
		}
		
}




