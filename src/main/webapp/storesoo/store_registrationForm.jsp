<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.store.StoreVO"%>
<%@ page import="com.spring.gogidang.member.MemberVO"%>
<%
	StoreVO vo = (StoreVO)session.getAttribute("StoreVO");
	MemberVO memberVO = (MemberVO)session.getAttribute("MemberVO");	
%>
<html>
<head>
<title>판매자 마이페이지</title>
<script>

</script>
</head>
<body>
<header><%=memberVO.getU_nick() %>님 </header>
<h2><a href="./storeRegForm.st">가게 정보</a></h2>
<h2><a href="./menuRegForm.st">메뉴 정보</a></h2>
<h2><a href="./storeRegForm.st">문의 관리</a></h2>
<h2><a href="./storeRegForm.st">리뷰 관리</a></h2>
<form name="storeform" action="./storeprocess.me" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>가게등록 페이지</font></b>
		</td>
	</tr>
	<tr>
	<td>메인사진 : </td> 
	<%if( vo == null || vo.getThumbnail() == null || vo.getThumbnail() == ""){ %>
	<td><input name="thumbnail" type="file" /></td>
	<%}else{ %>
	<td><span name="thumbnail" type="file" value="<%=vo.getThumbnail() %>"/><%=vo.getThumbnail() %></td>
	<%} %>
	</tr>
	<tr>
	<td>사업자등록번호  : </td>
	<%if( vo == null || vo.getS_num() == null || vo.getS_num() == ""){ %>
	<td><input type="text" name="s_num" /></td>
	<%}else{ %>
	<td><span type="text" name="s_num"  value="<%=vo.getS_num() %>"/><%=vo.getS_num() %></td>
	<%} %>
	</tr>
	<tr>
	<td>사업자등록증  : </td>
	<%if( vo == null|| vo.getS_img() == null || vo.getS_img() == ""){ %>
	<td><input name="s_img" type="file"/></td>
	<%}else{ %>
	<td><span name="s_img" type="file" value="<%=vo.getS_img() %>"/><%=vo.getS_img() %></td>
	<%} %>
	</tr>
	<tr>
	<td>가게이름 </td>
	<%if( vo == null|| vo.getS_name() == null || vo.getS_name() == ""){ %>
	<td><input name="s_name" type="text"/></td>
	<%}else{ %>
	<td><input type="text" name="s_name" value="<%=vo.getS_name() %>"/></td>
	<%} %>
	</tr>
	<tr>
	<td>가게주소  : </td>
	<%if( vo == null|| vo.getS_addr() == null || vo.getS_addr() == ""){ %>
	<td><input name="s_addr" type="text"/></td>
	<%}else{ %>
	<td><input type="text" name="s_addr" value="<%=vo.getS_addr() %>"/></td>
	<%} %>
	</tr>
	<tr>
	<td>가게전화번호  : </td>
	<%if( vo == null|| vo.getS_phone() == null || vo.getS_phone() == ""){ %>
	<td><input name="s_phone" type="text"/></td>
	<%}else{ %>
	<td><input type="text" name="s_phone" value="<%=vo.getS_phone() %>"/></td>
	<%} %>
	</tr>
	<tr>
	<td>가게운영시간  : </td>
	<%if( vo == null|| vo.getS_hour() == null || vo.getS_hour() == ""){ %>
	<td><input name="s_hour" type="text"/></td>
	<%}else{ %>
	<td><input type="text" name="s_hour" size=30 value="<%=vo.getS_hour() %>"/></td>
	<%} %>
	</tr>
	<tr>
	<td>배달가능여부  : </td>
	<td><input type="radio" name="delibery" value="0" checked/>불가능
		<input type="radio" name="delibery" value="1"/>가능</td>
	</tr>
	<tr>
		<td colspan="2" align=center>
	<%if( vo == null || vo.getS_num() == null || vo.getS_num() == ""){ %>
			<a href="javascript:storeform.submit()">저장</a>&nbsp;&nbsp;
	<%}else{ %>
			<a href="javascript:storeform.submit()">수정</a>
	<%}%>
			<a href="javascript:storeform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>