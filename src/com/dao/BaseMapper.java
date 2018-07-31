package com.dao;

import java.util.List;

import com.dto.AreaDto;
import com.dto.SchoolDto;
import com.dto.StreetDto;

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

	int insertSchool(SchoolDto SchoolDto);

	int deleteSchool(int id);

	int updateSchool(SchoolDto SchoolDto);

	// 街道信息
	List<StreetDto> selectStreets();

	int deleteStreet(int id);

	List<SchoolDto> getSchools(int aid);

	int insertStreet(StreetDto streetDto);

	int updateStreet(StreetDto streetDto);

}
