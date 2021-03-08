<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*" %>
    <%@ page import = "javax.sql.*" %>
    <%@ page import = "javax.naming.*" %>
    <%
    if((session.getAttribute("id")==null)||(!((String)session.getAttribute("id")).equals("admin"))){
    	out.println("<script>");
    	out.println("alert('관리자로 로기인하세요!!')");
    	out.println("location.href='loginForm.jsp'");
    	out.println("</script>");
    }
    
    String mod_id=request.getParameter("id");
    
    Connection conn = null;
    PreparedStatement pstmt=null;
    ResultSet rs = null;
    
    try{
    	Context init = new InitialContext();
    	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	conn = ds.getConnection();
    	pstmt = conn.prepareStatement("SELECT * FROM member WHERE id=?");
    	pstmt.setString(1,mod_id);
    	rs=pstmt.executeQuery();
    	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align:center;
	}
	
	.td_title{
		font-weight:bold;
		font-size;
	}
</style>
</head>
<body>
<form name="modiform" action="modifyProsess.jsp" method="post">
<table border=1>
	<tr>
		<td colspan="2" class="td_title">
		회원 정보 수정 페이지
		</td>
	</tr>
	<%
	if(rs.next()){
		
	%>
	<tr>
		<td><label for="id">아이디 : </label></td>
		<td><input type="hidden" name="id" value='<%=rs.getString("id") %>' /><%=rs.getString("id") %>
		</td>
	</tr>
	<tr>
		<td><label for = "pass">비밀번호 : </label></td>
		<td><input type="password" name="pass" id="pass" value='<%=rs.getString("password")%>'/></td>
	</tr>

	<tr>
		<td><label for="name">이름 : </label></td>
		<td><input type="text" name="name" id="name" value='<%=rs.getString("name")%>'/></td>
	</tr>
	<tr>
		<td><label for="age">나이 : </label></td>
		<td><input type="text" name="age" id="age" value='<%=rs.getString("age")%>'/></td>
	</tr>
	<tr>
		<td><label for="gender1"></label>성별 : </td>
		<td>
			<input type="radio" name="gender" value="남" 
			<%=rs.getString("gender").equals("남")?"checked":"" %>
			checked id="gender1"/>남자
			<input type="radio" name="gender" value="여"
			<%=rs.getString("gender").equals("여")?"checked":"" %>
			 id="gender2"/>여자
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일 주소 : </label></td>
		<td><input type="text" name="email" 
			value='<%=rs.getString("email")%>'
		id="email"/></td>
	</tr>

	<tr>
		<td colspan="2">
			<a href="javascript:modiform.submit();">수정하기</a>&nbsp;
			<a href="javascript:modiform.reset()">초기화</a>&nbsp;
			<a href="javascript:history.go(-1);">뒤로가기</a>
			</td>
	</tr>
	<%} else{%>
	<tr>
		<td colspan="2">
			정보가 없습니다.
		</td>
	</tr>
	<%} %>
</table>
</form>
</body>
</html>
<%
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	if(rs != null)
    		rs.close();
    	if(pstmt != null)
    		pstmt.close();
    	if(conn != null)
    		conn.close();
    }
    %>