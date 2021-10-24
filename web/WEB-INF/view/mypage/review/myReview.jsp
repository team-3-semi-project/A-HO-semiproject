<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <title>A-HO</title>
  <style>
      .table tr {
          text-align: center;
      }
  </style>
</head>
<body>
  
  <jsp:include page="../../common/header.jsp"/>
  
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
     


    <div class="row">
        
        <!-- mypage는 이쪽에 include 해야함 -->
        <jsp:include page="../mypage-side.jsp"/>

        <div class="col-sm-9" >
          <div class="card col-sm-11">
            <div class="card-body">
              <h2 class="card-title">나의 후기</h2><br><br>
              
              

                <c:if test="${ !empty requestScope.reviewList }">
                <table class="table">
                    <thead class="thead-dark">
                      <tr align="center">
                        <th scope="col">리뷰 일자</th>
                        <th scope="col">이용 숙소</th>
                        <th scope="col">별점</th>
                        <th scope="col" style="width: 50%">리뷰 내역</th>
                        <th scope="col"style="width: 25%">리뷰 사진</th>
                      </tr>
                    </thead>
                    <tbody>
                    
              		<c:forEach var="review" items="${ requestScope.reviewList }">
                      <c:if test="${ !empty review.review }">
                      <tr>
                        <th scope="row"><fmt:formatDate value="${ review.reviewDate }" type="date" pattern="yyyy-MM-dd"/></th>
                        <td><c:out value="${ review.hotel.hoName } ${ review.room.roomName }"/></td>
                        <td><c:out value="${ review.score }"/></td>
                        <td><c:out value="${ review.review }"/></td>
                        <td><c:forEach var="reviewPhoto" items="${ review.reviewPhoto }">
                           <img src="${ pageContext.servletContext.contextPath }/resources/upload/review-img/${ reviewPhoto.fileName }" alt="" style="width: 100px; height: 100px; margin-bottom: 20px; margin-left: 20px; float: left;">
                        </c:forEach>

						
						
						
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop${ review.reserveCode }" style="float: right;">
					  삭제
					</button>
					<button type="button" style="float: right; margin-right: 10px;" onclick="reviewUpdate(${ review.reserveCode })" class="btn btn-primary" value="${ review.reserveCode }">수정</button>
					<!-- Modal -->
					<div class="modal fade" id="staticBackdrop${ review.reserveCode }" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">삭제 여부</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        리뷰 삭제를 원하시면 예를 누르세요
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" onclick="reviewDelete(${ review.reserveCode })" value="${ review.reserveCode }">예</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니요</button>
					      </div>
					    </div>
					  </div>
					</div>
											
					</td>
						
						
						
						


                      </tr>
		
                      </c:if>
                    
	              </c:forEach>
                    </tbody>
                  </table>
             	</c:if>
             	
            </div>
          </div>
        </div>
      </div>

	
      
  </main>
	



  <!-- --------------------------------------------------------------------------------------------- -->
  
  <jsp:include page="../../common/footer.jsp"/>
  
</body>
	<script>
		function reviewDelete(num){
			var reserveCode = num;
			
			location.href = '${ pageContext.servletContext.contextPath }/review/delete?reserveCode=' + reserveCode;
		}
		
		function reviewUpdate(number){
			var reserveCode = number;
			location.href = '${ pageContext.servletContext.contextPath }/review/update?reserveCode=' + reserveCode;
		}
	</script>
</html>