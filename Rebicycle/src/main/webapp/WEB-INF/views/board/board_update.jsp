<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){ 
		if($("#contents").val()==""){
			alert("본문을 입력하세요!");
		}else if($("#title").val()==""){
			alert("제목을 입력해주세요!!");
		}else{
			$("#updateReport").submit();
		}
	});//writeBtn click
	$("#resetBtn").click(function(){    		
		$("#board_write_from")[0].reset();
	});// resetBtn click
});	//ready
</script>
<!-- ------------------------------------  구분선  ----------------------------------------- -->
<div class="container">
<br><br><br>
    <form action="${pageContext.request.contextPath}/updateReport.do" method="post" id="updateReport">
        <div class="container"> <div class="row">
         <div class="col-md-6 col-md-offset-3">
            <div class="well text-center">
                  <div class="form-group">
                     NO <input class="form-control" value="${rvo.reportNo}" name="reportNo" type="text" readonly="readonly"/>
                  </div>
                  <br>
                  <div class="form-group">
                     Title <input class="form-control" value="${rvo.reportTitle}" name="reportTitle" type="text"/>
                  </div>
                  <br>
                  <div class="form-group">
                     Reporter ID <input class="form-control" value="${requestScope.rvo.reporterId}" name="reporterId" type="text" readonly="readonly"/>
                  </div>
					<br>                  
                  <div class="form-group">
                     BlackID<input class="form-control" value="${requestScope.rvo.blackId}" name="blackId" type="text"/>
                  </div>
                  <div class="form-group">
                     Data <input class="form-control" value="${requestScope.rvo.reportDate}" name="reportDate" type="text" readonly="readonly"/>
                  </div>
                  <div class="form-group">
                     Content <textarea class="form-control" cols="40" name="contents" rows="5">${requestScope.rvo.contents}</textarea>
                  </div>
                  <%-- <c:if test="${requestScope.rvo.reporterId==sessionScope.mvo.id}">
                  <button type="button" class="btn btn-info" id="updateBtn">UpDate</button>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-danger" id="deleteBtn">Delete</button>
                  </c:if> --%>
            </div>
         </div>
     </div>
</div>
        <br>
        <button type="button" class="btn btn-success btn-lg btn3d" id="writeBtn"><span class="glyphicon glyphicon-ok"></span>신고하기</button>
        <button type="button" class="btn btn-danger btn-lg btn3d" id="resetBtn"><span class="glyphicon glyphicon-remove" ></span>취소</button>
    </form>
    <br><br><br>
</div>