function setStrAtag(Str2) {
	/* 필요한 곳에서 호출 */

	//$('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
	var $o = $('div label:contains("' + Str2 + '")');
	if ($o.length > 0) $o.addClass('a'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
	else {
		$o = $('div:contains("' + Str2 + '")');
		$o.each(function () {
			$(this).html($(this).html().split(Str2).join( Str2 ));
		});
	}
	//// if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
}

function golink(fstdepth_seq, finaldepth_seq, linkcode , d, e) {
	
	if(linkcode){
		
	}
	else{
		var url ="http://localhost:8080/ssis_DB/view.jsp?seq="+finaldepth_seq; // 최종 https 주소에 맞게 수정 필요.
	}
	$(document).ready(function(){
		  var modalLayer = $("#modalLayer");
		  var modalLink = $(".modalLink");
		  var modalCont = $(".modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 

		  modalLink.click(function(){
		    modalLayer.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modalContent > a").focus(); 
		    return false;
		  });

		  $(".modalContent > button").click(function(){
		    modalLayer.fadeOut("slow");
		    modalLink.focus();
		  });		
		});
	
}

