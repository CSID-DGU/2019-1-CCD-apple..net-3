<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
	<meta charset="UTF-8" />
	<title> 사회보장정보원 </title> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<link rel="stylesheet" type="text/css" href="app.css?alter">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
	<script type="text/javascript" src = "bookmark.js"></script>
	<script>
 function clikedstar(seq ,title){
	 seq.setAttribute('src', 'img/png/star0.png');
	 if(getCookie(seq)){
		 seq.setAttribute('src', 'img/png/star0.png');
	 }
	 else{
		 seq.setAttribute('src', 'img/png/star0.png');
	 }
 }
 </script>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%@ include file="top.jsp" %>
<%	
	Cookie[] cookies = request.getCookies();
	request.setCharacterEncoding("UTF-8");
	Statement stmt = null;
	
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	String seq = request.getParameter("seq");
	String temp = "SELECT * FROM tbl_law_cwn WHERE seq = \""+ seq +"\" and seq_history in (select max(seq_history) from tbl_law_cwn group by seq) order by arrange"; // 더미 쿼리
	String attach_query = "SELECT attach_path, attach_name FROM tbl_law_attach WHERE seq = \""+ seq +"\" and seq_history in (select max(seq_history) from tbl_law_attach group by seq) order by seq_attach";
	ArrayList<HashMap<String, String>> contentsArray = new ArrayList<HashMap<String, String>>();
	ArrayList<HashMap<String, String>> attachArray = new ArrayList<HashMap<String, String>>();
  try {
	  stmt = conn.createStatement();
	  stmt2 = conn.createStatement();
	  rs = stmt.executeQuery(temp);
	  rs2 = stmt2.executeQuery(attach_query);
	  
  if (!rs.next()||!rs2.next()) {
	  out.println("해당하는 것이 없습니다");
  } else {
	  rs.previous();
	  rs2.previous();
  }
  while (rs.next())  {
	  HashMap<String, String> tempmap = new HashMap<String, String>();
	  tempmap.put("seq_contents", rs.getString("seq_contents"));
	  tempmap.put("title", rs.getString("title"));
	  tempmap.put("contents",rs.getString("contents"));
	  contentsArray.add(tempmap);
  }
  while (rs2.next()){
	  HashMap<String, String> tempmap = new HashMap<String, String>();
	  tempmap.put("attach_path", rs2.getString("attach_path"));
	  tempmap.put("attach_name", rs2.getString("attach_name"));
	  attachArray.add(tempmap);
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
 }
 %>
 
 <script>
  recentCookie("recentView", "<%=seq%>", 3);
 </script>
 	
 	<div lang="ko" class="ViewCard">
 <%
 	
  for(int i=0; i<contentsArray.size(); i++){
	  String viewtitle = contentsArray.get(i).get("title");
	  String viewcontents = contentsArray.get(i).get("contents");
	  String seq_contents = contentsArray.get(i).get("seq_contents");
	  if(!contentsArray.get(i).get("contents").isEmpty()){
		  boolean isCookie = false;
		  for(int j=0; j < cookies.length; j++){
			  if(cookies[j].getName().equals(seq_contents)){
				  isCookie = true;
				  %>
					<span style="float:left">
	  				<button class = "cookiebutton" onClick="setCookie('<%=seq_contents %>','<%=viewtitle%>', -3); alert('<%=viewtitle%>'+'이 즐겨찾기에서 삭제되었습니다.'); location.reload()">
	   					<img id="<%=seq_contents %>" class = "star" src="img/png/star1.png" alt="bookmark"/>
	  				</button>
	  				</span> <%
			  }
		  }
			 %> 
	  <%if(isCookie==false){
	  %>
	   		<span style="float:left">
	  		<button class = "cookiebutton" onClick="setCookie('<%=seq_contents %>','<%=viewtitle%>',3); alert('<%=viewtitle%>'+'이 즐겨찾기에 추가되었습니다.'); location.reload()">
	   			<img class = "star" id="<%=seq_contents %>" src="img/png/star0.png" alt="bookmark"/>
	  		</button>
	  		</span>
	  <%
	  	}
	  }%>
	  <div class="view_title"> &nbsp <%=viewtitle%> </div>
	  <div class="view_contents"><%=viewcontents%></div> <br>
	  <%
  }
 for (int i=0; i<attachArray.size(); i++){
	 String attach_name = attachArray.get(i).get("attach_name");
	 String attach_path = attachArray.get(i).get("attach_path");
	 %>
	 <a href ="download.jsp?filename=<%=attach_name %>&location=<%=attach_path %>">
	 	<div class = "attach_list"> <%=attach_name %> </div>
	 </a>
	 <%
 	}
  %>
</div>
<script>
 	
</script>
</body>
</html>