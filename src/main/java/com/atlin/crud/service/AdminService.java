package com.atlin.crud.service;

import com.atlin.crud.beans.Admin;

public interface AdminService {
	boolean checkName(String name);

	Admin getAdmin(String name);

	int addAdmin(Admin admin);
}
