<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
<title> 사회보장정보원 </title> 

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="app.css?alter" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
</head>

<body>
	<%@ include file="dbconn.jsp" %>
	<%@ include file="top.jsp" %>
	<script>
function setStrAttr(Str2){ /* 필요한 곳에서 호출 */	 
    //$('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
   var $o = $('div label:contains("' +Str2+ '")');
   if($o.length>0) $o.addClass('b'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
  else{
    $o = $('div:contains("' +Str2+ '")');
    $o.each(function(){ $(this).html($(this).html().split(Str2).join('<label class="b">' +Str2+ '</label>')); });
   }
  //// if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
 }
var i = 0;
var temp = [];
</script>

<%
	request.setCharacterEncoding("utf-8");
    String contents = request.getParameter("contents");
	String content[] = contents.split(" ");
	Statement stmt = null;
	ResultSet rs = null;
	String temp = "select * from tbl_law_cwn where seq = 0"; // 더미 쿼리
	ArrayList<HashMap<String, String>> data = new ArrayList<HashMap<String, String>>();
	
  try {
	  for (int i = 0; i < content.length; i++ ){
		String query = "SELECT * FROM tbl_law_cwn WHERE contents like \"%"+ content[i] + "%\" and seq_history in (select max(seq_history) from tbl_law_cwn group by seq)";
  		temp = temp + " union " + query;
	  }
	  temp = temp + " order by seq, arrange";
	  stmt = conn.createStatement();
	  rs = stmt.executeQuery(temp);
    	
  if (!rs.next()) {
	  out.println("해당하는 것이 없습니다");
  } else {
	  rs.previous();	
  }
  while (rs.next())  {
	  HashMap<String, String> map = new HashMap<String, String>();
	  map.put("law_name",rs.getString("lawname"));
	  map.put("law_title",rs.getString("title"));
	  map.put("law_contents",rs.getString("contents"));
	  map.put("ccode_addr",rs.getString("ccode_addr"));
	  map.put("seq_c",rs.getString("seq_contents"));
	  map.put("family_tree_name",rs.getString("family_tree_name"));
	  data.add(map);
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
for (int i=0; i < data.size(); i++){
	HashMap<String, String> takeMap = (HashMap<String, String>)data.get(i);
	 String family_tree_name = takeMap.get("family_tree_name");
	 String law_name = takeMap.get("law_name");
	 String ccode_addr = takeMap.get("ccode_addr");
	 String law_contents = takeMap.get("law_contents");

	 %><div lang ="ko" class="SearchCard">
	 <a href="view.jsp?law_name=<%=law_name%>"> <%=family_tree_name%> </a>
	 <br> <%=ccode_addr %>
	 <br> <%=law_contents%>
	 </div>
	 <%}%>
	<% for (int i=0; i < content.length; i++){ %>
	<script>
		setStrAttr("<%=content[i]%>");
	</script>
	<%} %>

</body>
</html>


