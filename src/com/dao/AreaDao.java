package com.dao;

import java.util.List;

import com.dto.AreaDto;

public interface AreaDao {
	public List<AreaDto> init();
	public void addArea(String name);
}
