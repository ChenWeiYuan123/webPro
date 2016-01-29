<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="com.group.MyDataBase" %>
<%!
MyDataBase myDataBase = new MyDataBase();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>file</title>
</head>
<body>
	<%
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);//检查表单中是否包含文件
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			//factory.setSizeThreshold(yourMaxMemorySize); 此处可设置使用的内存最大值
			//factory.setRepository(yourTempDirectory); 文件临时目录
			ServletFileUpload upload = new ServletFileUpload(factory);
			//upload.setSizeMax(yourMaxRequestSize);允许的最大文件尺寸
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fi = (FileItem) items.get(i);
				if (fi.isFormField()) {//如果是表单字段
					out.print(fi.getFieldName() + ":" + fi.getString("GB2312") + "<BR>");
				} else {//如果是文件
					DiskFileItem dfi = (DiskFileItem) fi;
					if (!dfi.getName().trim().equals("")) {
						// getName()返回文件名称，如果是空字符串，说明没有选择文件。
						// FilenameUtils.getName(filename);
						if(myDataBase.connect()) {
							out.print("Location：<url>"
									+ "file" + System.getProperty("file.separator")
											+ FilenameUtils.getName(dfi.getName())
									+ "</url><br>");
							dfi.write(new File(application.getRealPath("/file") + System.getProperty("file.separator")
									+ FilenameUtils.getName(dfi.getName())));
							// 存进数据库
							String sql = String.format("Insert into picture(URL) values ('%s')", 
									"file" + 
							System.getProperty("file.separator") + System.getProperty("file.separator") // 避免转义符
									+ FilenameUtils.getName(dfi.getName()));
							myDataBase.executeInsert(sql);
						}
						
					} //if
				} //if 
			} //for
		} //if(isMultipart)
	%>
</body>
</html>