<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.qna.*" %>
<%@ page import="com.spring.gogidang.member.*" %>
<%
	MemberVO membervo = (MemberVO)session.getAttribute("MemberVO");
	String u_id=(String)membervo.getU_id();
	QnaVO qna = (QnaVO)request.getAttribute("qna");
%>

<html>
<head>
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyqna(){
		modifyform.submit();
	}
	</script>
</head>

<body>
<!-- 게시판 수정 -->
<form action="qnamodify.bo" method="post" name="modifyform">
<input type="hidden" name="qna_num" value="<%=qna.getQna_num() %>">
<input type="hidden" name="u_id" value="<%=u_id %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="title" size="50" maxlength="100" 
				value="<%=qna.getTitle()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="content" cols="67" rows="15"><%=qna.getContent() %></textarea>
		</td>
	</tr>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifyqna()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</body>
</html>