package com.atlin.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlin.crud.beans.Admin;
import com.atlin.crud.beans.AdminExample;
import com.atlin.crud.beans.AdminExample.Criteria;
import com.atlin.crud.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public boolean checkName(String name) {
		AdminExample example = new AdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		long count = adminMapper.countByExample(example);
		return count==0;
	}

	@Override
	public Admin getAdmin(String name) {
		return adminMapper.selectByName(name);
	}

	@Override
	public int addAdmin(Admin admin) {
		return adminMapper.insertSelective(admin);
	}
	
	
}
