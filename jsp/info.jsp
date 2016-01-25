<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
//String url="jdbc:mysql://202.116.76.22/test";
String url="jdbc:mysql://139.129.31.173/TRAVEL";
String user="user";
String pwd="123456";
int pgno_new=0;
int ppg_new=4;
int pgno_back=0;
int ppg_back=4;
int pgno=0;
int ppg=5;
int testp=9;
String[] num=new String[5];
String[] name=new String[5];
String[] age=new String[5];
String[] grade=new String[5];
String[] hobby=new String[5];
try{
	Class.forName("com.mysql.jdbc.Driver"); // 装入驱动
	Connection con=DriverManager.getConnection(url, user, pwd); //建立连接
	Statement stmt=con.createStatement();
	if(request.getParameter("pgno")!=null){
		testp=Integer.parseInt(request.getParameter("pgno"));
		//ppg=Integer.parseInt(request.getParameter("ppg"));
		//pgno_new=pgno+1;
		pgno=Integer.parseInt(request.getParameter("pgno"));
		
		if(pgno>0)
		pgno_back=pgno-1;
	}
	pgno_new=pgno+1;
	String sql=String.format("select * from user limit %d,%d",pgno*ppg,ppg);
	
	ResultSet rs=stmt.executeQuery(sql);
	int i=0;
	while(rs.next()) {
		num[i]=rs.getString("username");
		name[i]=rs.getString("email");
		age[i]=rs.getString("gender");
		grade[i]=rs.getString("resigndate");
		hobby[i]=rs.getString("brief_info");
		i=i+1;	
	}
	
	rs.close();
	stmt.close();
	con.close();
}catch (Exception e){
		e.printStackTrace();
		out.print(e.toString());
	}

%>
<div style="background-color:#e88888;width:500px;margin-right:auto;margin-left:auto;text-align:center">
		<br><br>
		<h1>浏览学生名单</h1>
		
		<table border="1" style="margin-right:auto;margin-left:auto;">
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>年龄</td>
				<td>年级</td>
				<td>爱好</td>
				<td>-</td>
			</tr>
			<tr>
				<td><%=num[0] %></td>
				<td><%=name[0] %></td>
				<td><%=age[0] %></td>
				<td><%=grade[0] %></td>
				<td><%=hobby[0] %></td>
				<td><a href="delete.jsp?num=<%=num[0]%>">删除</a>/<a href="update.jsp?num=<%=num[0]%>&name=<%=name[0]%>">修改</a></td>
			</tr>
			<tr>
				<td><%=num[1] %></td>
				<td><%=name[1] %></td>
				<td><%=age[1] %></td>
				<td><%=grade[1] %></td>
				<td><%=hobby[1] %></td>
				<td><a href="delete.jsp?num=<%=num[1]%>">删除</a>/<a href="update.jsp?num=<%=num[1]%>&name=<%=name[1]%>">修改</a></td>
			</tr>
			<tr>
				<td><%=num[2] %></td>
				<td><%=name[2] %></td>
				<td><%=age[2] %></td>
				<td><%=grade[2] %></td>
				<td><%=hobby[2] %></td>
				<td><a href="delete.jsp?num=<%=num[2]%>">删除</a>/<a href="update.jsp?num=<%=num[2]%>&name=<%=name[2]%>">修改</a></td>
			</tr>
			<tr>
				<td><%=num[3] %></td>
				<td><%=name[3] %></td>
				<td><%=age[3] %></td>
				<td><%=grade[3] %></td>
				<td><%=hobby[3] %></td>
				<td><a href="delete.jsp?num=<%=num[3]%>">删除</a>/<a href="update.jsp?num=<%=num[3]%>&name=<%=name[3]%>">修改</a></td>
			<tr>
				<td><%=num[4] %></td>
				<td><%=name[4] %></td>
				<td><%=age[4] %></td>
				<td><%=grade[4] %></td>
				<td><%=hobby[4] %></td>
				<td><a href="delete.jsp?num=<%=num[4]%>">删除</a>/<a href="update.jsp?num=<%=num[4]%>&name=<%=name[4]%>">修改</a></td>
			</tr>
		</table><br>
		<a href="browseStu.jsp?pgno=<%=pgno_new%>&pgcnt=<%=ppg_new%>">下一页</a>
		<a href="browseStu.jsp?pgno=<%=pgno_back%>&pgcnt=<%=ppg_back%>">上一页</a><br><br>
</div>
</body>
</html>