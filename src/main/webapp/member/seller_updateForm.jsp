<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.gogidang.member.MemberVO"%>
<%
	MemberVO vo = (MemberVO)session.getAttribute("MemberVO");
	
	if (vo == null){ //판매자인지 소비자인지 확인할때 쓸것 //if 부분 수정필요함 안씀
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>"); 
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 마이페이지</title>
</head>
<header><%=vo.getU_nick() %>님 안녕하세요.</header>
<h2><a href="./storeRegForm.st">가게 정보</a></h2>
<h2><a href="./menuRegForm.st">메뉴 정보</a></h2>
<h2><a href="./storeRegForm.st">문의 관리</a></h2>
<h2><a href="./storeRegForm.st">리뷰 관리</a></h2>
<body>
	<form name="updateform" action="./memberupdateprocess.me" method="post">
		<center>
			<table border=1 width=400>
				<tr>회원 정보 수정</tr>
				<tr>
					<td>아이디 :</td>
					<td><%=vo.getU_id()%></td>
					<!-- id는 수정사항에 포함되지 않기 때문에 hidden으로 설정 -->
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="u_pw" value="<%=vo.getU_pw()%>" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><%=vo.getU_name()%></td>
				</tr>
				<tr>
					<td>닉네임 :</td>
					<td><input type="text" name="u_nick" value="<%=vo.getU_nick()%>"/></td>
					
				</tr>
				<tr>
					<td>생년월일 :</td>
					<td><%=vo.getU_birth()%></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" name="u_addr" value="<%=vo.getU_addr()%>"/></td>
				</tr>	
				<tr>
					<td>이메일 주소 :</td>
					<td><input type="text" name="u_email" size=30 value="<%=vo.getU_email()%>"></td>
				</tr>
				<tr>
					<td>핸드폰 번호 :</td>
					<td><input type="text" name="u_phone" value="<%=vo.getU_phone()%>"></td>
				</tr>
				<tr align=center>
					<td colspan=2>
					<a href="javascript:updateform.submit()">수정</a>&nbsp;&nbsp;&nbsp;
					<a href="javascript:updateform.reset()">다시작성</a>
					</td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>