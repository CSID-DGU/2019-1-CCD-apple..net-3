<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title> 사회보장정보원 </title> 
<style>
	.found {background-color:#ff0;}
  div.hang {font-wieght:normal; color:#777777}
  div.hang label {font-wieght:normal; color:#777777} /* span.s1 과 spans1 label 은 동일 속성 */
  div.hang label.b {font-weight:bold; background-color:yellow} /* spans1 label.b 인 경우에만 특별한 속성 */

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>

</head>

<body>
	<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
        String contents=request.getParameter("contents"); 
        String ccode_addr=request.getParameter("ccode_addr"); 
        String seq_contents_a=request.getParameter("seq_contents");
          if (seq_contents_a==null) { 
	     seq_contents_a="0";
           }
        int seq_contents=Integer.parseInt(seq_contents_a);
       String family_tree_name=request.getParameter("family_tree_name"); 

	
  try {
        Statement stmt = null;
	ResultSet rs = null;
  String query1 = String query1 = "select family_tree_name, ccode_addr, contents,seq_contents from tbl_law tl, tbl_law_contents tlc where tl.seq=any(select tlc.seq from tbl_law_contents where tlc.title like '%"+title+"%' or tlc.contents like '%"+title+"%') group by tlc.ccode_addr order by tlc.ccode_addr;"; 
 
  stmt = conn.createStatement();
  rs = stmt.executeQuery(query1);
  
  // var pattern = document.getElementById("pattern").value;
  
  //conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); /// 불필요함.
  
  if (!rs.next()) {
	  out.println("해당하는 것이 없습니다");
  } else {
	  rs.previous();	
  }

  while (rs.next())  {
  	String law_contents=rs.getString("contents");
     
        String family_output=rs.getString("family_tree_name"); 
     
        String law_jang_jo = rs.getString("ccode_addr"); 
     
        String seq_c = rs.getString("seq_contents");
	%>
	
	<%
	out.println("<br>"+family_output+"<br>"); %>
      
        <a href="view.jsp?seq_c=<%=seq_c%>"> <%=law_jang_jo %> </a>
      
    
        <%
        out.println("<br>----------------------");
        out.println("<br>"+law_contents);
        out.println("<br>------------------------------"); 
     
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

<script>
function setStrAttr(Str2){ /* 필요한 곳에서 호출 */
	 
    $('div.hang label.b').removeClass('b');/* 기존 문자열에 대한 문자 속성 리셋 */
   var $o = $('div.hang label:contains("' +Str2+ '")');
   if($o.length>0) $o.addClass('b'); /* label 안에 label 태그를 포함한 문자열이 계속 들어가는 것을 방지 */
  else{
    $o = $('div.hang:contains("' +Str2+ '")');
    $o.each(function(){ $(this).html($(this).html().split(Str2).join('<label class="b">' +Str2+ '</label>')); });
   }

   if($o.length>0) $o.get(0).scrollIntoView(true); /* 발견된 첫번째 위치로 이동. 발견된 것이 없으면 Stop. 발견된 DOM 구조가 없으면 통과 */
 }
 
  var t = "<%= title %>";
  setStrAttr(t);
  
</script>
 
</body>
</html>


