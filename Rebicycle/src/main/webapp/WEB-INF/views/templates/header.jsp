<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
 <style>
 #designA :hover { 
 background-color: #153a6d;
 }
 	
 </style>
    	<nav class="navbar navbar-inverse">
    	<!-- Navigation -->
    	
    	
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">Rebicycle</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <c:choose>
					<c:when test="${sessionScope.mvo==null}">
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/member/login.do">login</a>
                    </li>
                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/member/register_member_form.do">join</a>
                   </li>
                 	
                    
                   
                    </c:when>
                  
                    <c:otherwise>
						<li class="dropdown">
					        <a id = "designA" class="dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.mvo.name} 님 로그인
					        <span class="caret"></span></a>
					        <ul class="dropdown-menu" style = "background-color:#546da2;">
					          <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
					          <li><a href="${pageContext.request.contextPath}/member/memberModifyForm.do">회원정보수정</a></li>
					          <li> <a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a></li>
					        </ul>
					      </li>	
					<%--  <li class="page-scroll">
                      	<a>${sessionScope.mvo.name} 님 로그인</a> 
                     </li>
                      <li class="page-scroll">
						<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
                      </li>
                      
                        <li class="page-scroll">
						<a href="${pageContext.request.contextPath}/member/memberModifyForm.do">회원정보수정</a>
                        </li> --%>
                        <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/bicycle/bicycle_register_form.do">자전거등록</a>
	                    </li>
	      <%-- 
	                    <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a>
                   		</li>
                      --%>
                     	<li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/listViewTest.do">자전거리스트테스트</a>
                    	</li>
                     	
					</c:otherwise>
					</c:choose> 
					
                     <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/board_list.do?pageNo=1">board</a>
                    </li>
                      <li class="page-scroll">
                        <a href="${pageContext.request.contextPath}/donation/donation_register_form.do">donation</a>
                   </li>             
                    

                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
