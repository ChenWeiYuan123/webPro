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
<html>
<head>
	<title>TravelList</title>
	<meta charset=utf-8>
	<meta name=description content="">
	<meta name=viewport content="width=device-width, initial-scale=1">

	<link rel=stylesheet href="css/TravelsList.css">
</head>
<body>
	<div class="head">
		<div class="head-nav">
				<p>TRAVELS</p>
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
				<p>TRAVELS</p>
				
		</div>
	</div>

	<div class="main">
		

		
		<div class="main-list " id="main-list">
			<div class="main-list-block">
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="1.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div></a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="2.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div></a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="1.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div></a>
				
			</div>
			<div>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="3.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
			</div>
			<div>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="3.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
			</div>
			<div>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="3.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
			</div>
			<div>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="3.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>

				<a href="TravelsList.jsp">
				<div class="main-list-block-img">
					<img src="4.jpg" width="100%" height="100%"><br>
					<b>picture introduction|&nbsp;by user1</b><br>
					<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</a>
			</div>
		</div>

		
	</div>
</body>
</html>