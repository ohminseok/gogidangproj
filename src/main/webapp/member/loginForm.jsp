<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>


</head>
<body>
<form name="loginForm" action="./login.me" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>로그인 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="u_id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="u_pw"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:loginForm.submit()">로그인</a>&nbsp;&nbsp;
			<a href="./joinForm.me">회원가입</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>