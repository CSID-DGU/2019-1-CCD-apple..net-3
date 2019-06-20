<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="app.css?alter" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script>
</head>
<body>
	<%@ include file = "dbconn.jsp" %>
	<%@ include file = "top.jsp" %>
	
	<%
	Cookie[] cookies = request.getCookies();
	ArrayList<HashMap<String, String>> recentlist = new ArrayList<HashMap<String, String>>();
	Statement stmt= null;
	ResultSet rs = null;
	
	String seq = "";
	
	ArrayList<String> recentseq = new ArrayList<String>();
	
	for (int i = 1; i < cookies.length; i++){
		if(cookies[i].getName()=="recentView"){
			seq = cookies[i].getValue();
		}
	}
	String seqlist[] = seq.split("&");
	try{
		String query1 = "SELECT lawname, seq FROM tbl_law WHERE seq= '" + seqlist[0] +"'";
		for(int i=1; i<seqlist.length; i++){
			query1 = query1 + " OR seq = '" + seqlist[i]+ "'";
		}
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query1);
		
		if(!rs.next()){
			out.print("최근 본 문서가 없습니다.");
		} else {
			rs.previous();
		}
		while (rs.next()){
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", rs.getString("lawname"));
			map.put("seq", rs.getString("seq"));
			recentlist.add(map);
		}
		rs.close();
		stmt.close();
		conn.close();
		}
		catch(Exception e){
			out.print("Exception Error...");
			  out.print(e.toString());
		}
	finally{}
	%>
	<div>
		<%for(int i=0; i < recentlist.size(); i++){
		%>
		<a href="view.jsp?seq=<%=recentlist.get(i).get("seq")%>">
			<div><%=recentlist.get(i).get("title")%></div>
		</a>
		<script> getCookie("recentView");</script>
		  <%}%>
		  
	</div>
	
</body>
</html>