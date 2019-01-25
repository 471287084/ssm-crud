package com.atlin.crud.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atlin.crud.beans.Msg;
import com.atlin.crud.service.DepartmentService;


@Controller
public class DepartmentHandler {
	@Autowired
	private DepartmentService departmentServiceImpl;
	
	@ResponseBody
	@RequestMapping(value="/depts",method=RequestMethod.GET)
	public Msg selectAllDept() {
		return Msg.success().add("depts",departmentServiceImpl.getDepts());
	}
}
