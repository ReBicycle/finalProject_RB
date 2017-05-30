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
			<th class="title" align="center">TITLE</th>
			<th class="swindler" align="center">REPORTER ID</th>
			<th class="reporter" align="center">BLACK ID</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="rvo" items="${requestScope.lvo.list}"><%--  varStatus="index" --%>		
			<tr>
			    <td>${rvo.reportNo}</td>				
			    	<td><c:choose>
			    		<c:when test="${sessionScope.mvo!=null}">
			    			<a href="${pageContext.request.contextPath}/boardDetail.do?no=${rvo.reportNo}">${rvo.reportTitle}</a>
			    		</c:when>
			    		<c:otherwise>
			    			${rvo.reportTitle}
			    		</c:otherwise>
			    	</c:choose></td>
				<td>${rvo.reporterId}</td>
				<td>${rvo.blackId}</td>
				<%-- <td>${rvo[${index}].reportNo}</td>				
				<td>${rvo[${index}].reporterId}</td>
				<td>${rvo[${index}].blackId}</td> --%>
			</tr>
			</c:forEach>	
		</tbody>					
	</table>
	<%-- <a href="${pageContext.request.contextPath}/board/board_write_from.do">신고하기</a> --%>
	<br>
	<button type="button" class="btn btn-warning" id="reportBtn">신고하기</button>
	</div>
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
	<a href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.startPageOfPageGroup-1}">
	<!-- <img src="img/left_arrow_btn.gif"> -->
	◀&nbsp; </a>	
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
	<a href="${pageContext.request.contextPath}/board_list.do?pageNo=${i}">${i}</a> 
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
	<a href="${pageContext.request.contextPath}/board_list.do?pageNo=${pb.endPageOfPageGroup+1}">
	▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
	</c:if>
	</p>
                       <!-- </span> -->
                        
                        <!-- <hr class="star-light"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                   <!--  </div>
                </div>
            </div>
        </div>
    </header> -->