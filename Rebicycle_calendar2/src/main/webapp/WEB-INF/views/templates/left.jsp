<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 로그인 실패하면 alert 수행 후 다시 메인화면이 제공
		로그인 성공하면 아래 로그인 폼 대신 
		아이유님 로그인 
		로그아웃 링크 ( 로그아웃 링크를 누르면 다시 로그인 폼이 제공)
 --%>

<%-- 
 
      <a href="${pageContext.request.contextPath }/member/findbyid_form.do">회원검색</a>
<br><br>
 <c:choose>
 	<c:when test="${sessionScope.loginMember eq null }">
 		<form method = "post" action = "${pageContext.request.contextPath}/login.do">
 		  아이디 <input type = "text" name = "id" size = "10"><br>
  		 패스워드<input type = "password" name = "password" size = "10"><br>
  	 <input type = "submit" value = "로그인">
</form>
	<a href="${pageContext.request.contextPath}/member/register_form.do">회원가입</a>
 	</c:when>
 	<c:otherwise>
 			${sessionScope.loginMember.name }님 로그인<br>
 			<a href="${pageContext.request.contextPath }/logout.do">로그아웃</a>
 	</c:otherwise>
 </c:choose>
 <br><br>
 <a href="${pageContext.request.contextPath}/product/register_form.do">파일업로드테스트</a>
 <br><br>
 <a href="${pageContext.request.contextPath }/product/multifileupload_form.do">멀티파일 업로드</a>
 
      
  --%>
 
 
 