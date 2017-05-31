<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ------------------------------------------------------------------------------------- -->
<br><br><br>
<div class="container"> <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="well text-center">
                  <div class="form-group">
                     NO <input class="form-control" value="${requestScope.rvo.reportNo}" type="text" readonly="readonly"/>
                  </div>
                  <br>
                  <div class="form-group">
                     Reporter ID <input class="form-control" value="${requestScope.rvo.reporterId}" type="text" readonly="readonly"/>
                  </div>
					<br>                  
                  <div class="form-group">
                     BlackID<input class="form-control" value="${requestScope.rvo.blackId}" type="text" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                     Data <input class="form-control" value="${requestScope.rvo.reportDate}" type="text" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                     Content <textarea class="form-control" cols="40" rows="5" readonly="readonly">${requestScope.rvo.contents}</textarea>
                  </div>
                  <button type="submit" class="btn btn-default">Enviar</button>
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