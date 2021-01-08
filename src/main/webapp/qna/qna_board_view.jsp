<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.gogidang.qna.*" %>
<%@ page import="com.spring.gogidang.member.*" %> 
<!DOCTYPE html>
<%
	MemberVO membervo = (MemberVO)session.getAttribute("MemberVO");
	String u_id=(String)membervo.getU_id();
	
	QnaVO qna = (QnaVO)request.getAttribute("qna");
%>

<html>
<head>
	<title>MVC 게시판</title>

</head>

<body>
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">문의 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=qna.getTitle()%>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%=qna.getContent() %>
					</td>
				</tr>

			</table>
	<tr>
		<td style="font-family:돋음; font-size:12">
	<div align="center">비밀번호</div>
		<td>
			<input readonly type="password" name="qna_password" cols="10" rows="15"  value="<%=qna.getQna_password() %>" />
			
		</td>
		</td>
	</tr>
		<tr>
		<td style="font-family:돋음;font-size:12">
	<div align="center">비밀번호 확인</div>
		<td>
			<input type="password" name="qna_password1" cols="10" rows="15" />
			
		</td>
		</td>
	</tr>

	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			 <%if(u_id!=null && u_id.equals("admin")){%>
				<a href="./qnareplyform.qn?qna_num=<%=qna.getQna_num() %>">
				[답변]
				</a>&nbsp;&nbsp;
				
			<%}%>
			
			
			<a onclick="return qnacheck()" href="./qnamodifyform.qn?qna_num=<%=qna.getQna_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a onclick="return qnacheck()" href="./qnadelete.qn?qna_num=<%=qna.getQna_num() %>"
			>
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./qnalist.qn">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<script type="text/javascript">
/* 	document.addEventListener('DOMContentLoaded', function(){
		
		
	}) */
	function qnacheck() {
		
	
		var p1 = document.querySelector('input[name="qna_password"]').value;
		var p2 = document.querySelector('input[name="qna_password1"]').value;
		
		if(p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
		
			return false;
		} else {
			alert("비밀번호가 일치합니다");
			

			return true;
		}
	}
</script>

</body>
</html>