package com.atlin.crud.service;

import java.util.List;

import com.atlin.crud.beans.Student;

public interface StudentService {
	List<Student> getAllStudent();
	
	void saveStudent(Student student);

	boolean checkName(String stuName);

	Student getStudentById(Integer id);

	void updateStu(Student student);

	int deleteStudent(Integer id);

	int delStuByBatch(List<Integer> delIds);

	Student getStudentByName(String stuName);

}
