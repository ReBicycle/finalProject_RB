<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Header -->
    <%-- <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="intro-text" >
                    <h3 class="name"></h3>
                        <span style="color:black"> --%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){ 
		var id=$("#blackId").val();
		if($("#blackId").val()==""){
			alert("사기꾼 아이디를 입력해주세요!");
		}else if($("#content").val()==""){
			alert("본문을 입력하세요!");
		}else{
			$("#board_write_from").submit();
		}
		/* $.ajax({
			type:"post",
			url:"idCheck.do",
			data:"id="+id,
			success:function(data){
				if(data=="ok")
					alert("鬼神");
				return false;
			}//success 
		});//ajax */
	});//writeBtn click
	$("#resetBtn").click(function(){    		
		$("#board_write_from")[0].reset();
	});// resetBtn click
});	//ready
</script>
						<br><br>
                        <div>
                        <br><br>
                       		<form action="${pageContext.request.contextPath}/write.do" method="post" id="board_write_from">
                       			<font size="3">Title &nbsp;</font><input type="text" name="reportTitle" id="reportTitle" size="70"><br><br><br>
                       			<font size="3">Swindler ID</font> <input type="text" name="blackId" id="blackId">
                       			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       			<font size="3">Reporter ID</font> <input type="text" name="reporterId" id="reporterId" value="${sessionScope.mvo.id}" readonly="readonly"><br><br>
                       			<span id="checkResult"></span>
                       			<br><br>
                       			<textarea rows="10" cols="80" id="content" name="contents"></textarea>
                       			<br><br><br>
                       			<button type="button" class="btn btn-danger" id="writeBtn">신고</button>
                       			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       			<button type="button" class="btn btn-default" id="resetBtn">취소</button>                      			
                       		</form>
                       		<br><br><br><br>
                       		</div>
                       <!-- </span>
                        <hr class="star-light"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span>
                    </div>
                </div>
            </div>
        </div>
    </header> -->