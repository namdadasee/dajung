<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,vo.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	ArrayList<MemberBean> list = (ArrayList<MemberBean>)request.getAttribute("");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	if(pageInfo !=null){
		
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
	
%>
<html>
<head>
<title>회원 관리 시스템 관리자 모드(회원 목록 보기)</title>
<style>
	table{
		margin:auto;
		width : 400px;
		border : 1px solid gray;
		text-align : center;
	}
	
	.td_title{
		font-weight : bold;
		font-size:x-large;
	}
</style>
</head>
<body>
	<table>
		<tr><td colspan="2" class="td_title">회원 목록</td></tr>
		<% for(int i = 0;i <list.size(); i++){ %>
		<tr>
			<td>
				<a href="member_info.jsp?id=<%=list.get(i).getId()%>">
				<%=list.get(i).getId()%></a>
				</td>
				<td><a href="memberMod.mem?id=<%=list.get(i).getId() %>">수정</a>&nbsp;&nbsp;
			<td>
				
				<a href="member_delete.jsp?id=<%= list.get(i).getId()%>">삭제</a>&nbsp;&nbsp;
				</td>
				</tr>
				<%} %>
	</table>
	
	<section id = "pageList">
		<%if(nowPage <=1){ %>
		[이전]&nbsp;
		<%}else{ %>
			<a href="memberList.mem?page="<%=nowPage -1 %>">[이전]</a>&nbsp;
			<%} %>
			<%for(int a=startPage; a <=endPage;a++){ 
				if(a==nowPage){%>
				[<%=a %>]
				<%}else { %>
				<a href="memberList.mem?page=<%=a %>&test='한글'">[<%=a %>]</a>&nbsp;
				<%} %>
				<%} %>
				<%if (nowPage >= maxPage){ %>
				[다음]
				<%}else{ %>
				<a href="memberList.mem?page=<%=nowPage+1 %>">[다음]</a>
				<%}} %>
	</section>
</body>
</html>