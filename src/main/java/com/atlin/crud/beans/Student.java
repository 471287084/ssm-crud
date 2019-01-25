package com.atlin.crud.beans;

import javax.validation.constraints.Pattern;

public class Student {
	private Integer stuId;

	@Pattern(regexp = "(^[A-Za-z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})", message = "用户名格式不合法！")
	private String stuName;

	private String gender;

	@Pattern(regexp = "^[0-9]{11,11}$", message = "电话号码不合法！")
	private String phone;

	@Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$", message = "邮箱不合法！")
	private String email;

	private Integer deptId;

	private Department department;

	public Student() {
		super();
	}

	public Student(Integer stuId, String stuName, String gender, String phone, String email, Integer deptId) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.deptId = deptId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName == null ? null : stuName.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuName=" + stuName + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", deptId=" + deptId + ", department=" + department + "]";
	}

}