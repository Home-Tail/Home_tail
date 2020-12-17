package com.sist.vo;

import java.util.Date;

public class TempVO {
	private int petno, cate, kind, pwd;
	private String id, title, poster, loc, tel, content, map_x,map_y;
	public String getMap_x() {
		return map_x;
	}

	public void setMap_x(String map_x) {
		this.map_x = map_x;
	}

	public String getMap_y() {
		return map_y;
	}

	public void setMap_y(String map_y) {
		this.map_y = map_y;
	}

	private Date regdate, pdate;
	private String db_pdate;
	private int reply_count;
	

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public String getDb_pdate() {
		return db_pdate;
	}

	public void setDb_pdate(String db_pdate) {
		this.db_pdate = db_pdate;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getPwd() {
		return pwd;
	}

	public void setPwd(int pwd) {
		this.pwd = pwd;
	}

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

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
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

}