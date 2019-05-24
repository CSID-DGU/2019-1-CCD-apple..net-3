<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
</head>
<body>
	<%
		String dbUrl = "jdbc:mysql://localhost:3306/ssis";
		Class.forName("com.mysql.jdbc.Driver");
		try {		
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssis?serverTimezone=UTC","root","980221");
			Statement stmt = conn.createStatement();			
			int total = 0;
			String SQL = "select count(*) from tbl_law_1";
			ResultSet rs = stmt.executeQuery(SQL);
			
			if(rs.next()){

				total = rs.getInt(1);
			}
			rs.close();

			out.print("총 게시물 : " + total + "개");
		String sqlList = "SELECT SEQ, LAWNAME, PARENT, FAMILY_TREE, FAMILY_TREE_NAME FROM tbl_law_1 ORDER BY SEQ DESC";
			rs = stmt.executeQuery(sqlList);
	%>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5"><td width="5"></td></tr>
		<tr style="background:url('C:\신다짤.JPG') repeat-x; text-align:center;">
			<td width="5"><img src="c:\신다짤.JPG" width="5" height="30"/></td>
			<td width="73">번호</td>
			<td width="379">부모키</td>
			<td width="73">패.트</td>
			<td width="163">패.트이름</td>
			<td width="58">조회수</td>
			<td width="7"><img src="c:\신다짤.JPG" width="5" height="30"/></td>

		</tr>
		<%
				if(total==0) {
		%>
				<tr align="center" bgcolor="#FFFFFF" height="30">
					<td colspan="6">등록된 글이 없습니다.</td>
				</tr>

		<%
			} else {
					while(rs.next()){
						int idx = rs.getInt(1);
						String name = rs.getString(2);
						int title = rs.getInt(3);
						String time = rs.getString(4);
						String hit = rs.getString(5);
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td><%=idx %></td>
			<td align="left"><%=title %></td>
			<td align="center"><%=name %></td>
			<td align="center"><%=time %></td>
			<td align="center"><%=hit %></td>

			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
		<%
					}
				}
				rs.close();
				stmt.close();
				conn.close();
				} catch(SQLException e) {
					out.print(e.toString());
	}
		%>
		<tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
	</table>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5">
			</td>
		</tr>
		<tr align="center">
			<td> <input type=button value="글쓰기"></td>
		</tr>
	</table>

</body>

</html>
