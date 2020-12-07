package com.sist.vo;

import java.util.Date;

public class Center_reserveVO {
	private int no;
	private String id; 
	private String name;
	private String loc;
	private String tel;
	private String lotno_addr;
	private String roadno_addr;
	private Date reserve_day;
	private String db_reserve_day;
	private Date regdate;
	private String check_msg;
	private String time;
	
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getReserve_day() {
		return reserve_day;
	}

	public void setReserve_day(Date reserve_day) {
		this.reserve_day = reserve_day;
	}

	public String getDb_reserve_day() {
		return db_reserve_day;
	}

	public void setDb_reserve_day(String db_reserve_day) {
		this.db_reserve_day = db_reserve_day;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getCheck_msg() {
		return check_msg;
	}

	public void setCheck_msg(String check_msg) {
		this.check_msg = check_msg;
	}

}
