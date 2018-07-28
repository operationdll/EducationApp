package com.service;

import java.util.List;

import com.dto.AreaDto;

public interface AreaService {
	public List<AreaDto> init();
	public void addArea(String name);
}
