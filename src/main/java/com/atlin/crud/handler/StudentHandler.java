package com.atlin.crud.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atlin.crud.beans.Msg;
import com.atlin.crud.beans.Student;
import com.atlin.crud.service.StudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class StudentHandler {

	@Autowired
	private StudentService studentServiceImpl;
	
	@ResponseBody
	@RequestMapping(value="/stuByName",method=RequestMethod.GET)
	public Msg getSearchStu(@RequestParam("stuName")String stuName) {
		
		String regName = "(^[A-Za-z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!stuName.matches(regName)) {
			return Msg.fail().add("va_msg","用户名格式不合法！");
		}
		
		boolean flag = studentServiceImpl.checkName(stuName);
		if(flag) {
			return Msg.fail().add("va_msg","该用户不存在！");
		}
		
		Student student = studentServiceImpl.getStudentByName(stuName);
		return Msg.success().add("student",student);
	}
	
	
	@ResponseBody
	@RequestMapping(value="stu/{stuIds}",method=RequestMethod.DELETE)
	public Msg delSudent(@PathVariable("stuIds")String stuIds) {
		if(stuIds.contains("-")) {
			List<Integer> delIds = new ArrayList<>();
			String[] ids = stuIds.split("-");
			for(String id : ids) {
				delIds.add(Integer.parseInt(id));
			}
			studentServiceImpl.delStuByBatch(delIds);
			return Msg.success();
		} else {
			Integer id = Integer.parseInt(stuIds);
			int delCount = studentServiceImpl.deleteStudent(id);
			return Msg.success();
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/stu/{stuId}",method=RequestMethod.PUT)
	public Msg updateStu(@Valid Student student,BindingResult result,@PathVariable("stuId")Integer id) {
		if(result.hasErrors()) {
			Map<String,Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError : errors) {
				map.put(fieldError.getField(),fieldError.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors",map);
		}else {
			studentServiceImpl.updateStu(student);
			return Msg.success();
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/stu/{id}",method=RequestMethod.GET)
	public Msg getStu(@PathVariable("id")Integer id) {
		Student student = studentServiceImpl.getStudentById(id);
		return Msg.success().add("student",student);
	}
	
	@ResponseBody
	@RequestMapping(value="/stuName",method=RequestMethod.POST)
	public Msg checkName(@RequestParam("stuName")String stuName) {
		
		String regName = "(^[A-Za-z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!stuName.matches(regName)) {
			return Msg.fail().add("va_msg","用户名格式不合法！");
		}
		
		boolean flag = studentServiceImpl.checkName(stuName);
		if(flag) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg","该用户名已存在！");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="stu",method=RequestMethod.POST)
	public Msg saveStudent(@Valid Student student,BindingResult result) {
		if(result.hasErrors()) {
			Map<String,Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError : errors) {
				map.put(fieldError.getField(),fieldError.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors",map);
		}else {
			//数据库中名字字段加了唯一性约束，插入前进行判断，名字已存在则不插入（最后的判断）
			boolean flag = studentServiceImpl.checkName(student.getStuName());
			if(flag) {
				studentServiceImpl.saveStudent(student);
				return Msg.success();
			}else {
				return Msg.fail().add("va_msg","该用户名已存在！");
			}
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/stus", method = RequestMethod.GET)
	public Msg getStusWithJson(@RequestParam(value = "pn", defaultValue = "0") Integer pn) {
		
		PageHelper.startPage(pn, 10);
		List<Student> stus = studentServiceImpl.getAllStudent();
		PageInfo pageInfo = new PageInfo(stus, 5);
		
		return Msg.success().add("pageInfo",pageInfo);
	}
	

//	@RequestMapping(value = "/stus", method = RequestMethod.GET)
//	public String getStus(@RequestParam(value = "pn", defaultValue = "0") Integer pn, Map<String, Object> map) {
//		PageHelper.startPage(pn, 10);
//		List<Student> stus = studentServiceImpl.getAllStudent();
//
//		PageInfo pageInfo = new PageInfo(stus, 5);
//		map.put("pageInfo", pageInfo);
//
//		return "list";
//	}
}
