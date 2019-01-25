package com.atlin.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlin.crud.beans.Department;
import com.atlin.crud.mapper.DepartmentMapper;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> getDepts() {
		return departmentMapper.selectByExample(null);
	}

}
