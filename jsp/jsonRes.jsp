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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>jsonRes</title>
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
</style>
</head>
<body><br><br>
<%
	int page1=1;
	int page2=1;
	String result=username+"的行程:"; 
	String method=request.getMethod();
	String jsonStr="";
	String route="";
	boolean isfirst=true;
	String url="jdbc:mysql://139.129.31.173/TRAVEL?useUnicode=true&characterEncoding=utf-8";
	String user="user";
	String pwd="123456";
	Class.forName("com.mysql.jdbc.Driver"); // 装入驱动
	Connection con=DriverManager.getConnection(url, user, pwd); //建立连接
	Statement stmt=con.createStatement();
	String sql="";
	String sql2="";
	int rid=0;
	if(method.equalsIgnoreCase("post")){
			if(request.getParameter("action")!=null&&"change".equals(request.getParameter("action"))){
				jsonStr=request.getParameter("newJsonStr");
				String ridStr=request.getParameter("rid");
				sql=String.format("update userRoute set route='%s' where rid='%d'",jsonStr,Integer.parseInt(ridStr));
				stmt.executeUpdate(sql);
				sql2=String.format("select * from userRoute where uid='%d'",Integer.parseInt(id));
			}
			else if(request.getParameter("action")!=null&&"search".equals(request.getParameter("action"))){
				jsonStr=request.getParameter("searchStr");
				sql2="select * from userRoute where route like '%"+jsonStr+"%'";
			}
			else{
			jsonStr=request.getParameter("jsonStr");
			//将得到的行程信息与用户id存进数据库
			sql=String.format("insert into userRoute(uid,route) values('%d','%s')",Integer.parseInt(id),jsonStr);
			stmt.executeUpdate(sql);
			sql2=String.format("select * from userRoute where uid='%d'",Integer.parseInt(id));
			}
			
			
			
			
			ResultSet rs=stmt.executeQuery(sql2);
	
			while(rs.next()) {
				route=rs.getString("route");
				rid=rs.getInt("rid");
			}
			rs.close();
		
	//String jsonStr="{\"a\":[{\"traffic\":\"c\"},{\"spot\":\"b\"}]}";
	JSONObject  obj= new JSONObject(route); 
	Iterator it =  obj.keys();  
	while (it.hasNext()) { 
		 String key = (String) it.next(); %><div class="main">
		 	<h1><%=key %></h1>
		 <%  
	     String value = obj.getString(key);  
	     JSONArray array = obj.getJSONArray(key);  
	     for(int i=0;i<array.length();i++){  
	         JSONObject jsonobject = array.getJSONObject(i);
	         Iterator jsonkey=jsonobject.keys();
	         if(jsonkey.hasNext()){
	        	 String key2=(String)jsonkey.next();%>
	        	 <p><%=key2 %>:
	        	 <%
	        	 String res1=jsonobject.getString(key2);
	        	 %><%=res1%></p><% 
	         }         
	     } %></div><div class="traffic"></div><% 
	}
	result=result+"保存成功";
	//response.getWriter().write(jsonStr);
	} 
	else{
		if(request.getParameter("action")!=null&&"delete".equals(request.getParameter("action"))){
			jsonStr=request.getParameter("jsonStr");
			//将得到的行程信息与用户id存进数据库
			sql=String.format("delete from userRoute where uid='%d'",Integer.parseInt(id));
			stmt.executeUpdate(sql);
			result=result+"删除成功";
			sql2=String.format("select * from userRoute where uid='%d'",Integer.parseInt(id));
			ResultSet rs=stmt.executeQuery(sql2);
	
			while(rs.next()) {
				route=rs.getString("route");
				rid=rs.getInt("rid");
			}
			rs.close();
		}else{
		sql2=String.format("select * from userRoute where uid='%d'",Integer.parseInt(id));
		ResultSet rs=stmt.executeQuery(sql2);
		
		if(request.getParameter("action")!=null){
			page1=Integer.parseInt(request.getParameter("page"));
			page2=page1-1;
		}
		
		
		if(rs.next()){
			for(int i=1;i<page1;i++){
				if(rs.next()){
					
				}
			}
			page1=page1+1;
			//rs.next();rs.next();
			route=rs.getString("route");
			rid=rs.getInt("rid");
		//String jsonStr="{\"a\":[{\"traffic\":\"c\"},{\"spot\":\"b\"}]}";
		JSONObject  obj= new JSONObject(route); 
		Iterator it =  obj.keys();  
		while (it.hasNext()) { 
			 String key = (String) it.next(); 
			 %><div class="main">
			 <h1><%=key %></h1>
			 <%  
		     String value = obj.getString(key);  
		     JSONArray array = obj.getJSONArray(key);  
		     for(int i=0;i<array.length();i++){  
		         JSONObject jsonobject = array.getJSONObject(i);
		         Iterator jsonkey=jsonobject.keys();
		         if(jsonkey.hasNext()){
		        	 String key2=(String)jsonkey.next();%>
		        	 <p><span><%=key2 %></span>:
		        	 <%
		        	 String res1=jsonobject.getString(key2);
		        	 %><span><%=res1%></span></p><% 
		         }         
		     } %></div><div class="traffic"></div><% 
		}
		result=result+"";}
		}
	}
%>
<div class="main">
<h1 ><%=result %></h1>
<p>json:<%=jsonStr %></p>
<p>sql:<%=route %></p>
<a href="jsonRes.jsp?action=delete">删除</a><span>|</span><a href="jsonRes.jsp?action=next&page=<%=page2%>">上一页</a>
<span>|</span><a href="jsonRes.jsp?action=next&page=<%=page1%>">下一页</a>
</div>
<div class="foot">

<form action="jsonRes.jsp?action=change&rid=<%=rid %>" method="post">
			<p>修改</p>
			<label>名称</label>
			<input type="text" name="addrname" id="changeText"><br>
			<label>json</label>
			<input type="text" name="newJsonStr" id="newJsonStr" value=<%=route %>>
			<br>
			<input id="save" type="button" value="保存" >
			<input id="save" type="submit" value="提交" >
</form>


</div>
</div>
</body>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script>
	var $clickDom=$('.main');
	$('.main').on('click',function(event){
		$('#changeText').val($(event.target).text())
		$clickDom=$(event.target);
		
	})
	$('#save').on('click',function(event){
		var newText=$('#changeText').val()
		var str=$('#newJsonStr').val();
		var oldText=$clickDom.text();
		var newStr=str.replace(oldText,newText);
		$('#newJsonStr').val(newStr);
		$clickDom.text(newText);
		
	})
</script>
</html>