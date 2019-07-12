package com.java.broadwayProject.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;


@Entity
@Table(name="CustomerList")
//@DynamicUpdate(true)
public class Customer {

	@Id
	@GeneratedValue
	private int id;
	@Column
	private String fname;
	@Column
	private String lname;
	@Column
	private String dob;
	@Column
	private String phone;
	@Column
	private String address;
	@Column
	private String email;
	@Column
	private String password;
	@Column
	private int numberOflogIns;
	@OneToOne
	@JoinColumn(name="points_id")
	private Points customerPoints;
	@OneToOne
	@JoinColumn(name="dateTime_id")
	private DateTime dateTime;
	
	
	public DateTime getDateTime() {
		return dateTime;
	}
	public void setDateTime(DateTime dateTime) {
		this.dateTime = dateTime;
	}
	public int getNumberOflogIns() {
		return numberOflogIns;
	}
	public void setNumberOflogIns(int numberOflogIns) {
		this.numberOflogIns = numberOflogIns;
	}
	public Points getCustomerPoints() {
		return customerPoints;
	}
	public void setCustomerPoints(Points customerPoints) {
		this.customerPoints = customerPoints;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
