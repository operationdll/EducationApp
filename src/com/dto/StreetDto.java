package com.dto;

import java.io.Serializable;

public class StreetDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private int aid;
	private String aName;
	private int sid;
	private String sName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAName() {
		return aName;
	}

	public void setAName(String name) {
		aName = name;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSName() {
		return sName;
	}

	public void setSName(String name) {
		sName = name;
	}

}
