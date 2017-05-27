<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
table, td, th {    
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 50%;
}
th, td {
    padding: 15px;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reportBtn").click(function(){
			location.href="${pageContext.request.contextPath}/board/board_write_from.do";
		});//click
	});//ready
</script>
    <!-- Header -->
   <%--  <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="intro-text" >
                    <h3 class="name"></h3> --%>
                        <!-- <span style="color:black"> -->
                        <div align="center">
                       		<table class="list">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="no" align="center">NO</th>
			<th class="swindler" align="center">신고 ID</th>
			<th class="reporter" align="center">작성자</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="rvo" items="${requestScope.lvo.board_list}">		
			<tr>
			    <td>${rvo.reportNo}</td>				
				<td>${rvo.reporterId}</td>
				<td>${rvo.blackId}</td>
			</tr>
			</c:forEach>	
		</tbody>					
	</table>
	<%-- <a href="${pageContext.request.contextPath}/board/board_write_from.do">신고하기</a> --%>
	<br>
	<button type="button" class="btn btn-warning" id="reportBtn">신고하기</button>
	</div>
                       <!-- </span> -->
                        
                        <!-- <hr class="star-light"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                   <!--  </div>
                </div>
            </div>
        </div>
    </header> -->