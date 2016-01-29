<%@ page contentType="text/html;charset=utf-8" import="com.group.MyDataBase, java.sql.*, javax.servlet.http.Cookie"%>
<% 
// JSP 代码
%>
<%!
String user = "";
//获取登录信息
private void getLoginStatus(HttpServletRequest request) {
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie: cookies) {
		String name = cookie.getName();
		String value = cookie.getValue();
		if(name.equals("user")) user = value;
	}
}
%>

<%
getLoginStatus(request);
if("".equals(user)) {
	response.sendRedirect("index.jsp");
}
%>


<% 
// HTML代码
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>create</title>
	<meta charset=utf-8>
	<meta name=description content="">
	<meta name=viewport content="width=device-width, initial-scale=1">
	<link rel=stylesheet href="css/create.css">
</head>
<body>
	<div class="head">
		<div class="head-nav">
				<a href="index.jsp"><p>TRAVELS</p></a>
				<input type="text">
				<input type="button" value="Search">
				<%// 设置登录/注册按钮或显示登录用户信息 %>
				<%="".equals(user)?
					"<input type='button' id='register' value='Register'  onclick='register()'>"+
					"<input type='button' id='Login' value='Login'  onclick='login()'>":
					"<span class='user_status'><a href=\"index.jsp?action=logout\">Logout</a></span>" + 
					"<span class='user_status'>"+ "Welcome " +user+ "!</span>"%>		
				
		</div>
		<div class="head-main">
				<div class="head-main-button">
					<button class="head-main-button-button opacity" onclick="uploadImg(this)">上传照片</button>
					<button class="head-main-button-button opacity" onclick="modifyTrav(this)" id="modify">修改行程</button>
					<button class="head-main-button-button opacity" onclick="editTrav(this)" id="edit">编辑排版</button>
					<button class="head-main-button-button opacity" onclick="publishTrav(this)" id="publish">发布行程</button>
				</div>
		</div>
	</div>
	<div class="upload" id="imgUpload">
		<div class="file" id="fileDiv">
			<input type="file" id="file" onchange="show()" multiple name="upload"><span id="upload">upload</span>
		</div><br>
		<p>无图无真相</p>
		<p>测试阶段无数据库需上传与页面文件同目录下的图片,按ctrl上传多张图片</p>
	</div>

	<div class="modify hidden">
		<div class="title hidden">
		<label>游记标题</label><input type="text" name="title" id="title">
		</div>
		<div class="imgList hidden" id ="imgList">
			
		</div>
		<div class="addRoute" ondrop="drop(event)" ondragover="allowdrag(event)">
			<div class="addr" onclick="input(this)">
				<span id="add">下一步[修改行程]</span>
			</div>
		</div>
	</div>

	
	<div class="edit hidden">

	</div>
	<div class="publish hidden">

	<nobr id="nobr">

	</nobr>
	</div>
	
	
	<div class="user hidden"  id="userForm">
		
		<form class="form1" id="form1" >
		<label>旅行地:</label>
		<input type="text" name="username" id="text">
		<br>

		<input type="button" value="确认"  onclick="getAddr()">
		</form>

	</div>
	<div class="background hidden" id="background" onclick="bgdDis()"></div>
</body>
<script src="js/create-publish.js"></script>
<script src="js/create-modifyTrav.js"></script>
<script src="js/create-imgupload.js"></script>
<script src="js/create-editTrav.js"></script>
<script src="js/create-drag.js"></script>
</html>