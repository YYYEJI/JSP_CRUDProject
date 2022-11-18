<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.crud.dao.BoardDAO"%>
<%@ page import="com.crud.file.FileUpload" %>
<%@ page import="com.crud.bean.BoardVO" %>
<%@ page import="com.crud.file.FileUpload" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.crud.bean.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	FileUpload fileUpload = new FileUpload();
	BoardDAO boardDAO = new BoardDAO();
//	FileUpload upload = new FileUpload();
//	BoardVO a = upload.uploadPhoto(request);


	BoardVO i = fileUpload.uploadPhoto(request);




	int sucess = boardDAO.insertBoard(i);

	String msg = "데이터 추가 성공 !";
	if(sucess==0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>