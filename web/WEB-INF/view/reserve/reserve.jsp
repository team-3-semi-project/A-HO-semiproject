<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  
<title>예약</title>
</head>

<jsp:include page="../common/header.jsp"/>

  <body>
  <section>
    <div class="main" >
      <h2 class="signup-text">예약자 정보</h2>
      <h5 class="signup-text" style="opacity: 60%;">예약자 이름</h5>
      <form class="signup-form" action="#" method="POST">
        <input required type="text" name="name" id="name" class="form-control" placeholder="체크인 시 필요한 정보입니다." autofocus>
        <label class="name-error" id="name-error"></label>
        <br>
        <h2 class="signup-text">휴대폰 번호</h2>
        <input required type="text" name="phone" id="phone" class="form-control" placeholder="휴대폰 번호 '-' 없이 입력">
        <label class="phone-error" id="phone-error"></label>
        <hr>
        <h2 class="signup-text">반려동물 종류</h2>
        <input type="radio" id="credit" name="pay">
                        <label for="normal">개</label>
                        <input type="radio" id="kakao" name="pay">
                        <label for="normal">고양이</label>     
        <br><br>
        <h2 class="signup-text">반려동물 크기</h2>
        <select id="size" name="size">
          <option value="big">대</option>
          <option value="medium">중</option>
          <option value="small">소</option>
        </select>
        <br><br>
        <h2 class="signup-text">반려동물 추가</h2>
        <input type="radio" id="credit" name="dog">
                        <label for="normal">개</label>
                        <input type="radio" id="kakao" name="cat">
                        <label for="normal">고양이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <td><input type="number" min="0" max="10" />마리</td>
                        
                        
        <hr>
        <h2 class="signup-text">할인수단 선택</h2>
        <h5 class="signup-text" style="opacity: 60%; float:left">구매 총액</h5>
        <h5 style="float:right">xxx원</h5>
        <br><br>
        <h5 class="signup-text">포인트 사용</h5>
          <form class="signup-form" action="#" method="POST" width="100px"></form>
            <input required type="text" name="point" id="point" class="form-control" placeholder="0P">
          </form>
        <hr>
        <h2 class="signup-text">결제수단 선택</h2>
        <input type="radio" id="credit" name="pay">
                        <label for="normal">신용카드</label>
                        <input type="radio" id="kakao" name="pay">
                        <label for="normal">카카오페이</label>
                        <input type="radio" id="toss" name="pay">
                        <label for="normal">토스</label>                       
        </form>
        <br><br>
            <h5><strong>이용약관</strong></h5>
            <textarea readonly style="width: 100%; height: 20%; resize: none;">약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ약과ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㄴ
            </textarea>
        <div class="custom-control custom-checkbox">
          <input required type="checkbox" class="custom-control-input" id="same-address">
          <label class="custom-control-label" id="checkbox-ok" for="same-address"> 이용약관 동의</label>
        </div>
        <button class="hologram-btn" onclick="location.href='https://www.naver.com/'" style="float: right;">결제하기</button>
        
    </div>
  </section>
  
  <jsp:include page="../common/footer.jsp"/>
  </body>
  
</html>