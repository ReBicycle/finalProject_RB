<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
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
<script type="text/javascript">
	$(document).ready(function(){
		$("#reportBtn").click(function(){

			if(${sessionScope.mvo!=null}){
				location.href="${pageContext.request.contextPath}/board/board_write_from.do";
			}else{
				alert("로그인시에만 사용가능한 기능입니다!! 로그인 후 사용해주세요!!");
			}
			
		});//click
	});//ready
</script>


<!-- -------------------------------부트스트렙------------------------------------------ -->

<br><br>

	<!-- new 신고게시판 -->
	<br><br><br><br>

	<div class="container">
		<span>
			<h1 class="panel-title pull-center" style="font-size: 30px">
				<!-- <span class="label label-warning">신고</span> -->
				신고 게시판<i class="fa fa-exclamation-triangle" aria-hidden="true"
					style="color: red;"></i>
			</h1>
		</span> <br> <br>

		<!-- <button type="button" class="btn btn-warning btn-lg btn3d" id="reportBtn">
			<span class="glyphicon glyphicon-warning-sign"></span>신고하기
		</button> -->


		<div style="float:right;">
			<a class="btn btn-default" id="reportBtn"><em class="fa fa-pencil"></em></a> 
		</div>
		
		<br><br>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Title</th>
					<th>Report ID</th>
					<th>Black ID</th>
					<th>Report Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rvo" items="${requestScope.lvo.list}">
					<tr>
						<td class="text-center" width="150px">${rvo.reportNo}</td>
						<td class="text-center" width="150px"><c:choose>
								<c:when test="${sessionScope.mvo!=null}">
									<a
										href="${pageContext.request.contextPath}/boardDetail.do?reportNo=${rvo.reportNo}">${rvo.reportTitle}</a>
								</c:when>
								<c:otherwise>
			    								${rvo.reportTitle}
			    								</c:otherwise>
							</c:choose></td>
						<td class="text-center" width="150px">${rvo.reporterId}</td>
						<td class="text-center" width="150px">${rvo.blackId}</td>
						<td class="text-center" width="150px">${rvo.reportDate}</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>

		
		<nav aria-label="Page navigation" id="div1" style="float:center">
			<ul class="pager">

				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>

				<c:if test="${pb.previousPageGroup}">
					<li><a href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.startPageOfPageGroup-1}" aria-label="Previous"> 
						<span aria-hidden="true">«</span>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li class="active"><a
								href="${pageContext.request.contextPath}/board_list.do?pageNo=${i}">
									${i} </a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
								&nbsp;
				</c:forEach>

				<c:if test="${pb.nextPageGroup}">
					<li><a
						href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.endPageOfPageGroup+1}" aria-label="Next">
							<span aria-hidden="true">»</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
		
	</div>
</div>
<br><br>
<!-- container -->
       
       
   
                       