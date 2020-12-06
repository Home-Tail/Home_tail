package com.sist.vo;
import java.util.*;
/*
 *	replyno	NUMBER		NOT NULL,
	petno	NUMBER		NULL,
	board_no	NUMBER		NOT NULL,
	clno	NUMBER		NULL,
	id	VARCHAR2(255)		NOT NULL,
	regdate	DATE		NOT NULL,
	rdate	DATE		NULL,
	loc	VARCHAR2(1000)		NULL,
	maploc	VARCHAR2(1000)		NULL,
	group_id	NUMBER		NOT NULL,
	group_step	NUMBER		NOT NULL,
	group_tap	NUMBER		NOT NULL,
	root	NUMBER		NOT NULL,
	depth	NUMBER		NOT NULL
	
 */
public class ReplyVO {
	private int replyno,petno,board_no,clno,group_id,group_step,group_tap,root,depth,cate;
	private String id,loc,maploc,content;
	private Date regdate,rdate;
	private String db_regdate;
	
	
	public String getDb_regdate() {
		return db_regdate;
	}
	public void setDb_regdate(String db_regdate) {
		this.db_regdate = db_regdate;
	}
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public int getPetno() {
		return petno;
	}
	public void setPetno(int petno) {
		this.petno = petno;
	}
	public int getBoard_no() {
		return board_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getClno() {
		return clno;
	}
	public void setClno(int clno) {
		this.clno = clno;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tap() {
		return group_tap;
	}
	public void setGroup_tap(int group_tap) {
		this.group_tap = group_tap;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getCate() {
		return cate;
	}
	public void setCate(int cate) {
		this.cate = cate;
	}
	
}
