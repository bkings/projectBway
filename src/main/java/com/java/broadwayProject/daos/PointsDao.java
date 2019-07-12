package com.java.broadwayProject.daos;

import com.java.broadwayProject.models.Points;

public interface PointsDao {

	public void addPoints(Points p);
	public void getId();
	public void update(Points p);
	public boolean checkAccumulation(Points p);
	
}
