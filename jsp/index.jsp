<%@ page language="java" import="java.util.*" import ="java.util.Date"  import="java.sql.*" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
	<meta charset=utf-8>
	<meta name=viewport content="width=device-width, initial-scale=1">
	
	
	<style type="text/css">
		html,body{
		margin: 0;
		padding: 0;
		border: 0;	
		height: 100%;
		width: 100%;
		font-size: 100%;
		font-family: "微软雅黑", sans-serif;
		color: #ffffff;
		
		position:absolute;
		z-index:1;
		}
		body{
			background-image:url('img/index.jpg');
			
		}
		.banner{
			width: 100%;
			height: 20%;
			background-color:#606270;
			padding:1px;
			text-align: center;
			opacity: 0.8;
		}
		.nav{
			width: 20%;
			margin-left: auto;
			margin-right: auto;
			margin-top:3em;		
			height: 100%;
			cursor: pointer;
			float:right;
			display:inline-block;
		}
		.nav ul{
			/*margin-top: 50%;*/
			width: 80%;
			height: 40%;
			border: 0px solid #ffffff;
			text-align: center;
			background-color: #606270;
			border-radius: 20%;
			padding: 5%;
			display:inline-block; 
		}
		.nav li{
			padding: 3%;
			background-color:#606270;
			width: 30%;
			height: 30%;
			display:inline-block; 
			border-radius: 30%;
			border: 1px solid #ffffff;
			opacity: 1;
		}
		
		.user{
			position: relative;
			opacity: 0.85;
			z-index: 9;
			margin-top: 0;
			color: #606270;
			background-color: #FFFFF0;
			padding:0;
			width: 20%;
			height: 30%;
			margin-left: auto;
			margin-right: auto;
			border: 1px solid #606270;
			text-align: center;

			transition: opacity 0.5s;
			-webkit-transition:opacity 0.5s;
		}
		.user input[type=submit]{
			background-color: #606270;
			 padding: 3%;
			 width: 30%;
			 cursor: pointer;
			 color: #FFF;
			 font-weight: bold;
			 border: none;	
			 border-radius: 8%;
			 
			 opacity: 1;
		}
		input{
			margin:3%;
		}
		.display{
			display: none;
			opacity: 0;
			transition: display 1s;
			-webkit-transition:display 1s;
			transition: opacity 1s;
			-webkit-transition:opacity 1s;
		}
		.hidden{
			/*visibility: hidden;*/
			opacity:0;
			transition: opacity 0.5s;
			-webkit-transition:opacity 0.5s;
		}
		.background{
			position: absolute;
			top: 0;
			width: 100%;
			height: 100%;
			z-index: 3;	
			background-color: #000000;
			opacity: 0.7;
			transition: display 1s;
			-webkit-transition:display 1s;
			transition: opacity 1s;
			-webkit-transition:opacity 1s;
			/*transition: display 1s;*/
			 /*-webkit-transition:display 1s;*/
		}
		.user ul{
			margin-left: auto;
			margin-right: auto;	
		}
		
		.user li{
			display: inline;
			cursor: pointer;
			margin: 2.5em;
			/*background-color: #eeeeee;*/
		}
		.form2 input[type=submit]{
			background-color: #a66270;
		}
		.sel{
		opacity: 0.75;
			width: 30%;
			height: 15%;
			margin-left: auto;
			margin-right: auto;	
			margin-top:1%;	
			text-align: center;
			cursor: pointer;
			background-color: #606270;
		}
		.d1,.d2{
			text-align: center;
			margin: 1em;
			width: 40%;
			display: inline-block;
		}
		a{
			text-decoration: none;
			color: #fff;
		}
		.res{
			margin-top:1%;	
			color: #fff;
			width: 30%;
			height: 40%;
			margin-left: auto;
			margin-right: auto;		
			text-align: center;
			cursor: pointer;
			background-color: #606270;
			opacity: 0.75;
		}
		.title{
			opacity: 1;
			
			position: absolute;
			font-size:300%;
			display: block;
			
			left:0;
			right:0;
			
			buttom:0;
			margin:auto;
			top:0;
		}
	</style>
</head>

