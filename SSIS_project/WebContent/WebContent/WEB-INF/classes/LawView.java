package ssis_package;
import java.sql.*;


public class LawView {
	   Connection conn=null;
	   String DB_URL = "jdbc:mysql://localhost:3306/ssis_data?serverTimezone=UTC";
	   String DB_USER = "root";
	   String DB_PASSWORD= "Qlgodrl2";
	   Class.forName("com.mysql.jdbc.Driver");
	   conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	public void LawView(String seq){
		 String query = "Select title, contents from tbl_law_contents where seq = "+ seq +" and seq_history in (select max(seq_history) from tbl_law_contents where seq =" + seq + ") order by arrange";
		 String contents = request.getParameter("contents");
		 Statement stmt = conn.createStatement();
			ResultSet rs = null;
		 
		 if (!rs.next()) {
			  out.println("해당하는 것이 없습니다");
		  } else {
			  rs.previous();
			
		  }
		  while (rs.next())  {
			  String law_title = rs.getString("title");
			  String law_contents=rs.getString("contents");
			  out.println("<div style = \"color : red ; fontsize : 20pt\"> Title: </div> "+"<br>"+ law_title +"<br>" + law_contents);
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
	}
}
