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
			if(${sessionScope.mvo!=null}){
				location.href="${pageContext.request.contextPath}/board/board_write_from.do";
			}else{
				alert("로그인시에만 사용가능한 기능입니다!! 로그인 후 사용해주세요!!");
			}
		});//click
	});//ready
</script>


<!-- -------------------------------부트스트렙------------------------------------------ -->

<br><br><br><br>

<div class="container">
	<div class="row">
		<div class="panel panel-default">

			<div class="panel panel-primary">


				<div class="text-center">
					<form class="form-signin">

						<h3 style="color: #2C3E50">신고 게시판</h3>
						<h4>
							<label for="Choose Report" style="color: #E74C3C">불량 유저들
								신고 목록</label>
						</h4>
						<div class="customer"></div>
						<button type="button" class="btn btn-warning btn-lg btn3d"
							id="reportBtn">
							<span class="glyphicon glyphicon-warning-sign"></span>신고하기
						</button>
				</div>
				<div class="panel-body">

					<table class="table table-striped table-condensed">
						<thead>
							<tr>
								<th class="text-center" width="115px">NO</th>
								<th class="text-center" width="115px">TITLE</th>
								<th class="text-center" width="115px">ReportID</th>
								<th class="text-center" width="115px">BlackID</th>
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
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</form>
			<!-- ----------------------------------------------------------------------------------- -->
			<p class="paging">
				<!-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. -->
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<!-- 
			step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->
				<c:if test="${pb.previousPageGroup}">
					<a
						href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.startPageOfPageGroup-1}">
						<!-- <img src="img/left_arrow_btn.gif"> --> ◀&nbsp;
					</a>
				</c:if>
				<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="list.do?pageNo=...">				   
	 -->
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<a
								href="${pageContext.request.contextPath}/board_list.do?pageNo=${i}">${i}</a>
						</c:when>
						<c:otherwise>
	${i}
	</c:otherwise>
					</c:choose>
	&nbsp;
	</c:forEach>
				<!-- 
			step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->
				<c:if test="${pb.nextPageGroup}">
					<a
						href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.endPageOfPageGroup+1}">
						▶<!-- <img src="img/right_arrow_btn.gif"> -->
					</a>
				</c:if>
			</p>
		</div>
	</div>

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

		<div style="float:right;">
			<a class="btn btn-default"><em class="fa fa-pencil"></em></a> 
			<a class="btn btn-warning"><em class="fa fa-trash"></em></a>
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
<!-- container -->
       
       
   
                       