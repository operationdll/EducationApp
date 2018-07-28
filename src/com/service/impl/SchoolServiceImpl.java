package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SchoolDao;
import com.dto.SchoolDto;
import com.service.SchoolService;

@Service
public class SchoolServiceImpl implements SchoolService {
	@Autowired
	private SchoolDao schoolsDao;

	@Override
	public List<SchoolDto> init() {
		return schoolsDao.init();
	}

	public SchoolDao getSchoolsDao() {
		return schoolsDao;
	}

	public void setSchoolsDao(SchoolDao schoolsDao) {
		this.schoolsDao = schoolsDao;
	}
}
