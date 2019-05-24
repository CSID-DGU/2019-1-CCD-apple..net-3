<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  span.s1 {font-wieght:normal; color:#777777}
  span.s1 label {font-wieght:normal; color:color:#777777} /* span.s1 과 spans1 label 은 동일 속성 */
  span.s1 label.b {font-weight:bold; color:red} /* spans1 label.b 인 경우에만 특별한 속성 */
</style>

</head>

<script type="text/javascript" src="path/to/jQuery.js">

function setStrAttr(Str){ /* 필요한 곳에서 호출 */
    $('span.s1 label.b').removeClass('b'); /* 기존 문자열에 대한 문자 속성 리셋  이거 되는거 맞음?*/
    var $o = $('span.s1 label:contains("' +Str+ '")');
    
    if($o.length>0) $o.addClass('b'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */

    else{
      $o = $('span.s1:contains("' +Str+ '")');
      $o.each(function(){ $(this).html($(this).html().split(tag).join('<label class="b">' +Str+ '</label>')); });
    }
    
    
    if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
  }

</script>


<body>

</body>
</html>