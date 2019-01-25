<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>校园通讯录管理页面</title>
<% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.1.0.min.js"></script>
<!-- 引入bootstrap -->
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- 显示搜索结果的模态框 -->
	<div class="modal fade" id="showSearchResultModal" tabindex="-1" role="dialog" aria-labelledby="showSearchResultModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">学生信息</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	        
	          <div class="form-group">
			    <label for="showSearchResult_stuId_input" class="col-sm-3 control-label">学号：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_stuId_input"></p>
			    </div>
			  </div>
	        
			  <div class="form-group">
			    <label for="showSearchResult_stuName_input" class="col-sm-3 control-label">姓名：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_stuName_input"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="showSearchResult_gender_input" class="col-sm-3 control-label">性别：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_gender_input"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="showSearchResult_phone_input" class="col-sm-3 control-label">电话：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_phone_input"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="showSearchResult_email_input" class="col-sm-3 control-label">Email：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_email_input"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="showSearchResult_deptId_input" class="col-sm-3 control-label">系别：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="showSearchResult_deptId_input"></p>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="searchResult_update_stu_btn">编辑</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 搜索学生的模态框 -->
	<div class="modal fade" id="searchStudnetModal" tabindex="-1" role="dialog" aria-labelledby="searchStudnetModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">查找学生</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <input type="text" style="display: none" />
			  <div class="form-group">
			    <label for="stuName_search_input" class="col-sm-3 control-label">姓名：</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" name="stuName" id="stuName_search_input" placeholder="学生姓名">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="search_stu_btn">搜索</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 修改学生信息模态框 -->
	<div class="modal fade" id="updateStudnetModal" tabindex="-1" role="dialog" aria-labelledby="updateStudnetModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">更新学生信息</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	        
			  <div class="form-group">
			    <label for="stuName_update_input" class="col-sm-3 control-label">姓名：</label>
			    <div class="col-sm-7">
			      <p class="form-control-static" id="stuName_update_input"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="gender_update_input" class="col-sm-3 control-label">性别：</label>
			    <div class="col-sm-7">
			      <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender1_update_input" value="男" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender2_update_input" value="女"> 女
				  </label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="phone_update_input" class="col-sm-3 control-label">电话：</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" name="phone" id="phone_update_input" placeholder="电话号码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="email_update_input" class="col-sm-3 control-label">Email：</label>
			    <div class="col-sm-7">
			      <input type="email" class="form-control" name="email" id="email_update_input" placeholder="电子邮箱">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="deptId_update_select" class="col-sm-3 control-label">系别：</label>
			    <div class="col-sm-7">
			      <select class="form-control" name="deptId" id="deptId_update_select">
				  </select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="update_stu_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	

	<!-- 添加学生的模态框 -->
	<div class="modal fade" id="addStudnetModal" tabindex="-1" role="dialog" aria-labelledby="addStudnetModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="addStudnetModalLabel">添加学生</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	        
			  <div class="form-group">
			    <label for="stu_add_input" class="col-sm-3 control-label">姓名：</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" name="stuName" id="name_add_input" placeholder="学生姓名">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="gender_add_input" class="col-sm-3 control-label">性别：</label>
			    <div class="col-sm-7">
			      <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender1_add_input" value="男" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender2_add_input" value="女"> 女
				  </label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="phone_add_input" class="col-sm-3 control-label">电话：</label>
			    <div class="col-sm-7">
			      <input type="text" class="form-control" name="phone" id="phone_add_input" placeholder="电话号码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="email_add_input" class="col-sm-3 control-label">Email：</label>
			    <div class="col-sm-7">
			      <input type="email" class="form-control" name="email" id="email_add_input" placeholder="电子邮箱">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="deptId_add_select" class="col-sm-3 control-label">系别：</label>
			    <div class="col-sm-7">
			      <select class="form-control" name="deptId">
				  </select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="save_stu_btn">添加</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>班级通讯录管理页面</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8" align="right">
			
				<button id="search_stu_modal_btn" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span>
					查找学生
				</button>
				&nbsp;&nbsp;
				<button id="add_stu_modal_btn" class="btn btn-success">
					<span class="glyphicon glyphicon-plus"></span>
					新增学生
				</button>
				&nbsp;&nbsp;
				<button class="btn btn-danger" id="batchDelBtn">
					<span class="glyphicon glyphicon-remove"></span>
					批量删除
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 15px">
			<div class="col-md-12">
				<table id="stuTable" class="table table-hover ">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAllItem"></th>
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>邮箱</th>
							<th>系别</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div id="page_info" class="col-md-6"></div>
			<div id="page_nav" class="col-md-6" align="right"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var dataPageCount;//记录总的页数，用于添加学生后跳转到最后
			var currentPage;
			
			to_page(1);
			
			function to_page(pn){
				$.ajax({
					url: "${APP_PATH}/stus",
					data: "pn="+pn,
					type: "GET",
					success:function(result){
						$("#checkAllItem").prop("checked",false);
						build_student_table(result);
						build_page_info(result);
						build_page_nav(result);
					}
				});
			}
			//查询所有学生信息并显示到表格中
			function build_student_table(result){
				$("#stuTable tbody").empty();
				var stus = result.extend.pageInfo.list;
				$.each(stus,function(index,stu){
					var checkTd = $("<td></td>").append("<input type='checkbox' class='check_item'>");
					var stuIdTd = $("<td></td>").append(stu.stuId);
					var stuNameTd = $("<td></td>").append(stu.stuName);
					var stuGenderTd = $("<td></td>").append(stu.gender);
					var stuPhoneTd = $("<td></td>").append(stu.phone);
					var stuEmailTd = $("<td></td>").append(stu.email);
					var stuDeptNameTd = $("<td></td>").append(stu.department.departmentName);
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm updateBtn")
														.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
														.append("编辑")
														.attr("edit-id",stu.stuId);
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn")
													   .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
													   .append("删除")
													   .attr("del-id",stu.stuId);
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
					
					var stuTr = $("<tr></tr>").append(checkTd)
											  .append(stuIdTd)
											  .append(stuNameTd)
											  .append(stuGenderTd)
										      .append(stuPhoneTd)
											  .append(stuEmailTd)
											  .append(stuDeptNameTd)
											  .append(btnTd);
					$("#stuTable tbody").append(stuTr);
				});
			}
			//构建页数和记录数的显示框
			function build_page_info(result){
				$("#page_info").empty();
				console.log(result);
				var pageInfo = result.extend.pageInfo;
				dataPageCount = pageInfo.total;
				currentPage = pageInfo.pageNum;
				$("#page_info").append("当前页数："+pageInfo.pageNum+" 总页数："+pageInfo.pages+" 总记录数："+pageInfo.total);
			}
			//构建上一页下一页等的显示框
			function build_page_nav(result){
				$("#page_nav").empty();
				var pageInfo = result.extend.pageInfo;
				
				var nav = $("<nav></nav>").attr("aria-label","Page navigation");
				var navUl = $("<ul></ul>").addClass("pagination");
				
				var navFirstLi = $("<li></li>").append($("<a></a>").append("首页"));
				var navPreLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
				if(pageInfo.hasPreviousPage == false){
					navFirstLi.addClass("disabled");
					navPreLi.addClass("disabled");
				}else{
					navFirstLi.click(function(){
						to_page(1);
					});
					navPreLi.click(function(){
						to_page(pageInfo.pageNum - 1);
					});
				}
				navUl.append(navFirstLi).append(navPreLi);
				$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
					var navigatepageNumLi = $("<li></li>").append($("<a></a>").append(item));
					if(pageInfo.pageNum == item){
						navigatepageNumLi.addClass("active");
					}else{
						navigatepageNumLi.click(function(){
							to_page(item);
						});
					}
					navUl.append(navigatepageNumLi);
				})
				var navNextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
				var navLastLi = $("<li></li>").append($("<a></a>").append("尾页"));
				if(pageInfo.hasNextPage == false){
					navNextLi.addClass("disabled");
					navLastLi.addClass("disabled");
				}else{
					navNextLi.click(function(){
						to_page(pageInfo.pageNum + 1);
					});
					navLastLi.click(function(){
						to_page(pageInfo.pages);
					});
				}
				navUl.append(navNextLi).append(navLastLi);
				nav.append(navUl);
				$("#page_nav").append(nav);
			}
			
			
			//显示添加学生的模态框
			$("#add_stu_modal_btn").click(function(){
				//将添加新学生的模态框中的所有样式和内容恢复到初始化状态
				resetForm("#addStudnetModal form");
				
				initDeptData("#addStudnetModal select");
				$('#addStudnetModal').modal({
					backdrop : "static"
				});
			});
			
			//将添加新学生的模态框中的所有样式和内容恢复到初始化状态
			function resetForm(ele){
				$(ele)[0].reset();
				$(ele).find("*").removeClass("has-success has-error");
				$(ele).find("span").empty();
			}
			
			//为添加新学生的模态框系别添加数据
		  	function initDeptData(ele){
		  		  $.ajax({
		  			 url : "${APP_PATH}/depts",
		  			 type : "GET",
		  			 success : function(result){
		  				 $(ele).empty();
		  				 $.each(result.extend.depts,function(index,item){
		  					 $("<option></option>").append(item.departmentName)
		  					 					   .attr("value",item.departmentId)
		  					 					   .appendTo(ele);
		  				 });
		  			 }
		  		  });
		  	}
			
			//新添加学生的 保存按钮的点击事件
			$("#save_stu_btn").click(function(){
				//通过name的input的change事件监听名字是否合法
				if($(this).attr("check-val")=="error"){
					return false;
				}
				
				//在发送保存信息到数据库之前判断用户名等的格式是否正确
				if(!checkNameAndEmail()){
					return false;
				}
				
				$.ajax({
					url : "${APP_PATH}/stu",
					type : "POST",
					data : $("#addStudnetModal form").serialize(),
					success : function(result){
						/* 在将数据保存到数据库时对数据进行判断是否合法 */
						if(result.code==200){
							$('#addStudnetModal').modal('hide');
							to_page(dataPageCount);//跳转到最后一页
						}else{
							if(undefined == result.extend.fieldErrors){
								showValidateMsg("#addStudnetModal","#name_add_input","error",result.extend.va_msg);
							}else {
								if(undefined != result.extend.fieldErrors.stuName){
									showValidateMsg("#addStudnetModal","#name_add_input","error",result.extend.fieldErrors.stuName);
								}
								if(undefined != result.extend.fieldErrors.phone){
									showValidateMsg("#addStudnetModal","#phone_add_input","error",result.extend.fieldErrors.phone);
								}
								if(undefined != result.extend.fieldErrors.email){
									showValidateMsg("#addStudnetModal","#email_add_input","error",result.extend.fieldErrors.email);
								}
							}
						}
					}
				});
			});
			
			//判断输入姓名、电话、邮箱的格式是否正确之后的提示样式和文本
			function checkNameAndEmail(){
				var regName = /(^[A-Za-z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
				var name = $("#name_add_input").val();
				if(!regName.test(name)){
					showValidateMsg("#addStudnetModal","#name_add_input","error","用户名格式不合法！");
					return false;
				}else{
					showValidateMsg("#addStudnetModal","#name_add_input","success","");
				}
				
				var regPhone = /^[0-9]{11,11}$/;
				var phone = $("#phone_add_input").val();
				if(!regPhone.test(phone)){
					showValidateMsg("#addStudnetModal","#phone_add_input","error","电话号码不合法！");
					return false;
				}else{
					showValidateMsg("#addStudnetModal","#phone_add_input","success","");
				}
				
				var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				var email = $("#email_add_input").val();
				if(!regEmail.test(email)){
					showValidateMsg("#addStudnetModal","#email_add_input","error","邮箱不合法！");
					return false;
				}else{
					showValidateMsg("#addStudnetModal","#email_add_input","success","");
				}
				
				return true;
			}
			
			//判断输入姓名、电话、邮箱的格式是否正确之后的提示样式和文本
			function showValidateMsg(pEle,ele,status,msg){
				$(pEle).find("*").removeClass("has-success has-error");
				$(pEle).find("span").empty();
				
				if("success" === status){
					$(ele).parent().addClass("has-success");
					$(ele).next("span").append(msg);
				}else if("error" === status){
					$(ele).parent().addClass("has-error");
					$(ele).next("span").append(msg);
				}
			}
			
			//监听模态框中名字是否正确
			$("#name_add_input").change(function(){
				$.ajax({
					url : "${APP_PATH}/stuName",
					type : "POST",
					data : "stuName="+$("#name_add_input").val(),
					success : function(result){
						if(result.code==200){
							$("#save_stu_btn").attr("check-val","success");
							showValidateMsg("#addStudnetModal","#name_add_input","success","");
						}else{
							$("#save_stu_btn").attr("check-val","error");
							showValidateMsg("#addStudnetModal","#name_add_input","error",result.extend.va_msg);
						}
					}
				});
			});
			
			
			
			/* 更新学生信息 */
			
			/* 弹出更新模态框 */
			$(document).on("click",".updateBtn",function(){
				resetForm("#updateStudnetModal form");
				initDeptData("#updateStudnetModal select");
				getStuData($(this).attr("edit-id"));
				$("#update_stu_btn").attr("edit-id",$(this).attr("edit-id"));
				$("#updateStudnetModal").modal({
					backdrop : "static"
				});
			});
			
			//显示点击更新的员工信息到模态框
			function getStuData(id){
				$.ajax({
					url : "${APP_PATH}/stu/"+id,
					type : "GET",
					success : function(result){
						$("#stuName_update_input").text(result.extend.student.stuName);
						$("#updateStudnetModal input[name='gender']").val([result.extend.student.gender]);
						$("#phone_update_input").val(result.extend.student.phone);
						$("#email_update_input").val(result.extend.student.email);
						$("#deptId_update_select").val([result.extend.student.deptId]);
					}
				});
			}
			
			//保存更新信息的按钮点击事件
			$("#update_stu_btn").click(function(){
				$.ajax({
					url : "${APP_PATH}/stu/"+$(this).attr("edit-id"),
					type : "PUT",
					data : $("#updateStudnetModal form").serialize(),
					success : function(result){
						if(result.code==200){
							$("#updateStudnetModal").modal("hide");
							to_page(currentPage);
						}else{
							if(undefined != result.extend.fieldErrors.stuName){
								showValidateMsg("#updateStudnetModal","#stuName_update_input","error",result.extend.fieldErrors.stuName);
							}
							if(undefined != result.extend.fieldErrors.phone){
								showValidateMsg("#updateStudnetModal","#phone_update_input","error",result.extend.fieldErrors.phone);
							}
							if(undefined != result.extend.fieldErrors.email){
								showValidateMsg("#updateStudnetModal","#email_update_input","error",result.extend.fieldErrors.email);
							}
						}
					}
				});
			});
			
			//单个删除的点击事件
			$(document).on("click",".deleteBtn",function(){
				var delName = $(this).parent().parent().find("td:eq(2)").text();
				var flag = confirm("是否确定要删除："+delName+"?");
				if(flag){
					$.ajax({
						url : "${APP_PATH}/stu/"+$(this).attr("del-id"),
						type : "DELETE",
						success : function(result){
							alert(result.message)
							to_page(currentPage);
						}
					});
				}
			});
			
			
			//批量删除
			$("#checkAllItem").click(function(){
				$(".check_item").prop("checked",$(this).prop("checked"));
			});
			$(document).on("click",".check_item",function(){
				var flag = $(".check_item:checked").length === $(".check_item").length;
				$("#checkAllItem").prop("checked",flag);
			});
			
			//点击批量删除的按钮事件
			$("#batchDelBtn").click(function(){
				var names = "";
				var delIds = "";
				$.each($(".check_item:checked"),function(){
					names += $(this).parent().parent().find("td:eq(2)").text()+"、";
					delIds += $(this).parent().parent().find("td:eq(1)").text()+"-";
				});
				names = names.substring(0,names.length-1);
				delIds = delIds.substring(0,delIds.length-1);
				if(names.length===0||delIds.length===0){
					alert("请勾选需要删除的学生！");
					return false;
				}
				if(confirm("是否确定要删除："+names+"？")){
					$.ajax({
						url : "${APP_PATH}/stu/"+delIds,
						type : "DELETE",
						success : function(result){
							alert(result.message);
							to_page(currentPage);
						}
					});
				}
			});
			
			
			/* 搜索学生的按钮点击事件 */
			$("#search_stu_modal_btn").click(function(){
				resetForm("#searchStudnetModal form");
				
				$("#searchStudnetModal").modal({
					backdrop : "static"
				});
			});
			
			/* 搜索学生的模态框中的搜索按钮点击事件 */
			$("#search_stu_btn").click(function(){
				var searchName = $("#stuName_search_input").val();
				getSearchStuData(searchName);
			});
			
			/* 将名字发送Ajax请求处理 */
			function getSearchStuData(name){
				$.ajax({
					url : "${APP_PATH}/stuByName",
					type : "GET",
					data : "stuName="+name,
					success : function(result){
						if(result.code === 200){
							$("#searchStudnetModal").modal("hide");
							var student = result.extend.student;
							
							$("#showSearchResult_stuId_input").text(student.stuId);
							$("#showSearchResult_stuName_input").text(student.stuName);
							$("#showSearchResult_gender_input").text(student.gender);
							$("#showSearchResult_phone_input").text(student.phone);
							$("#showSearchResult_email_input").text(student.email);
							$("#showSearchResult_deptId_input").text(student.department.departmentName);
							
							$("#showSearchResultModal").modal({
								backdrop : "static"
							});
						} else{
							showValidateMsg("#searchStudnetModal","#stuName_search_input","error",result.extend.va_msg);
						}
					}
				});
			}
			
			/* 跳转到更新页面 */
			$("#searchResult_update_stu_btn").click(function(){
				var stuId = $("#showSearchResult_stuId_input").text();
				resetForm("#updateStudnetModal form");
				initDeptData("#updateStudnetModal select");
				getStuData(stuId);
				$("#update_stu_btn").attr("edit-id",stuId);
				
				$("#showSearchResultModal").modal("hide");
				
				$("#updateStudnetModal").modal({
					backdrop : "static"
				});
			});
		});
	</script>
</body>
</html>