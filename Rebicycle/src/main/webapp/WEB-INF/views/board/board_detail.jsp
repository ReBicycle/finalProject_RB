<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<br><br>
	<table class="content">
		<tr>
			<td>NO : ${requestScope.rvo.reportNo} </td>
			<td colspan="2">TITLE : ${requestScope.rvo.reportTitle} </td>
		</tr>
		<tr>
			<td>신고작성자 :  ${requestScope.rvo.reporterId}</td>
			<td>신고대상: ${requestScope.rvo.blackId}</td>
			<td> ${requestScope.rvo.reportDate}</td>
		</tr>
		 <tr>
			<td colspan="3">
			<pre>${requestScope.rvo.contents}</pre>
			</td>
		</tr>
		<%--<tr>
			<td valign="middle" align="center" colspan="3">
			 <img id="listImg" class="action" src="${pageContext.request.contextPath}/resources/img/list_btn.jpg" onclick="sendList()" >
			 <c:if test="${requestScope.bvo.memberVO.id==sessionScope.mvo.id}">
			 <img id="deleteImg" class="action"  onclick="deleteBoard()" src="${pageContext.request.contextPath}/resources/img/delete_btn.jpg" > 
			 <img id="updateImg" class="action"  onclick="updateBoard()" src="${pageContext.request.contextPath}/resources/img/modify_btn.jpg" >
			 </c:if>
			 <br><br>			
			 </td>
		</tr> --%>
	</table>