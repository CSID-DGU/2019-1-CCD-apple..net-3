<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
</head>
<body>
 <%
 
  Class.forName("com.mysql.jdbc.Driver");
 
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int seq_c = Integer.parseInt(request.getParameter("seq_c"));
		
		try{
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssis?serverTimezone=UTC", "root", "3223113");
		
		
		
		
		String query ="select contents, ccode_addr, title from tbl_law_contents where seq = (select seq from tbl_law_contents where seq_contents = "+seq_c+") and seq_history = (select seq_history from tbl_law_contents where seq_contents = "+seq_c+") order by seq_contents"; 
		stmt  = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		
		if(!rs.next()){
			out.println("해당하는 것이 없습니다.");
			//String addr = rs.getString(1);
			//String title = rs.getString(2);
			//String contents = rs.getString(3);
		}else{
			rs.previous();
		}
		
		while(rs.next()){
			String addr = rs.getString("ccode_addr");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
		
			%>
	<% 
	  out.println("<br>"+addr+"<br>");
	  out.println("<br>"+title);
	  out.println("<br>"+contents);
	
	
	%>
      
    
	
 <%
		}
	rs.close(); 
	stmt.close(); 
	conn.close();
	 
		
	 }catch(SQLException e) { 
		 out.print(e.toString());
	 } finally{
		 
	 }
%>

</body>
</html>