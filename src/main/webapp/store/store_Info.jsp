<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>  
<%@ page import="com.spring.gogidang.menu.*" %>
<%@ page import="com.spring.gogidang.review.* " %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<%
	ArrayList<MenuVO> menu_List = (ArrayList<MenuVO>)request.getAttribute("menuList");
	ArrayList<ReviewVO> review_List = (ArrayList<ReviewVO>)request.getAttribute("reviewList");
%>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align=center>
	<tr>
		<td rowspan=5>${storeVO.getThumbnail()}</td>
		<td>${storeVO.getS_addr()}</td>
	</tr>
	<tr>
		<td>${storeVO.getS_phone()}</td>
	</tr>
	<tr>
		<td>${storeVO.getS_hour()}</td>
	</tr>
	<tr>
		<td>${storeVO.getDelibery()}</td>
	</tr>
	</table>
	
	 <table align=center>
		<tr>
			<%
				for(int i=0; i<menu_List.size(); i++)
				{
					MenuVO vo =(MenuVO)menu_List.get(i);
				
			%>
			<tr>
			<td><%=vo.getImg() %></td>
			<td><%=vo.getMenu_name() %></td>
			<td><%=vo.getGram() %></td>
			<td><%=vo.getGrade() %></td>
			<td><%=vo.getPrice() %></td>
			<td>
			</tr>
			<%} %>
		</tr>
		
		<tr>
			<table border=1 align=cente>
			<tr>
			<%
				for(int i=0; i<review_List.size(); i++)
				{
					ReviewVO vo1 =(ReviewVO)review_List.get(i);
				
			%>
			<td><%=vo1.getPhoto1() %></td>
			<td><%=vo1.getStar() %></td>
			<td><%=vo1.getTitle() %>
			<%} %>
			</tr>
			</table>
		</tr>
	</table>
</body>
</html>