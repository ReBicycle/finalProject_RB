<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ------------------------------------------------------------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateBtn").click(function(){
			if(confirm("게시글을 수정하시겠습니까?"))
				location.href="${pageContext.request.contextPath}/boardUpdateReportView.do?reportNo=${requestScope.rvo.reportNo}";
		});//upadteBtn click
		$("#deleteBtn").click(function(){
			if(confirm("게시글을 삭제하시겠습니까?"))
				location.href="${pageContext.request.contextPath}/deleteReport.do?reportNo=${requestScope.rvo.reportNo}";
		});//deleteBtn
	});//ready
</script>
<br><br><br>
<div class="container"> <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="well text-center">
                  <div class="form-group">
                     NO <input class="form-control" value="${rvo.reportNo}" name="reportNo" type="text" readonly="readonly"/>
                  </div>
                  <br>
                  <div class="form-group">
                     Title <input class="form-control" value="${rvo.reportTitle}" name="reportTitle" type="text" readonly="readonly"/>
                  </div>
                  <br>
                  <div class="form-group">
                     Reporter ID <input class="form-control" value="${requestScope.rvo.reporterId}" name="reporterId" type="text" readonly="readonly"/>
                  </div>
					<br>                  
                  <div class="form-group">
                     BlackID<input class="form-control" value="${requestScope.rvo.blackId}" type="text" name="blackId" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                     Data <input class="form-control" value="${requestScope.rvo.reportDate}" type="text" name="reportDate" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                     Content <textarea class="form-control" name="contents" cols="40" rows="5" readonly="readonly">${requestScope.rvo.contents}</textarea>
                  </div>
                  <c:if test="${requestScope.rvo.reporterId==sessionScope.mvo.id}">
                  <button type="button" class="btn btn-info" id="updateBtn">UpDate</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-danger" id="deleteBtn">Delete</button>
                  </c:if>
            </div>
         </div>
         
         
      </div>
</div>
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