package com.atlin.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.atlin.crud.beans.Department;
import com.atlin.crud.beans.Student;
import com.atlin.crud.mapper.DepartmentMapper;
import com.atlin.crud.mapper.StudentMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		
//		departmentMapper.insertSelective(new Department(null,"����ϵ"));
		
//		studentMapper.insertSelective(new Student(null,"÷�޷�","Ů","16332321023","myf@163.com",2));
//		
//		System.out.println(departmentMapper);
		
//		int i=0;
//		while(i<10) {
//			String str = UUID.randomUUID().toString().substring(0, 6);
//			System.out.println(str);
//			i++;
//		}
		
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		for(int i=0;i<500;i++) {
			String str = UUID.randomUUID().toString().substring(0, 6);
			mapper.insertSelective(new Student(null,str,"男","13533256421",str+"@163.com",1));
		}
		System.out.println(departmentMapper);
	}
}
