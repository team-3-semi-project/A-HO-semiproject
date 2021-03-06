<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
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

  <title>A-HO</title>
</head>  
<body>
  <jsp:include page="../common/header.jsp"/>
  <!-- --------------------------------------------------------------------------------------------- -->



  <main class="container-fluid">
    <div class="row">
        
		<jsp:include page="website-side.jsp"/>
        
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