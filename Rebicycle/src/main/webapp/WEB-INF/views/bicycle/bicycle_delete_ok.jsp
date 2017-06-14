<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<br><br><br>
    <div id="signupbox" style=" margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">자전거 삭제</div>
            </div>
            <div class="panel-body" > 
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/member/passwordCheck.do">
				   	<br><br>비밀번호를 입력하세요<br><br>
				   	<input type="hidden" name="memberId" value="${param.memberId }">
				   	<input type="hidden" name="bicycleNo" value="${param.bicycleNo }">
				    <input type="password" name="password"/>
				    <input type="submit" value="확인">
				</form>
				<br><br><br><br>
			</div>
		</div>
	</div>
</div>

				 