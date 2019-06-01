<%@ page contentType="text/html"pageEncoding="utf-8" %>
<div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">홈</a>
        <a href="#">즐겨찾기</a>
        <a href="#">최근 본 목록</a>
        <a href="#">관리자</a>
    </div>
    <div class="Bar_style">
        <button class="hamburger_button" onclick="openNav()">
            <img src="img/png/menubutton.png" alt="hamburger_button">
        </button>
        <a  href="home.html">
        	<img class="logo" alt="logo" src="img/png/logo.gif">
        </a>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "270px";
            document.getElementById("view").style.marginLeft = "0px";
            document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            document.getElementById("view").style.marginLeft = "0";
            document.body.style.backgroundColor = "white";
        }
    </script>
    <form action="./main.jsp" method="post">
    <div class="cap">
    
        <input class="search" name="contents" type="text" placeholder="검색어를 입력해주세요." />
        <button type="submit" class="search_button">
            <img src="img/png/searchbutton.png">
        </button>
     
    </div>
    </form>
  