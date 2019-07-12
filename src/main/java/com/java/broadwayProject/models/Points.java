package com.java.broadwayProject.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="points")
public class Points {

	@Id
	@GeneratedValue
	private int id;
	@Column
	private int accumulation;
	@Column
	private int rewardLimitPoint;
	
	public int getRewardLimitPoint() {
		return rewardLimitPoint;
	}
	public void setRewardLimitPoint(int rewardLimitPoint) {
		this.rewardLimitPoint = rewardLimitPoint;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccumulation() {
		return accumulation;
	}
	public void setAccumulation(int accumulation) {
		this.accumulation = accumulation;
	}
	
}
