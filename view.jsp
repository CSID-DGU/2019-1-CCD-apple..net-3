<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

   <title> 규정 한눈에 보기 </title>
   
<style> 
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%@ include file="dbconn.jsp" %>

   <%
      request.setCharacterEncoding("utf-8"); 
      String ccode_addr=request.getParameter("ccode_addr"); 
        
      String seq_contents_a=request.getParameter("seq_contents");
       if (seq_contents_a==null) { 
     	   seq_contents_a="0";
        }
        int seq_contents=Integer.parseInt(seq_contents_a);
        String contents=request.getParameter("contents"); 
    
      try{
         Statement stmt = null ;
         ResultSet rs= null;
       // 아래부분 쿼리문 다음과 같이 바꾸면 됩니다. (기운님 코드합치기전 상태입니다.)
        // String query2="select distinct title from tbl_law_contents where seq_contents="+seq_contents;
        // String query11="select contents, ccode_addr, title from tbl_law_contents where seq = (select seq from tbl_law_contents where seq_contents = "+seq_contents+") and seq_history = (select seq_history from tbl_law_contents where seq_contents = "+seq_contents+") order by seq_contents"; 
         String query1= "select contents, ccode_addr, title from tbl_law_contents where seq_history = (select max(seq_history) from tbl_law_contents where seq = (select seq from tbl_law_contents where seq_contents = "+seq_contents+")) order by seq_contents";        
     
         stmt = conn.createStatement();
         rs = stmt.executeQuery(query1);
     
         conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

          if (!rs.next()) {
             out.println("해당하는 것이 없습니다");
          } else {
             rs.previous();
           
          }
          while (rs.next())  {
          
            String title1=rs.getString("title"); 
            String contents1=rs.getString("contents"); 
             
           %> 
           <%
           
             out.println("<br>"+title1);
             out.println("<br>"+contents1);
             out.println("<br>------------------------------------------"); 
           
           %>
             <%         
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

</body>
</html>