<%
//String url="jdbc:mysql://202.116.76.22/test";
String url="jdbc:mysql://139.129.31.173/TRAVEL";
String user="user";
String pwd="123456";
String action="";
String method=request.getMethod();
String username="请先登录或注册";
String password="";
String email=""; 
String time="";
String uid="";
String loginRes="";
if(method.equalsIgnoreCase("post")){
try{
	Class.forName("com.mysql.jdbc.Driver"); // 装入驱动
	Connection con=DriverManager.getConnection(url, user, pwd); //建立连接
	Statement stmt=con.createStatement();
	
	
	String sql="";
	Date resigndate= new java.sql.Date(new java.util.Date().getTime());
	
	if(request.getParameter("action")!=null){
		action=request.getParameter("action");
		if("login".equals(action)){//如果点击登陆
			username=request.getParameter("username");//获得用户名和密码
			password=request.getParameter("password");
			sql=String.format("select * from User where username='%s'AND password='%s'",username,password);
			//在数据库中查询用户名和密码
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()) {//如果该用户存在，则登陆成功，否则显示用户不存在
				username=rs.getString("username");
				uid=rs.getString("uid");
				email=rs.getString("email");
				time=rs.getString("resigndate");
				loginRes="login success!";
				Cookie cookie = new Cookie("username",username+'/'+uid);
				cookie.setMaxAge(36000);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			else{
				loginRes="用户名不存在";
			}
			rs.close();
		}else if("register".equals(action)){
			username=request.getParameter("username");
			password=request.getParameter("password");
			email=request.getParameter("email");
			
			sql=String.format("insert into User(username,password,email,gender,resigndate,brief_info) values('%s','%s','%s','%s','%s','%s')",username,password,email,"",resigndate,"");//在数据库中创建一个新的用户
			stmt.executeUpdate(sql);
			sql=String.format("select * from User where username='%s'AND password='%s'",username,password);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {//创建用户存在，返回注册成功
				username=rs.getString("username");
				uid=rs.getString("uid");
				email=rs.getString("email");
				time=rs.getString("resigndate");
				loginRes="register success!";
			}
			rs.close();
			
		}
	}

	
	
	
	stmt.close();
	con.close();
}catch (Exception e){
		e.printStackTrace();
		out.print(e.toString());
	}
}
%>
<body>

	<div class="banner">
	<div class="title" style="opacity: 1">Moving</div>
		<div class="nav">
		
			<ul>
			    <li>登陆</li>
			   
			    <li >注册</li>
			    <a href="search.jsp"><li >搜索</li></a>
			</ul>
			
		</div>
		
	</div>
		
		<div class="user display">
			<ul>
			    <li>登陆</li>
			    
			    <li>注册</li>
			</ul>
			<form class="form1" action="index.jsp?action=login" method="post">
			<label>用户:</label>
			<input type="text" name="username">
			<br>
			<label>密码:</label>
			<input type="password" name="password">
			<br>
			<input type="submit" value="登陆">
			</form>

			<form class="form2" action="index.jsp?action=register" method="post">
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
		<div class="res"><Br>
			<p><%=loginRes %></p>
			
			<p>用户信息</p>
			<p>username: <%=username %></p>
			<p>uid: <%=uid %></p>
			<p>resigndate: <%=time %></p>
			<p>email: <%=email %></p>
			
		</div>
		<div class="sel">
			
			<div class="d1">
				<a href="jsonRes.jsp"><h1>我的行程</h1></a>
			</div>
			<div class="d2">
				<a href="addRoute.jsp"><h1>制定行程</h1></a>
			</div>
		</div>

		<div class="background display"></div>
</body>

<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">

	var $login=$('.nav').find('li').eq(0);
	var	$signup=$('.nav').find('li').eq(1);

	var $loginS=$('.user').find('li').eq(0);
	var	$signupS=$('.user').find('li').eq(1);
	var	$user=$('.user');
	var $background=$('.background');
	var $banner=$('.banner');
	var $body=$('body');
	var $nav=$('.nav');
	var $form1=$('.form1');
	var $form2=$('.form2');

	$login.on('click',function(event){
			// $nav.children('ul').removeClass('is-visible');
			 $form1.slideDown()
			// $form1.addClass('display');
			$form2.slideUp();
			 $user.removeClass('display');	
			// $banner.addClass('hidden');
			$background.removeClass('display');
			// $background.css('display','block');
			
	})
	$signup.on('click',function(event){
			// $nav.children('ul').removeClass('is-visible');
			 $user.removeClass('display');	
			// $banner.addClass('hidden');
			$background.removeClass('display');
			$form2.slideDown()
			// $form1.addClass('display');
			$form1.slideUp();
			// $background.css('display','block');
			
	})
	$form2.slideUp();
	$signupS.on('click',function(event){
			 // $form2.removeClass('display');	
			 $form2.slideDown()
			// $form1.addClass('display');
			$form1.slideUp();
			
	})
	$loginS.on('click',function(event){
			//  $form1.removeClass('display');	
			// $form2.addClass('display');
			$form2.slideUp();
			$form1.slideDown()
			
	})
	$background.on('click',function(event){
		if($(event.target).is($user)){
			$user.removeClass('display');
			// $body.removeClass('background');
		}else
		$user.addClass('display');
		$background.addClass('display');
		// $background.css('display','none');

	})

</script>
</html>