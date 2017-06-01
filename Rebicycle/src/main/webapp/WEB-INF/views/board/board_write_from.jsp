<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){ 
		if($("#blackId").val()==""){
			alert("사기꾼 아이디를 입력해주세요!");
		}else if($("#contents").val()==""){
			alert("본문을 입력하세요!");
		}else if($("#title").val()==""){
			alert("제목을 입력해주세요!!");
		}else{
			$("#board_write_from").submit();
		}
	});//writeBtn click
	$("#resetBtn").click(function(){    		
		$("#board_write_from")[0].reset();
	});// resetBtn click
});	//ready
</script>
<!-- ------------------------------- 부트스트랩----------------------------------------- -->

<div class="container">
<br><br><br>
    <form action="${pageContext.request.contextPath}/write.do" method="post" id="board_write_from">
        <div class="required-field-block">
            <input type="text" placeholder="Title" class="form-control" name="reportTitle" id="reportTitle">
        </div>
        <br>
        <div class="required-field-block">
        	<input type="text" placeholder="BlackID" class="form-control" name="blackId" id="blackId">
        </div>
		<br>
        	<input type="text" class="form-control" name="reporterId" id="reporterId" value="${sessionScope.mvo.id}" readonly="readonly">
        	<br>
        <div class="required-field-block">
            <textarea rows="3" class="form-control" placeholder="Message" name="contents" id="contents"></textarea>
        </div>
        <br>
        <button type="button" class="btn btn-success btn-lg btn3d" id="writeBtn"><span class="glyphicon glyphicon-ok"></span>신고하기</button>
        <button type="button" class="btn btn-danger btn-lg btn3d" id="resetBtn"><span class="glyphicon glyphicon-remove" ></span>취소</button>
    </form>
    <br><br><br>
</div>