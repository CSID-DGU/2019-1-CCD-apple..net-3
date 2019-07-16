<%@ page pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script type="text/javascript" src="jquery.highlight-4.js"></script>
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
        function setStrAttr(){ /* 필요한 곳에서 호출 */	 
        	 //  $('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
        	    var Str2 = $("#jomun").val();
        	   var $o = $('div label:contains("'+Str2+'")');
        	   if($o.length>0) $o.addClass('b'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
        	  else{
        	    $o = $('div :contains("'+Str2+'")');
        	    $o.each(function(){ $(this).html($(this).html().split(Str2).join('<label class="b">'+Str2+'</label>')); });
        	   }
        	  if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
      }
</script>
<script>
      $( document ).ready( function() {
        var jbOffset = $( '.topbar' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.topbar' ).addClass( 'Fixed' );
          }
          else {
            $( '.topbar' ).removeClass( 'Fixed' );
     
          }
        });
      } );
</script>

<div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="home.html">홈</a>
        <a href="#pagesearch" rel="modal:open"> 페이지 내 검색 </a>
        <a href="bookmarkView.jsp">즐겨찾기</a>

        <a href="adminQuestion.jsp">관리자</a>
</div>
    <!-- above side navigation -->
    <!-- below top menu -->
    <div class="topbar">
    <div class="Bar_style">
        <button class="hamburger_button" onclick="openNav()">
            <img src="img/png/menubutton.png" alt="hamburger_button">
        </button>
        <a class="hometag" href="home.html">
        	<img class="logo" alt="logo" src="img/png/logo.gif">
        </a>
    </div>
    <!-- above top menu -->
	<form action="./main.jsp" method="post">
    <div class="cap">
            <input class="search" name="contents" type="text" id="in" placeholder="검색어를 입력해주세요." />
            <button type="submit" class="search_button">
                <img src="img/png/searchbutton.png">
            </button>
    </div>
    </form>
    </div>
    <div id="pagesearch" class="modal">
    	페이지 내 검색
    	<div class="cap">
    	<input class="search" id="vo" type="search" placeholder="검색어를 입력해주세요." />
    	<a href="javascript:setStrAttr()">
    	<button type="submit" class="search_button">
                <img src="img/png/searchbutton.png">
        </button>
        </a>
    	</div>
    
    </div>
    <script>
    function high(){
    	var sKey = '${vo.searchKeyword}';
        var splitKey = sKey.split(" ");
        if(splitKey.length > 1) {
        	for(var i=0; i<splitKey.length; i++){
        		$('.hang').highlight(splitKey[i]);// 검색어 하이라이트 
        	}
        	} else {
        		$('.hang').highlight(sKey); 
        	}
    }
    </script>
  