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
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);//�������Ƿ�����ļ�
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			//factory.setSizeThreshold(yourMaxMemorySize); �˴�������ʹ�õ��ڴ����ֵ
			//factory.setRepository(yourTempDirectory); �ļ���ʱĿ¼
			ServletFileUpload upload = new ServletFileUpload(factory);
			//upload.setSizeMax(yourMaxRequestSize);���������ļ��ߴ�
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem fi = (FileItem) items.get(i);
				if (fi.isFormField()) {//����Ǳ��ֶ�
					out.print(fi.getFieldName() + ":" + fi.getString("GB2312") + "<BR>");
				} else {//������ļ�
					DiskFileItem dfi = (DiskFileItem) fi;
					if (!dfi.getName().trim().equals("")) {
						// getName()�����ļ����ƣ�����ǿ��ַ�����˵��û��ѡ���ļ���
						// FilenameUtils.getName(filename);
						if(myDataBase.connect()) {
							out.print("Location��<url>"
									+ "file" + System.getProperty("file.separator")
											+ FilenameUtils.getName(dfi.getName())
									+ "</url><br>");
							dfi.write(new File(application.getRealPath("/file") + System.getProperty("file.separator")
									+ FilenameUtils.getName(dfi.getName())));
							// ������ݿ�
							String sql = String.format("Insert into picture(URL) values ('%s')", 
									"file" + 
							System.getProperty("file.separator") + System.getProperty("file.separator") // ����ת���
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