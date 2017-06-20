<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ------------------------------------------------------------------------------------- -->
<script type="text/javascript">
	$(document).ready(function(){		
		$(".updateCommentArea").hide(); // 댓글 업데이트 textarea를 숨긴다
		$("#commentWrite").hide(); // 댓글 작성 폼을 숨긴다
		$(".memo").hide(); // 댓글 수정 textarea를 숨긴다
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
		$(".updateBtn-primary").click(function(){
			$(this).parent().parent().next().children(".updateCommentArea").toggle();
			// 클래스가 아닌 아이디로 하면 상위 하나의 textarea만 작동하며
			// 클래스를 줘도 모든 리스트의 textarea가 나와버리므로 위처럼 만들어 줬다.
		});// updateBtn-primary click
		$(".btnCommentUpdate").click(function(){
			if(confirm("댓글을 수정하시겠습니까?"))
				$(this).parent(".boardCommentUpdate").submit();
		});//btnCommentUpdate click
		$(".btn-delete").click(function(){
			if(confirm("댓글을 삭제하시겠습니까?"))
				$(this).parent(".boardCommentDelete").submit();
		});
		
		 $('[data-toggle="tooltip"]').tooltip();  // 수정,삭제 등 버튼에 마우스 오버상태에 뜨는 툴팁
		
	});//ready
</script>
<div class="container">
<br><br><br><br><br><br>
	<div class="row">
		<div class="col-sm-6">
				<h3 class="title text-center" style="margin-top: 0px;"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;게시글 내용</h3>
					<br>
					<div class="form-group">
						<h5>제목</h5> <input class="form-control" value="${rvo.reportTitle}"
							name="reportTitle" type="text" readonly="readonly" />
					</div>
				<div class="col-sm-6">
					<div class="form-group">
						<h5>신고 날짜</h5><input class="form-control"
							value="${requestScope.rvo.reportDate}" type="text"
							name="reportDate" readonly="readonly" />
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group">
						<h5>피해자</h5><input class="form-control"
							value="${requestScope.rvo.reporterId}" name="reporterId"
							type="text" readonly="readonly" />
					</div>
				</div>	
				<div class="col-sm-3">
					<div class="form-group">
						<h5>피의자</h5><input class="form-control"
							value="${requestScope.rvo.blackId}" type="text" name="blackId"
							readonly="readonly" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<h5>내용</h5>
					<textarea class="form-control" name="contents" cols="40" rows="5"
						readonly="readonly">${requestScope.rvo.contents}</textarea>
				</div>
			<div>
				<c:if test="${requestScope.rvo.reporterId==sessionScope.mvo.id}">
				<!-- 글 작성자와 로그인된 계정이 같아야만 수정 삭제 버튼이 뜬다. -->
					<button type="button" class="btn btn-info" id="updateBtn" style="width: 50px;" data-toggle="tooltip" title="Modify">
					<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
					</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  	<button type="button" class="btn btn-danger" id="deleteBtn" style="width: 50px;" data-toggle="tooltip" title="Delete">
                  	<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                 	 </button>
				</c:if>
			</div>
		</div>
		<div class="col-sm-6">
		<h3 class="title text-center" style="margin-top: 0px;"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;댓글</h3>
			<br>
			<div style="overflow:auto;overflow-x:hidden;height:295px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>작성자 ID</th>
						<th>내용</th>
						<th>날짜</th>
						<th colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span></th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${requestScope.brv}" var="brv">
                <tr>             
                    <td align="left">${brv.rewriter}</td>
            	    <td align="left" width="180">${brv.rememo}</td>
                    <td align="left">${brv.redate}</td>
                    <c:choose>
                    <c:when test="${brv.rewriter==sessionScope.mvo.id}">
                    <td><span class="updateBtn-primary glyphicon glyphicon-edit" aria-hidden="true"></span></td>
                    <td>	
                    	<form action="${pageContext.request.contextPath}/boardCommentDelete.do" method="post" class="boardCommentDelete">
                    	<!-- 삭제는 해당 댓글의 정보가 다 필요해서 뷰에는 보이지 않게끔 설정 해주었다. -->
                			<input type="hidden" name="brdno" value="<c:out value="${brv.brdno}"/>">
                			<input type="hidden" name="reno" value="<c:out value="${brv.reno}"/>">
                			<input type="hidden" name="rewriter" value="<c:out value="${brv.rewriter}"/>">
                			<input type="hidden" name="rememo" value="<c:out value="${brv.rememo}"/>">
            	    		<input type="hidden" name="redate" value="<c:out value="${brv.redate}"/>">
            	    		<span class="btn-delete updateBtn-primary glyphicon glyphicon-trash" aria-hidden="true"></span>
            	    	</form>
            	    </td>
            	    </c:when>
            	    <c:otherwise><td></td><td></td></c:otherwise>
            	   </c:choose>

                </tr>
                <tr align="left">
                	<td colspan="5" class="updateCommentArea">
                	<!-- 댓글 수정은 내용만 수정하면 되기때문에 rememo만 보여주고 나머지는 다 숨겨놓는다. -->
                		<form action="${pageContext.request.contextPath}/boardCommentUpdate.do" method="post" class="boardCommentUpdate">
                			<input type="hidden" name="brdno" value="<c:out value="${brv.brdno}"/>">
                			<input type="hidden" name="reno" value="<c:out value="${brv.reno}"/>">
                			<input type="hidden" name="rewriter" value="<c:out value="${brv.rewriter}"/>">
            	    		<textarea style="resize: none" cols="62" rows="5" name="rememo">${brv.rememo}</textarea>
            	    		&nbsp;&nbsp;&nbsp;<span class="btnCommentUpdate glyphicon glyphicon-ok" aria-hidden="true"></span>
            	    		<input type="hidden" name="redate" value="<c:out value="${brv.redate}"/>">
            	    	</form>
            		</td>
            	</tr>

                </c:forEach> 
				</tbody>
			</table>
			</div>
<!-- --------------------------------------------------------------------------------- -->
    				<br>
                  <span id="commentBtn" class="btn btn-default glyphicon glyphicon-plus" aria-hidden="true" style="width: 50px;" data-toggle="tooltip" title="Write Review"></span>               
                  <br>
              
                  <div align="center">
                  <form action="${pageContext.request.contextPath}/commentWrite.do" method="post" id="board_comment_write" style="float:center;">
				  	<div id="commentWrite">
    					<div>        
        					<br style="clear:both">
                			<label id="messageLabel" for="message">Message</label>
                			<input type="hidden" name="brdno" value="<c:out value="${requestScope.rvo.reportNo}"/>"> 
                			<input class="form-control input-sm " type="text" name="rewriter" value="${sessionScope.mvo.id}" readonly="readonly">
                			<textarea class="form-control input-sm " type="textarea" id="message" name="rememo" placeholder="Message" maxlength="140" rows="7"></textarea>
        					<br style="clear:both">
        					<span id="registComment"" class="btn btn-default glyphicon glyphicon-pencil" aria-hidden="true" style="width: 50px;" data-toggle="tooltip" title="Register"></span>
					</div>
					</div>					
                  </form>
				</div>
                  <br><br>
          </div>
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
         <br><br><br><br><br><br>
    </div>