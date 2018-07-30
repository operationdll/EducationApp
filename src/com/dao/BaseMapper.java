package com.dao;

import java.util.List;

import com.dto.AreaDto;
import com.dto.SchoolDto;

/**
 * 数据库查询BaseMapper
 * 
 * @author Administrator
 * 
 */
public interface BaseMapper {
	// 区域信息
	List<AreaDto> selectAreas();

	int insertArea(String name);

	int deleteArea(int id);

	int updateArea(AreaDto areaDto);

	// 学校信息
	List<SchoolDto> selectSchools();
}
