package com.atlin.crud.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atlin.crud.beans.Admin;
import com.atlin.crud.beans.Msg;
import com.atlin.crud.service.AdminService;

@Controller
public class AdminHandler {
	
	@Autowired
	private AdminService adminServiceImpl;
	
	
	@ResponseBody
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public Msg register(@RequestParam("name")String name,@RequestParam("password")String password) {
		String regName = "^[a-zA-Z0-9_-]{3,16}$";
		if(!name.matches(regName)) {
			return Msg.fail().add("va_msg","用户名格式不合法！");
		}
		
		boolean flag = adminServiceImpl.checkName(name);
		if(!flag) {
			return Msg.fail().add("va_msg","该用户已存在！");
		}
		
		String regPass = "^[a-z0-9_-]{6,18}$";
		if(!password.matches(regPass)) {
			return Msg.fail().add("va_msg","密码格式不合法！");
		}
		
		Admin admin = new Admin(name,password);
		int result = adminServiceImpl.addAdmin(admin);
		if(result==0) {
			return Msg.fail().add("va_msg","注册失败！");
		}
		
		return Msg.success().add("va_msg","注册成功！");
	}
	
	
	@RequestMapping(value="/index",method=RequestMethod.POST)
	public String goIndex(@RequestParam("name")String name,@RequestParam("password")String password) {
		boolean flag = adminServiceImpl.checkName(name);
		if(!flag) {
			Admin admin = adminServiceImpl.getAdmin(name);
			String userPassword = admin.getPassword();
			if(userPassword.equals(password)) {
				return "index";
			}
		}
		return "redirect:/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public Msg checkLogin(@RequestParam("name")String name,@RequestParam("password")String password) {
		String regName = "^[a-zA-Z0-9_-]{3,16}$";
		if(!name.matches(regName)) {
			return Msg.fail().add("va_msg","用户名格式不合法！");
		}
		
		boolean flag = adminServiceImpl.checkName(name);
		if(flag) {
			return Msg.fail().add("va_msg","该用户不存在！");
		}
		
		Admin admin = adminServiceImpl.getAdmin(name);
		String userPassword = admin.getPassword();
		
		if(userPassword.equals(password)) {
			return Msg.success();
		}
		
		return Msg.fail().add("va_msg","密码不正确！");
	}
	
}
