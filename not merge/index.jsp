<%@ page contentType="text/html;charset=utf-8" import="com.group.MyDataBase, java.sql.*, javax.servlet.http.Cookie"%>
<% 
// JSP 代码
%>

<%!

// 全局变量

MyDataBase mydatabase = new MyDataBase(); // 数据库
String user = ""; // 用户名

// 登入
private Boolean login(String username, String password) {
	String sql = String.format("select count(*) as num from users  where username = '%s' and password = '%s'", username, password);
	ResultSet rs = mydatabase.executeQuery(sql);
	String num = "";
	try {
		if(rs.next()) {
			num = rs.getString("num");
		} 
	} catch (Exception e) {}
	System.out.println(num);
	return "1".equals(num);
}

// 设置登录信息
private void setLoginStatus(HttpServletResponse response, String username) {
	Cookie cookie = new Cookie("user", username);
	cookie.setPath("/");
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
}

// 登出
private void logout(HttpServletResponse response) {
	setLoginStatus(response, null);
}
%>

<%
// 连接数据库
if (mydatabase.connect()) { // 连接数据库成功
	String action = request.getParameter("action");
	if("login".equals(action)) { // 登录
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(login(username, password)) {
			// 设置cookie信息
			setLoginStatus(response, username);
			user = username;
			System.out.println("login: yes");
		} else {
			System.out.println("login: no");
			//TODO: 添加登录失败提示信息
		}
	} else if("register".equals(action)) { // 注册
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String sql = String.format("INSERT INTO USERS(email, password, username) VALUES ('%s','%s','%s')",
				email, password, username); 
		Boolean ok = mydatabase.executeInsert(sql);
		if(ok) { // 注册成功
			setLoginStatus(response, username);
			user = username;
		} else { // 注册失败
			//TODO: 添加注册失败提示信息
		}
	} else if("logout".equals(action)) {
		logout(response);
		user = "";
		System.out.println("logout:" + user);
	} else { // action为空
		
	}
} else { //连接数据库失败
	
}

%>
<% 
// HTML代码
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta charset="utf-8">
	<meta name=description content="">
	<meta name=viewport content="width=device-width, initial-scale=1">
	<link rel=stylesheet href="css/index.css">

</head>
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
				<p>Moving</p>
				<div class="head-main-button">
					<a href="Travels.jsp"><button>Find Travals</button></a>
					<a href="create.jsp"><button>New Travals</button></a>
				</div>
		</div>
	</div>
	
	<div class="main">
		<div class="main-nav">
			<span onclick="Hot()" id="Hot">Hot Travals</span>
			<span>|</span>
			<span onclick="friend()" id="TimeLine">TimeLine</span>
		</div>

		
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
			</div>
		</div>

		<div class="friend-list hidden" id="friend-list">
			<div class="friend-list-block">
				<div>
				<div class="friend-list-block-headImg">
					<img src="pic3.jpg" width="100%" height="100%s" alt="">
				</div>
				<div class="friend-list-block-comment">
				<b>picture introduction|&nbsp;by user1</b><br>
				<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</div>

				<div class="friend-list-block-img">

					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					
				</div>
			
			</div>
			<div class="friend-list-block">
				<div>
				<div class="friend-list-block-headImg">
					<img src="pic3.jpg" width="100%" height="100%s" alt="">
				</div>
				<div class="friend-list-block-comment">
				<b>picture introduction|&nbsp;by user1</b><br>
				<span>2015/8/9 / 8days / 128 picures</span>
				</div>
				</div>

				<div class="friend-list-block-img">

					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					<img src="1.jpg" width="30%" height="30%" alt="">
					
				</div>
			
			</div>
		</div>
	</div>

	<div class="user hidden"  id="userForm">
		<div class="user-title">
			<span onclick="login()">Login</span>
			<span>|</span>
			<span onclick="register()">Register</span>
		</div>
		<form class="form1" id="form1" action="index.jsp?action=login" method="post">
		<label>用户:</label>
		<input type="text" name="username">
		<br>
		<label>密码:</label>
		<input type="password" name="password">
		<br>
		<input type="submit" value="登陆">
		</form>

		<form class="form2 hidden" id="form2" action="index.jsp?action=register" method="post">
		<label>用户:</label>
		<input type="text" name="username">
		<br>
		<label>邮箱:</label>
		<input type="text" name="email">
		<br>
		<label>密码:</label>
		<input type="password" name="password">
		<br>
		<input type="submit" value="注册">
		</form>

	</div>

	<div class="background hidden" id="background" onclick="bgdDis()"></div>
<body>

</body>
<script src="js/index.js"></script>
</html>