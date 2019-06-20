<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
<meta charset="UTF-8"/>
<title> 사회보장정보원 </title> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="ie=edge"/>
<link rel="stylesheet" type="text/css" href="app.css?alter"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
<script>
function setStrAttr(Str2){ /* 필요한 곳에서 호출 */
    //$('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
   var $o = $('div label:contains("' +Str2+ '")');
   if($o.length>0) {
	   $o.addClass('b');/* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
	} else {
    	$o = $('div:contains("' +Str2+ '")');
    	$o.each(function(){ 
    		$(this).html($(this).html().split(Str2).join('<label class="b">' +Str2+ '</label>')); 
    	});
 	}
	///if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
 }
 function openLawType(){
	document.getElementById("LawType").style.height = "auto";
	document.getElementById("LawType").style.display = "inline";
	document.getElementById("LawTypeButton").style.backgroundColor = "white";
	document.getElementById("ContentType").style.height = "0px";
	document.getElementById("ContentType").style.display = "none";
	document.getElementById("ContentTypeButton").style.backgroundColor = "rgb(0, 140, 207)";
 }
 function openContentType(){
	 document.getElementById("LawType").style.height = "0px";
	 document.getElementById("LawType").style.display = "none";
	 document.getElementById("LawTypeButton").style.backgroundColor = "rgb(0, 140, 207)";
	 document.getElementById("ContentType").style.height = "auto";
	 document.getElementById("ContentType").style.display = "inline";
	 document.getElementById("ContentTypeButton").style.backgroundColor = "white";
	 
 }
 
</script>
</head>

<body lang = "ko">
	<%@ include file="dbconn.jsp" %>
	<%@ include file="top.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
    String contents = request.getParameter("contents");
    if( contents=="" ){
		contents = "empty";
	}
	String content[] = contents.split(" ");
	
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	ArrayList<HashMap<String, String>> lawdata = new ArrayList<HashMap<String, String>>();
	ArrayList<HashMap<String, String>> data = new ArrayList<HashMap<String, String>>();
	
  try {
	  String query1 = "SELECT * FROM tbl_law_cwn WHERE ";
	  String query2 = "(contents like \"%"+content[0]+"%\")"; 
	  String query3 = " and seq_history in (select max(seq_history) from tbl_law_cwn group by seq)";
	  String query4 = " GROUP BY seq ORDER BY seq";
	  
	  for (int i = 1; i < content.length; i++ ){
		///String query = "SELECT * FROM tbl_law_cwn WHERE ( contents like \"%"+ content[i] + "%\" OR contents like \"%"+ content[i] + "%\"  )  and seq_history in (select max(seq_history) from tbl_law_cwn group by seq)";
		 query2 = "(contents like \"%"+content[i]+"%\")";
  		 query2 = query2 + " OR " +query2;
	  }
	  String query = query1 + query2 + query3;
	  String lawsearch_query = query + query4;
	  
	  stmt = conn.createStatement();
	  stmt2 = conn.createStatement();
	  rs = stmt.executeQuery(lawsearch_query);
	  rs2 = stmt2.executeQuery(query);
	  
	  
  	  if (!rs.next()||!rs2.next()) {
  		  out.println(contents + "에 대한 검색결과입니다.");
	  	  out.println("해당하는 것이 없습니다");
      } else {
	  	rs.previous();
	  	rs2.previous();
  	  }
  	  while (rs.next()){
	 	  HashMap<String, String> map = new HashMap<String, String>();
	 	  map.put("law_name", rs.getString("lawname"));
	 	  map.put("seq", rs.getString("seq"));
	 	  lawdata.add(map);
	 	}
  	  while (rs2.next()){
	  	HashMap<String, String> map = new HashMap<String, String>();
	  	map.put("law_contents",rs2.getString("contents"));
	  	map.put("ccode_addr",rs2.getString("ccode_addr"));
	  	map.put("family_tree_name",rs2.getString("family_tree_name"));
	  	map.put("seq", rs2.getString("seq"));
	  	data.add(map);
  		}
  	  
  	 rs.close();
  	 rs2.close();
  	 stmt.close();
  	 stmt2.close();
	 conn.close();
 
  }
  
 catch(Exception e){
  out.print("Exception Error...");
  out.print(e.toString());
 }
 
 finally { 
 }%>
 
 <div class = "searchtypeset">
		<button class="lawsearch" id="LawTypeButton" onclick = "openLawType()" > 규정 검색 (<%=lawdata.size() %>)</button>
		<button class="lawsearch right" style="height:35px" id = "ContentTypeButton" onclick = "openContentType()">조문 검색 (<%=data.size()%>)</button>
</div>
<!--  -->
<div class = "hang"> <%=contents %>에 대한 검색결과입니다. </div>
 <div id = "LawType">
 <%
    for (int i=0; i < lawdata.size(); i++){
        HashMap<String, String> takeMap = (HashMap<String, String>)lawdata.get(i);
        String seq = takeMap.get("seq");
        String lawname = takeMap.get("law_name");
        %>
        <div lang ="ko" class="SearchCard">
   	 		<a href="view.jsp?seq=<%=seq%>"> <%=lawname%> </a>
   	 	</div>
     <% } %>
</div>
<div id = "ContentType" style ="display:none">
    <%
	for (int i=0; i < data.size(); i++){
		HashMap<String, String> takeMap = (HashMap<String, String>)data.get(i);
		String seq = takeMap.get("seq");
	 	String family_tree_name = takeMap.get("family_tree_name");
	 	String ccode_addr = takeMap.get("ccode_addr");
	 	String law_contents = takeMap.get("law_contents");
	%>
	<div lang ="ko" class="SearchCard">
	 <a href="view.jsp?seq=<%=seq%>"> <%=family_tree_name%> </a>
	 <br> <%=ccode_addr %>
	 <br> <%=law_contents%>
	 </div>
	 <%}
	 for (int i=0; i < content.length; i++){ %>
	<script>
		setStrAttr("<%=content[i]%>");
	</script>
	<%} %>
</div>
</body>
</html>


