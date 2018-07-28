package com.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.AreaDao;
import com.dao.BaseDao;
import com.dto.AreaDto;

@Repository
public class AreaDaoImpl implements AreaDao {
	@Autowired
	private BaseDao baseDao;

	@SuppressWarnings("unchecked")
	@Override
	public List<AreaDto> init() {
		return baseDao.getSqlMapClientTemplate().queryForList("area.getList");
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void addArea(String name) {
		baseDao.getSqlMapClientTemplate().insert("area.addArea", name);
	}
}
