package com.atlin.crud.beans;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	// 返回状态码 200-成功 500-失败
	private int code;
	// 返回成功或失败的消息
	private String message;
	// 封装用户数据
	private Map<String, Object> extend = new HashMap<>();

	public Msg add(String key, Object value) {
		this.getExtend().put(key, value);
		return this;
	}

	public static Msg success() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMessage("处理成功！");
		return result;
	}

	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(500);
		result.setMessage("处理失败！");
		return result;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
