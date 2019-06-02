<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
<title> 사회보장정보원 </title> 
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<link rel="stylesheet" type="text/css" href="app.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
<script>
function setStrAttr(Str2){ /* 필요한 곳에서 호출 */
	 
    //$('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
   var $o = $('div label:contains("' +Str2+ '")');
   if($o.length>0) $o.addClass('b'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
  else{
    $o = $('div:contains("' +Str2+ '")');
    $o.each(function(){ $(this).html($(this).html().split(Str2).join('<label class="b">' +Str2+ '</label>')); });
   }
  if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
 }
</script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%@ include file="top.jsp" %>
	<div>
	 <input type="text" id="jomun">
	 <button>다음</button>
	</div>
	<script>
		var input = document.getElementById("jomun").value;
		setStrAttr(input);
	</script>	
<%
	request.setCharacterEncoding("utf-8");
	Statement stmt = null;
	ResultSet rs = null;
	String law_name = request.getParameter("law_name");
	
	String temp = "SELECT * FROM tbl_law_cwn WHERE lawname= \""+ law_name +"\" and seq_history in (select max(seq_history) from tbl_law_cwn group by seq) order by arrange"; // 더미 쿼리
	ArrayList<HashMap<String, String>> contentsArray = new ArrayList<HashMap<String, String>>();
  try {
	  stmt = conn.createStatement();
	  rs = stmt.executeQuery(temp);
  if (!rs.next()) {
	  out.println("해당하는 것이 없습니다");
  } else {
	  rs.previous();	
  }
  while (rs.next())  {
	  HashMap<String, String> tempmap = new HashMap<String, String>();
	  tempmap.put("title", rs.getString("title"));
	  tempmap.put("contents",rs.getString("contents"));
	  contentsArray.add(tempmap);
	  // String seq_contents= rs.getString("seq_contents");
	 
	   String seq_contents_a=request.getParameter("seq_contents");
  }
  rs.close();
  stmt.close();
  conn.close();
 } 
  
 catch(Exception e){
  out.print("Exception Error...");
  out.print(e.toString());
 }
  
 finally {
 }
 %>
 	<div class="SearchCard">
 <%
  for(int i=0; i <contentsArray.size(); i++){
	  String viewtitle = contentsArray.get(i).get("title");
	  String viewcontents = contentsArray.get(i).get("contents");
	  %> <div class="view_title"> <%=viewtitle%> </div>
	  	 <div class="view_contents"><%=viewcontents%></div> 
	  <%
  }
%>
</div>
</body>
</html>