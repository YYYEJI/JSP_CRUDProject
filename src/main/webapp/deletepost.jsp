<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.BoardDAO, com.crud.bean.BoardVO"%>
<%@ page import="com.crud.file.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BoardVO u = new BoardVO();

//		String filename = u.getPhotoFilename(id);
//		if(filename != null)
//			FileUpload.deleteFile(request, filename);

		u.setSeq(id);
		BoardDAO boardDAO = new BoardDAO();
//		String filename = memberDAO.getPhotoFilename(id);
//		if(filename != null)
//			FileUpload.deleteFile(request, filename);
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>