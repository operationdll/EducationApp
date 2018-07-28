package com.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.BaseDao;
import com.dao.SchoolDao;
import com.dto.SchoolDto;

@Repository
public class SchoolDaoImpl implements SchoolDao {
	@Autowired
	private BaseDao baseDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<SchoolDto> init() {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("id", id);
//		return baseDao.getSqlMapClientTemplate().queryForList("school.init",
//				map);
		return baseDao.getSqlMapClientTemplate().queryForList("school.init");
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
}
