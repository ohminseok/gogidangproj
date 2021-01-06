<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
    <head>
        <title>로그인</title>
        <meta charset="utf-8">
        <script>
			function check_input()
			{
				var str, i, ch;
				// 아이디 체크 ----> 
				if (document.loginform.u_id.value == "")
				{
					alert("아이디를 입력하세요!!!");
					document.loginform.u_id.focus();
					return;
				}
				else
				{
					str = document.loginform.u_id.value;
					
					for (i=0; i<str.length; i++)
					{
						ch = str.substring(i, i+1);
						if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
								|| (ch >= "A" && ch <= "Z")))
						{
							alert("특수문자가 포함, 다시 입력!!!");
							document.loginform.u_id.focus();
							return;
						}
					}
				} // 아이디 체크 <------
				
				// 패스워드 체크 ------>
				if (document.loginform.u_pw.value == "")
				{
					alert("패스워드를 입력하세요!!!");
					document.loginform.u_pw.focus();
					return;
				}
				else
				{
					str = document.loginform.u_pw.value;
					
					for (i=0; i<str.length; i++)
					{
						ch = str.substring(i, i+1);
						if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
								|| (ch >= "A" && ch <= "Z")))
						{
							alert("특수문자가 포함, 다시 입력!!!");
							document.loginform.u_pw.focus();
							return;
						}
					}
				} // 패스워드 체크 <------
				
				loginform.submit();
			}
		</script>
    </head>

    <body>
        <form name="loginform" action="./login.me" method="post">
            <table border=1>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=5>로그인 페이지</font></b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <b><font size=5>로그인 페이지</font></b>
                    </td>
                </tr>
                <tr>
                    <td>아이디 : </td>
                    <td><input type="text" name="u_id"/></td>
                </tr>
                <tr>
                    <td>비밀번호 : </td>
                    <td><input type="password" name="u_pw"/></td>
                </tr>
                <tr>
                    <td colspan="2" align=center>
                        <a href="javascript:check_input()">로그인</a>&nbsp;&nbsp;
                        <a href="./joinForm.me">회원가입</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>