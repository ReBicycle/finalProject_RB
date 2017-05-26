<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Header -->
    <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="intro-text" >
                    <h3 class="name"></h3>
                        <span style="color:black">
                       		<form action="${pageContext.request.contextPath}/board_write_from.do">
                       			<font size="3">Swindler ID</font> <input type="text" name="blackId">
                       			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       			<font sizw="3">Reporter ID</font> <input type="text" name="reporterId">
                       			<br>
                       			&nbsp;
                       			<textarea rows="10" cols="80"></textarea>                      			
                       		</form>
                       </span>
                        <!-- <hr class="star-light"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>