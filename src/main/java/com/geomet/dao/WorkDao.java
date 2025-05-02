package com.geomet.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.geomet.domain.Work;

@Repository
public interface WorkDao {
	List<Work> getInventoryStatusList(Work work);
	void insertinventoryStatus(Work work);
}
