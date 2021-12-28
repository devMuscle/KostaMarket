<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/benefit.css" />
    <script type="text/javascript"src="./js/category.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
    <script>
    $(function(){
        $("#includedContent").load("footer.html");
      });

    //해더 추가하는 자바스크립트
      $(function(){
    	  $("#includedHeader").load("header.jsp");
      });
	</script>
	<div id="includedHeader" style="box-shadow: 0px 2px #eee;"></div>
  </head>
  <body>
    <div class="page-article">
      <div id="inr-category">
        <div class="bnr-category">
        <%for(int i = 1; i <= 15; i++) { %>
          <div class="bnr-category-image">
            <img
              src="./images/benefit/benefit<%=i %>.webp"
              alt="카테고리 베너"
            />
          </div>
          <%} %>
        </div>
        </div>
      </div>
    </div>
  </body>
  <footer>
    	<div id="includedContent"></div>
   </footer>
</html>