<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
<title> 사회보장정보원 </title> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="app.css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
<script>

</script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%@ include file="top.jsp"%>
	<div>
	 <input type="text" id="jomun">
	 <button>다음</button>
	</div>
	<script>
		var input = document.getElementById("jomun").value;
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
 	<div lang="ko" class="SearchCard">
 <%
  for(int i=0; i <contentsArray.size(); i++){
	  String viewtitle = contentsArray.get(i).get("title");
	  String viewcontents = contentsArray.get(i).get("contents");
	  %> <div class="view_title"> <%=viewtitle%> </div> 
	  	 <div class="view_contents"><%=viewcontents%></div> <br> 
	  <%
  }
%>
</div>
</body>
</html>