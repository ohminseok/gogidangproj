<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.qna.*" %>
<%@ page import="com.spring.gogidang.member.*" %>
<%
	MemberVO membervo = (MemberVO)session.getAttribute("MemberVO");
	String u_id=(String)membervo.getU_id();
	QnaVO qna=(QnaVO)request.getAttribute("qna"); 
%>

<html>
<head>
	<title>문의 게시판</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 답변 -->
<form action="./qnareply.qn" method="post" name="boardform">
<!-- 원글에 대한 정보 -->
<input type="hidden" name="qna_num" value="<%=qna.getQna_num() %>">
<input type="hidden" name="re_ref" value="<%=qna.getRe_ref() %>"> <!-- 원글의 글그룹번호 -->
<input type="hidden" name="re_lev" value="<%=qna.getRe_lev() %>">
<input type="hidden" name="re_seq" value="<%=qna.getRe_seq() %>">
<input type="hidden" name="u_id" value="<%=u_id %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<%=u_id %>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="title" type="text" size="50" 
				maxlength="100" value="Re: <%=qna.getTitle() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="content" cols="67" rows="15"></textarea>
		</td>
	</tr>
			<td style="font-family:돋음; font-size:12">
	<div align="center">비밀번호</div>
		<td>
			<input type="password" name="qna_password" cols="10" rows="15" />
			
		</td>
		</td>
	</tr>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>