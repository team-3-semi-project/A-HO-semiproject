<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
    #questionIcon {
      margin-right: 10px;
    }
    
    .card-header {
      color: black;
    }
    
    #accordion {
      margin-bottom: 20px;
    }
  </style>

  <title>자주하는 질문</title>
</head>  
<body>
  <jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
    <div class="row">
        
        <!-- include하면 동작을 안함 -->
		<div class="col-sm-2">
            <div class="card">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/website/company">회사 소개</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/notice">공지 사항</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/website/oftenOQ">자주하는 질문</a></li>
                  <li class="list-group-item"><a href="${ pageContext.servletContext.contextPath }/sitemap">사이트 맵</a></li>
                  <li class="list-group-item"><a href="">약관 및 정책</a></li>
                </ul>
            </div> 
        </div>

        <div class="col-sm-9">
          <div class="col-sm-1"></div>
          <div class="card col-sm-10">
            <div class="card-body">
              <h2 class="card-title">자주하는 질문</h2><br><br>
              <div class="container">
                
                
                <div id="accordion">
                
                <c:forEach var="OQ" items="${ requestScope.oqList }">
                  <div class="card">
                    <a class="card-link" data-toggle="collapse" href="#collapse${ OQ.oqCode }">
                    <div class="card-header">
                      <span><img src="${ pageContext.servletContext.contextPath }/resources/common-Img/question-diamond.svg" alt="?" id="questionIcon"></span>
                        <c:out value="${ OQ.oqTitle }"/>
                      </div>
                    </a>
                    <div id="collapse${ OQ.oqCode }" class="collapse" data-parent="#accordion">
                      <div class="card-body">
                        <c:out value="${ OQ.oqContent }"/>
                      </div>
                    </div>
                  </div>
                  <br>
                </c:forEach>
                  
                  
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </div>

      
  </main>

  <!-- --------------------------------------------------------------------------------------------- -->
  
  
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>