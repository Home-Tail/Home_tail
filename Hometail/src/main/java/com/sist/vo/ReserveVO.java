package com.sist.vo;
import java.util.*;
public class ReserveVO {
	private int resno;
	private int clno;
	private String id;
	private Date resdate;
	private String owner;
	private String pname;
	private String content;
	public final int getResno() {
		return resno;
	}
	public final void setResno(int resno) {
		this.resno = resno;
	}
	public final int getClno() {
		return clno;
	}
	public final void setClno(int clno) {
		this.clno = clno;
	}
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
	}
	public final Date getResdate() {
		return resdate;
	}
	public final void setResdate(Date resdate) {
		this.resdate = resdate;
	}
	public final String getOwner() {
		return owner;
	}
	public final void setOwner(String owner) {
		this.owner = owner;
	}
	public final String getPname() {
		return pname;
	}
	public final void setPname(String pname) {
		this.pname = pname;
	}
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	
}
