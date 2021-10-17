<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/js/event.js"></script>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
        <div class="row">
            <div class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse p-0">
                
            </div>
            <div id="mainnav" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                <a href="manager.html"><img id="managerheaderimg" src="${ pageContext.servletContext.contextPath }/resources/common-Img/A-HO-icon.png" alt="A-HO아이콘"></a>
                <button type="button" class="btn btn-lg" style="height: 65px; float: right;"><h6>로그아웃</h6></button>
            </div>
        </div>
    </header>

    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse p-0">
            <div class="side sidebar-sticky pt-3">
                <ul class="nav flex-column">
                <h6>
                    <span>계정관리</span>
                    <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <li class="nav-item">
                    <a class="nav-link active" href="${ pageContext.servletContext.contextPath }/manager/userlist">
                    <span data-feather="home"></span>
                    회원 목록 <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${ pageContext.servletContext.contextPath }/manager/reportlist">
                    <span data-feather="file"></span>
                    신고 관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="블랙리스트.html">
                    <span data-feather="shopping-cart"></span>
                    블랙리스트
                    </a>
                </li>
                <br><br>
                <h6>
                    <span>게시글 및 문의 관리</span>
                    <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="users"></span>
                    공지사항 관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="bar-chart-2"></span>
                    자주묻는질문 관리
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="layers"></span>
                    1:1 문의 관리
                    </a>
                </li>
                </ul>
                <br><br>
                <h6>
                <span>호텔 관리</span>
                <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                    <span data-feather="plus-circle"></span>
                </a>
                </h6>
                <ul class="nav flex-column mb-2">
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    신규 호텔 등록
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    호텔 정보 수정
                    </a>
                </li>
                <br><br><br><br><br><br>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                    <span data-feather="file-text"></span>
                    통계정보
                    </a>
                </li>
                </ul>
                <br><br><br><br><br><br>
            </div>
        </nav>
    
</body>
</html>