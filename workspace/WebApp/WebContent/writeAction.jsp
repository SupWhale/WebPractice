<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Post.WebAppDAO" %>
<jsp:useBean id="Post" class="Post.Post" scope="page"/>
<jsp:setProperty name="Post" property="title" />
<jsp:setProperty name="Post" property="content" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		WebAppDAO dao = new WebAppDAO();
		dao.write(Post.getTitle(), Post.getContent(), Post.getWriter());
	%>
</body>
</html>