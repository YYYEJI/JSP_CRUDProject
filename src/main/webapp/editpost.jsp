<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO"%>
<%@ page import="com.crud.bean.BoardVO" %>
<%@ page import="com.crud.file.FileUpload" %>
<%--<%@ page import="com.crud.file.FileUpload" %>--%>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.crud.bean.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");
	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();

	BoardVO v = upload.uploadPhoto(request);
	int i = boardDAO.updateBoard(v);
	String msg = "데이터 수정 성공 !";
	if(i == 0) msg = "[에러] 데이터 수정 실패 !";
%>
<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>