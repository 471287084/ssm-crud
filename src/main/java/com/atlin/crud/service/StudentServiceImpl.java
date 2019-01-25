package com.atlin.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atlin.crud.beans.Student;
import com.atlin.crud.beans.StudentExample;
import com.atlin.crud.beans.StudentExample.Criteria;
import com.atlin.crud.mapper.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> getAllStudent() {
		return studentMapper.selectByExampleWithDept(null);
	}

	@Override
	public void saveStudent(Student student) {
		studentMapper.insertSelective(student);
	}

	@Override
	public boolean checkName(String stuName) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStuNameEqualTo(stuName);
		long count = studentMapper.countByExample(example);
		return count == 0;
	}

	@Override
	public Student getStudentById(Integer id) {
		return studentMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateStu(Student student) {
		studentMapper.updateByPrimaryKeySelective(student);
	}

	@Override
	public int deleteStudent(Integer id) {
		return studentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int delStuByBatch(List<Integer> delIds) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStuIdIn(delIds);
		return studentMapper.deleteByExample(example);
	}

	@Override
	public Student getStudentByName(String stuName) {
		return studentMapper.selectByNameWithDept(stuName);
	}

}
