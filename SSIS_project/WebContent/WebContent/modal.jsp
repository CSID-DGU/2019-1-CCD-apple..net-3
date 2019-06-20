
<%@ include file="dbconn.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	request.setCharacterEncoding("UTF-8");
	String linkcode = request.getParameter("linkcode");
	String temp = "SELECT title, contents FROM tbl_law_contents WHERE linkcode = \""+ linkcode +"\" and seq_history in (select max(seq_history) from tbl_law_cwn group by seq)"; // 더미 쿼리
	Statement stmt = null;
	ResultSet rs = null;
	String title = "";
	String contents = "";
	
	try {
		  stmt = conn.createStatement();
		  rs = stmt.executeQuery(temp);
	  if (!rs.next()) {
		  out.println("해당하는 것이 없습니다");
	  } else {
		  rs.previous();	
	  }
	  while (rs.next()) {
		  title = rs.getString("title");
		  contents = rs.getString("contents");
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
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });		
	});
</script>

<a href="modal.jsp?linkcode=c024000000" class="modalLink">간단한 모달 창 만들기</a>
<div id="modalLayer">
  <div class="modalContent">
    <div> <%=title %></div>
    <div> <%=contents %></div> 
    <button type="button">닫기</button>
  </div>
</div>