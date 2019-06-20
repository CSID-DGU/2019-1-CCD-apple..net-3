
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet" type="text/css" href="app.css?alter" />
<script type="text/javascript" src="bookmark.js"> </script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
<script>
 $(document).ready(function(){
	 $(".flip").click(function(){
		 $(this).next(".panel").slideToggle("normal");
	 });
 });
</script>
</head>
<body>
 <%@ include file = "dbconn.jsp"%>
 <%@ include file = "top.jsp" %>
   <%
   Cookie[] cookies = request.getCookies();
   ArrayList<HashMap<String, String>> bookmark = new ArrayList<HashMap<String, String>>();
   Statement stmt = null;
   ResultSet rs = null;
   
   try {
	   String query = "SELECT seq, seq_contents, title, lawname, contents from tbl_law_cwn WHERE seq_contents = 0";
	   for(int i = 1; i < cookies.length; i++){
		   query = query + " OR seq_contents = '" + cookies[i].getName() + "'";
	   }
	   
	   stmt = conn.createStatement();
	   rs = stmt.executeQuery(query);
   
   	if(!rs.next()){
	   out.println("즐겨찾기를 추가하세요.");
   	} else {
	   rs.previous();
   	}
   	while (rs.next()){
	   HashMap<String, String> mapping = new HashMap<String, String>();
	   mapping.put("seq_contents", rs.getString("seq_contents"));
	   mapping.put("seq", rs.getString("seq"));
	   mapping.put("lawname", rs.getString("lawname"));
	   mapping.put("title", rs.getString("title"));
	   mapping.put("contents", rs.getString("contents"));
	   bookmark.add(mapping);
   	}
   	rs.close();
   	stmt.close();
   	conn.close();
   }
   catch(Exception e){
	   out.print("Exception Error...");
	   out.print(e.toString());
   }
   finally{
   }
  %>

   <%
   	for (int i=0; i < bookmark.size(); i++){
   		String seq_contents = bookmark.get(i).get("seq_contents");
   		String seq = bookmark.get(i).get("seq");
   		String lawname = bookmark.get(i).get("lawname");
   		String title = bookmark.get(i).get("title");
   		String contents = bookmark.get(i).get("contents");
   		%>
        <div class = "bookmark_card">
        <span class="bookmark_buttonset">
        <a style = "text-decoration:none; font-size:20pt;" onClick="setCookie('<%=seq_contents%>','<%=title%>', -10); alert('<%=title %>'+'이 삭제되었습니다.') ;location.reload()">&times;&nbsp
		</a>
		</span>
   		<div lang="ko" class="ViewCard flip">
   			<br> <%=lawname %> <br> <%=title %> 펼치기
   		</div>
   		<div class ="ViewCard panel"> <%=contents %> </div>
   		<span class="bookmark_buttonset">
   			<a href="view.jsp?seq=<%=seq%>">
   				<button  class="search_button">
   					규정 바로가기
   		 		</button> 
   		 	</a>
   		 </span>
   		</div> 
   		<%
   	}
   %>
</body>
</html>