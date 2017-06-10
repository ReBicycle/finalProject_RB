<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ------------------------------------------------------------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){
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
		$(".detailReply").click(function(){
			$(".memo").toggle();
		})
	});//ready
</script>
<br><br><br>
<div class="container"> 
	<div class="row">
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
             <table class="table table-striped table-hover ">
            <thead>
                <tr class="bg-primary">
                    <th width="0px">작성자</th>
                    <th width="0px">제목</th>
                    <th>작성일시</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.brv}" var="brv" >
                <tr>
                    <td align="left">${brv.rewriter}</td>
            	    <td align="left" class="detailReply"><a>${brv.retitle}</a></td>
                    <td align="left">${brv.redate}</td>
                </tr>
                <br>
                <tr class="memo">
                	<td>
                    <%-- <textarea placeholder="${brv.rememo}" maxlength="500" rows="4" readonly="readonly"></textarea> --%>
                    <p><h7>${brv.rememo}</h7></p>
                    </td>
                </tr>
                </c:forEach> 
                </tbody>
                </table>
                <%-- </c:forEach> --%>
           <!-- </form> -->
<!-- --------------------------------------------------------------------------------- -->
    				<br>
                  <button type="button" class="btn btn-default" id="commentBtn">commant</button>
                  <br>
                  <form action="${pageContext.request.contextPath}/commentWrite.do" method="post" id="board_comment_write">
				  	<div class="container" id="commentWrite">
    					<div>        
        					<br style="clear:both">
            				<div class="form-group col-md-5">                                
                			<label id="messageLabel" for="message">Message </label>
                			<input type="hidden" name="brdno" value="<c:out value="${requestScope.rvo.reportNo}"/>"> 
                			<input class="form-control input-sm " type="text" name="retitle">
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
                  <button type="button" class="btn btn-info" id="updateBtn">UpDate</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-danger" id="deleteBtn">Delete</button>
                  </c:if>
                  <br><br>
            </div>
         </div>
    </div>
</div>

