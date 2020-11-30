package com.sist.vo;

/*
 * 
 * 이름       널?       유형            
	-------- -------- ------------- 
	ID       NOT NULL VARCHAR2(255) 
	PASSWORD NOT NULL VARCHAR2(255) 
	NAME     NOT NULL VARCHAR2(50)
 */
public class MemberVO {
	private String id;
	private String password;
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
