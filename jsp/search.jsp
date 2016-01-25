<%@ page language="java" import="java.util.*" import="javax.servlet.http.Cookie" import ="java.util.Date" import="org.json.*" import="java.sql.*" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%
Cookie[] cookies = request.getCookies();
String name="";
String value1="";
String username="";
String id="";
String[] rescookies=new String[2];
for(Cookie cookie : cookies){
	name= cookie.getName();// get the cookie name
	if("username".equals(name)){
	value1=cookie.getValue();
	rescookies=value1.split("/");// get the cookie value
	username=rescookies[0];
	id=rescookies[1];
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>搜索</title>
<style>
	html,body{
		margin: 0;
		padding: 0;
		border: 0;	
		height: 100%;
		width: 100%;
		font-size: 100%;
		font-family: "微软雅黑", sans-serif;
		color: #606270;
		background-color: white;
		position:absolute;
		z-index:1;
		text-align: center;
		}
		body{
			background:url(img/route4.jpg)  100% 100%;
			/*background-repeat: no-repeat;*/
		
		}
	.main{
		width:30em;
		border: 3px solid #606270;
		margin-right: auto;
		margin-left: auto;
		background-color: white;
		text-align: center;
		opacity:0.75;
	}
	.traffic{
			
			margin: auto;
			padding-left: 0.3em;
			padding-top: 1em;
			color: #606270;
			background-color: #fff;
			border-left: 3px solid #606270;
			width: 0.1em;
			height: 5em;
			
		}
		h1,p{
			background-color: #fff;
			
		}
	.foot{
		position: fixed;
		width:20em;
		border: 3px solid #606270;
		top:1em;
		left:1em;
		margin-top: 1em;
		margin-right: auto;
		margin-left: auto;
		background-color: white;
		text-align: center;
		opacity:0.75;
	}
	form{
			display: block;
			clear: both;
			float: left;
			width: 15em;
			border: 3px solid #606270;
			padding: 1em;
			margin: 1em;
			color: #606270;
			background-color: white;
			opacity: 0.88;
			/*display: inline-block;*/
		}
		form input[type=button]{
			
			font-family: "微软雅黑", sans-serif;
			background-color:#606270;
			padding: 0.5em;
			width: 5em;
			margin: 1em;
			cursor: pointer;
			color: #FFF;
			font-weight: bold;
			border: none;	
			border-radius: 8%;
		}
		form input[type=submit]{
			
			font-family: "微软雅黑", sans-serif;
			background-color:#606270;
			padding: 0.5em;
			width: 5em;
			margin: 1em;
			cursor: pointer;
			color: #FFF;
			font-weight: bold;
			border: none;	
			border-radius: 8%;
		}
		a{
			text-decoration: none;
			color: #606270;
		}
		.banner{
			width: 100%;
			height: 20%;
			background-color:#606270;
			padding:1px;
			text-align: center;
			opacity: 0.8;
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
<body>
<div class="banner">
	<div class="title" style="opacity: 1">Moving</div></div>
	<form action="jsonRes.jsp?action=search&uid=<%=id %>" method="post">
			
			<label>关键字</label>
			<input type="text" name="searchStr" ><br>
			<br>
			<input id="save" type="submit" value="搜索" >
</form>
</body>
</html>