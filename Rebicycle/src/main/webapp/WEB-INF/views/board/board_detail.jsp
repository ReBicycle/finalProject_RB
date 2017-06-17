<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ------------------------------------------------------------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){
		$(".updateCommentArea").hide();
		$("#commentWrite").hide();
		$(".memo").hide();
		$("#updateBtn").click(function(){
			if(confirm("게시글을 수정하시겠습니까?"))
				location.href="${pageContext.request.contextPath}/boardUpdateReportView.do?reportNo=${requestScope.rvo.reportNo}";
		});//upadteBtn click
		$("#deleteBtn").click(function(){
			if(confirm("게시글을 삭제하시겠습니까?"))
				location.href="${pageContext.request.contextPath}/deleteReport.do?reportNo=${requestScope.rvo.reportNo}";
		});//deleteBtn
		$("#commentBtn").click(function(){
			$("#commentWrite").toggle();
		});//commantBtn clack
		$("#registComment").click(function(){
			$("#board_comment_write").submit();
		});//registComment click
		/* $(this).parent().parent().children(".reno").text().on("click",".updateBtn-primary",function(){
			if(confirm("댓글을 수정하시겠습니까?"))
					location.href="${pageContext.request.contextPath}/boardReplyUpdateView.do?reno=$(this).parent().parent().children(".reno").text()";
		});//btn-primary click */
		$(".updateBtn-primary").click(function(){
			$(this).parent().parent().next().children(".updateCommentArea").toggle();
			/* alert($(this).parent().parent().children(".reno").text()); */
		});// updateBtn-primary click
		/* $(".updateBtn-primary").click(function(){
			alert(1);
			$(this).parent().parent().next().children(".updateCommentArea").toggle();
		}); */
		$(".btnCommentUpdate").click(function(){
			if(confirm("댓글을 수정하시겠습니까?"))
				$(this).parent(".boardCommentUpdate").submit();
		});//btnCommentUpdate click
		$(".btn-danger").click(function(){
			if(confirm("댓글을 삭제하시겠습니까?"))
				$(this).parent(".boardCommentDelete").submit();
		});
	});//ready
</script>
<br><br><br>
<div class="container"> 
	<div c	lass="row">
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
<!-- ----------------------------------------------------------------------------------- -->
			<%-- <form action="${pageContext.request.contextPath}/getReplyList.do" name="getReplyList" method="get"> --%>
			<%-- <input type="hidden" name="brdno" value="<c:out value="${requestScope.rvo.reportNo}"/>"> --%> 
			<%-- <c:forEach var="brv" items="${}"> --%>
             <table class="table table-striped table-hover " id="comment">
            <thead>
                <tr class="bg-primary">
                	<th width="20">NO</th>
                    <th width="70">작성자</th>
                    <th width="200">내용</th>
                    <th width="50">작성일시</th>
                    <th width="80"></th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.brv}" var="brv">
                <tr>
                	<td align="left" class="reno" width="20">${brv.reno}</td>
                    <td align="left" width="30">${brv.rewriter}</td>
            	    <td align="left" width="250">${brv.rememo}</td>
                    <td align="left" width="50">${brv.redate}</td>
                    <td>
                    <c:if test="${brv.rewriter==sessionScope.mvo.id}">
                    	<button type="button" class="updateBtn-primary">수정</button><br>
                    	<form action="${pageContext.request.contextPath}/boardCommentDelete.do" method="post" class="boardCommentDelete">
                			<input type="hidden" name="brdno" value="<c:out value="${brv.brdno}"/>">
                			<input type="hidden" name="reno" value="<c:out value="${brv.reno}"/>">
                			<input type="hidden" name="rewriter" value="<c:out value="${brv.rewriter}"/>">
                			<input type="hidden" name="rememo" value="<c:out value="${brv.rememo}"/>">
            	    		<input type="hidden" name="redate" value="<c:out value="${brv.redate}"/>">
            	    		<button type="button" class="btn-danger">삭제</button>
            	    	</form>
            	    </c:if>
            	    </td>
                </tr>
                
                <tr align="left">
                	<td colspan="5" class="updateCommentArea">
                		<form action="${pageContext.request.contextPath}/boardCommentUpdate.do" method="post" class="boardCommentUpdate">
                			<input type="hidden" name="brdno" value="<c:out value="${brv.brdno}"/>">
                			<input type="hidden" name="reno" value="<c:out value="${brv.reno}"/>">
                			<input type="hidden" name="rewriter" value="<c:out value="${brv.rewriter}"/>">
            	    		<textarea style="resize: none" cols="62" rows="5" name="rememo">${brv.rememo}</textarea><br>
            	    		<input type="hidden" name="redate" value="<c:out value="${brv.redate}"/>">
            	    		<button type="button" class="btnCommentUpdate">수정 완료</button>
            	    	</form>
            		</td>
            	</tr>
                <%-- <tr>
                	<td colspan="3"><textarea class="updateCommentArea">${brv.rememo}</textarea></td>
                </tr> --%>

                </c:forEach> 
                </tbody>
                </table>
<!-- --------------------------------------------------------------------------------- -->
    				<br>
                  <button type="button" class="btn btn-default" id="commentBtn">comment</button>
                  <br>
                  <form action="${pageContext.request.contextPath}/commentWrite.do" method="post" id="board_comment_write">
				  	<div class="container" id="commentWrite">
    					<div>        
        					<br style="clear:both">
            				<div class="form-group col-md-5">                                
                			<label id="messageLabel" for="message">Message </label>
                			<input type="hidden" name="brdno" value="<c:out value="${requestScope.rvo.reportNo}"/>"> 
                			<!-- <input class="form-control input-sm " type="text" name="retitle" placeholder="Title"> -->
                			<input class="form-control input-sm " type="text" name="rewriter" value="${sessionScope.mvo.id}" readonly="readonly">
                			<textarea class="form-control input-sm " type="textarea" id="message" name="rememo" placeholder="Message" maxlength="140" rows="7"></textarea>
            				</div>
        					<br style="clear:both">
        					<div class="form-group col-md-5">
        					<button type="button" class="btn btn-info" id="registComment">댓글 등록</button>
    					</div>
					</div>
					</div>
                  </form>

                  <hr>
                  <c:if test="${requestScope.rvo.reporterId==sessionScope.mvo.id}">
                  <button type="button" class="btn btn-info" id="updateBtn">수정</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
                  </c:if>
                  <br><br>
            </div>
         </div>
    </div>
    
    

</div>

