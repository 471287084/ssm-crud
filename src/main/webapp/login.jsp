<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-3.1.0.min.js"></script>
<!-- 引入bootstrap -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><span class="navbar-brand" style="font-size:32px;">班级通讯录</span></div>
        </div>
      </div>
    </nav>
    
	<div class="container" style="margin-top: 120px;">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login_form" class="form-signin" role="form" method="post">
					<h2 class="form-signin-heading">
						<i class="glyphicon glyphicon-user"></i> 用户登录
					</h2>
					
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="name_input"
							name="name" placeholder="请输入账号" autofocus /> 
						<span class="help-block" style="height: 12px;"></span>
						<i class="glyphicon glyphicon-user form-control-feedback"></i>
					</div>
					
					<div class="form-group has-feedback">
						<input type="password" class="form-control" id="password_input"
							name="password" placeholder="请输入密码"
							style="margin-top: 10px;">
						<span class="help-block" style="height: 12px;"></span>
						<i class="glyphicon glyphicon-lock form-control-feedback"></i>
					</div>
					
					<div class="checkbox" align="right" style="margin-bottom: 12px;"> 
			          <label>
			            <a href="${APP_PATH }/register.jsp">我要注册</a>
			          </label>
			        </div>
			        
					<button class="btn btn-lg btn-success btn-block" id="login_btn">登录</button>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#login_btn").click(function(){
				$("#login_form").find("*").removeClass("has-success has-error");
				$("#login_form").find("span").empty();
				
				var name = $("#name_input").val();
				var password = $("#password_input").val();
				
				$.ajax({
					url : "${APP_PATH}/login",
					type : "GET",
					data : "name="+name+"&password="+password,
					success : function(result){
						if(result.code === 200){
							var nameInput = $("<input type='hidden' name='name_input'>").attr("value",name);
							var passInput = $("<input type='hidden' name='password_input'>").attr("value",password);
							$("#login_form").attr("action","index")
											.append(nameInput)
											.append(passInput)
											.submit();
						}else {
							if(result.extend.va_msg==="密码不正确！"){
								showValidateMsg("#login_form","#password_input","error",result.extend.va_msg);
							}else{
								showValidateMsg("#login_form","#name_input","error",result.extend.va_msg);
							}
						}
					}
				});
				return false;
			});
			
			
			function showValidateMsg(pEle,ele,status,msg){
				$(pEle).find("*").removeClass("has-success has-error");
				$(pEle).find("span").empty();
				if(status==="success"){
					$(ele).parent().addClass("has-success");
					$(ele).next("span").text(msg);
				} else if(status==="error"){
					$(ele).parent().addClass("has-error");
					$(ele).next("span").text(msg);
				}
			}
		});
	</script>
</body>
</html>