package com.dao;

import java.util.List;

import com.dto.AreaDto;

/**
 * 数据库查询BaseMapper
 * 
 * @author Administrator
 * 
 */
public interface BaseMapper {
	List<AreaDto> selectAreas();

	int insertArea(String name);

	int deleteArea(int id);

	int updateArea(AreaDto areaDto);
}
