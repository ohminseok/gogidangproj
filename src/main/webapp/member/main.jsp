<%@page import="com.spring.gogidang.store.StoreVO"%>
<%@page import="com.spring.gogidang.event.EventVO"%>
<%@page import="com.spring.gogidang.review.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%

	String u_id=null;

	if (session.getAttribute("u_id")!=null){
		u_id=(String)session.getAttribute("u_id");
	}else{
		out.println("<script>");
		out.println("location.href='loginform.me'");
		out.println("</script>");
	}
	
	ArrayList<EventVO> event_list =(ArrayList<EventVO>) request.getAttribute("event_list");
	ArrayList<StoreVO> store_list =(ArrayList<StoreVO>) request.getAttribute("store_list");
	ArrayList<ReviewVO> review_list =(ArrayList<ReviewVO>) request.getAttribute("review_list");
%>
<html>
<head>
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>
<a href="./loginForm.me">로그인</a>
<a href="./joinForm.me">회원가입</a>
<h3><%=u_id %> 로 로그인하셨습니다.</h3>

<center>
	<h3>이벤트 메인사진</h3>
			<table border=1 width=300>
				
					<%
						for (int i=0; i<event_list.size(); i++)
							{
							EventVO vo = (EventVO)event_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="eventinfo.ev?event_num=<%=vo.getEvent_num()%>"><%=vo.getThumbnail() %>
						</td>
					</tr>
					<%
							} 
					%>
				
				
			</table>
			<h3>가게 메인사진</h3>
			<table border=1 width=300>
				
					<%
						for (int i=0; i<store_list.size(); i++)
							{
							StoreVO vo1 = (StoreVO)store_list.get(i);
					%>
					<tr align=center>
						<td colspan=2>
							<a href="storeInfo.st?s_num=<%=vo1.getS_num()%>"><%=vo1.getThumbnail() %>
						</td>
					</tr>	
					<%
							} 
					%>
				
				</table>
				<h3>리뷰 닉네임,사진,등록날짜,별점</h3>
				<table border=1 width=300>
				<tr align=center>
				<td colspan=2>
					<%
						for (int i=0; i<review_list.size(); i++)
							{
							ReviewVO vo2 = (ReviewVO)review_list.get(i);
					%>
						<%=vo2.getNickname() %>
						<%=vo2.getPhoto1() %>
						<%=vo2.getRe_date() %>
						<%=vo2.getStar()%>
					<%
							} 
					%>
				</td>
				</tr>
			</table>
			<a href="./eventpage.ev">이벤트 페이지</a>
		</center>
</p>
</body>
</html>