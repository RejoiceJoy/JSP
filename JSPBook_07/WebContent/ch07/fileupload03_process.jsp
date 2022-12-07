<%@page contentType="text/html; charset=utf-8"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<title>File Upload</title>
</head>
<body>
	<%
		String fileUploadPath = "C:\\upload";	//경로 찍고

		DiskFileUpload upload = new DiskFileUpload();		//이게 뭐라고??????????????

		List items = upload.parseRequest(request);

		Iterator params = items.iterator();

		while (params.hasNext()) {
			FileItem fileItem = (FileItem) params.next();
			if (!fileItem.isFormField()) {
				String fileName = fileItem.getName();
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
				File file = new File(fileUploadPath + "/" + fileName);
				//업로드 되는 시점 컨트롤 할 수 있음
				fileItem.write(file);		//write() >>파일 관련 자원을 저장
			}//end if
		}//end while
	%>
</body>
</html>