<%@ page import="java.sql.*" %>


<%
   Connection conn=null;
   String DB_URL = "jdbc:mysql://localhost:3306/ssis_data?serverTimezone=UTC";
   String DB_USER = "root";
   String DB_PASSWORD= "Qlgodrl2";
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
%>