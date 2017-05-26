<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 50%;
}
th, td {
    padding: 15px;
}
</style>
    <!-- Header -->
    <header  style="background-image: url('${pageContext.request.contextPath}/resources/img/seoul3.jpg'); background-repeat: no-repeat; background-size: cover; " >
        <div class="container " id="maincontent" tabindex="-1" >
            <div class="row" >
                <div class="col-lg-12" >
                    <div class="intro-text" >
                    <h3 class="name"></h3>
                        <span style="color:black">
                       		<%-- <a href="${pageContext.request.contextPath}/board/board_write_from.do">신고하기</a> --%>
                       		<table class="list">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="swindler">신고 ID</th>
			<th class="reporter">작성자</th>
		</tr>
		</thead>
		<tbody>			
			<tr>
			    <td>0</td>				
				<td>dongjubujussu</td>
				<td>donkey1990</td>
			</tr>	
		</tbody>					
	</table>
                       </span>
                        
                        <!-- <hr class="star-light"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <!-- <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span> -->
                    </div>
                </div>
            </div>
        </div>
    </header>