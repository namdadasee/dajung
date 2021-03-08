<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 회원가입 페이지</title>
<style>
   table{
   margin:auto;
   width:600px;
   border:1px solid gray;
   text-align:center;
   }
   .td_title{
   font-weight:bold;
   font-size:x-large;
   }
</style>
<script>
var chkId=false;
var idcheck;

function formCheck(f){
   if(!chkId || idcheck!=f.id.value.trim()){
      alert("아이디 중복 확인 하세요!");
      return false;
   }


   if(f.pass.value.trim()==""){
      alert("비밀번호를 입력하세요!");
      f.pass.value="";
      f.pass.focus();
      return false;
   }
   if(f.pass.value.length < 5 || f.pass.value.lenghth > 10) {
      alert("비밀번호는 5~10자로 설정하세요")
      f.pass.value="";
      f.pass.focus();
      return false;
   }
   if(f.pass.value.trim() != f.passchk.value.trim()){
      alert("비밀번호가 일치하지 않습니다.");
      f.pass.value="";
      f.passchk.value="";
      f.pass.focus();
      return false;
   }
   
   if(isNaN(f.age.value)){
      alert("나이를 입력하세요!");
      f.age.value="";
      f.age.focus();
   }
   
   if(f.email.value.trim()==""){
      alert("이메일 주소를 입력하세요!");
      f.email.value="";
      f.email.focus();
      return false;
   }
   //f.submit();
}
</script>

</head>
<body>
<form name="joinform" action="joinProcess.mem" method="post">
<table border=1>
   <tr>
      <td colspan="2" class="td_title">
      회원가입 페이지
      </td>
   </tr>
   <tr>
      <td><label for="id">아이디 : </label></td>
      <td align=left><input type="text" name="id" id="id" required/>
         <input type="button" value="아이디 중복 확인" id="idCheck" onclick="window.open('idCheck.jsp?openInit=ture','','width=300,height=200')"/>
      </td>
   </tr>
   <tr>
      <td><label for="pass">비밀번호 : </label></td>
      <td align=left><input type="password" name="pass" id="pass"/></td>
   </tr>
   <tr>
      <td><label for="passchk">비밀번호 확인 : </label></td>
      <td align=left><input type="password" name="pass" id="pass"/></td>
   </tr>
   <tr>
      <td><label for="name">이름 : </label></td>
      <td align=left><input type="text" name="name" id="name"/></td>
   </tr>
   <tr>
      <td><label for="age">나이 : </label></td>
      <td align=left><input type="text" name="age" id="age"/></td>
   </tr>
   <tr>
      <td><label for="gender1"></label>성별 : </td>
      <td align=left>
      <input type="radio" name="gender" value="여" checked id="gender1"/>여자
      <input type="radio" name="gender" value="남" id="gender2"/>남자
      </td>
   </tr>
   <tr>
      <td><label for="email">이메일 주소 : </label></td>
      <td align=left><input type="text" name="email" id="email"/></td>
   </tr>
   <tr>
      <td><label for="post">우편번호 : </label></td>
      <td align=left><input type="text" name="post" id="post"/>
      <input type="button" name="zipSearch" value="검색" id="zipSearch" onclick="window.open('zip.jsp','','width=800, height=600')"/>
      </td>
   </tr>
   <tr>
      <td><label for="addr">주소 : </label></td>
      <td align=left><input type="text" name="addr" id="addr"/></td>
   </tr>
   <tr>
      <td><label for="addr1">상세 주소 : </label></td>
      <td align=left><input type="text" name="addr1" id="addr1"/></td>
   </tr>
   <tr>
      <td colspan="2"><input type="submit" value="전송"/>
         <a href="javascript:joinform();">회원가입</a>&nbsp;&nbsp;
         <a href="javascript:joinform.reset">다시작성</a>
</table>
</form>
</body>
</html>