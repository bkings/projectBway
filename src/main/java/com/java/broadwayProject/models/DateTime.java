package com.java.broadwayProject.models;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LoginDateTime")
public class DateTime {

	@Id
	@GeneratedValue
	private int id;
	@Column
	private String loginDateTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginDateTime() {
		return loginDateTime;
	}

	public void setLoginDateTime(String loginDateTime) {
		this.loginDateTime = loginDateTime;
	}

}
