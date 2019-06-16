<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   
<head>
<style>
.container{
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: space-between;
   }
 .one{
       flex-basis:9% ;
 }
 .two{
      flex-basis:50%;
      border-left : 1px solid rgb(0, 90, 170);
 }
   .SearchCard {
  padding : 5px;
  font-size : 12pt;
  line-height:150%;
  border-bottom : 1px solid rgb(0, 90, 170);
  }
  
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>파일체크 JSP 페이지</title>

</head>
<%
   String dir = "C:/Users/USER/jsp_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/minjin/fileup";
   // 경로 기운님한테 맞게 수정필요 !!!! 이클립스+ 크롬 동시에확인해야함 ( 이클립스에서도 되더라도 크롬에서 안될 수 있음 ) 
   request.setCharacterEncoding("UTF-8");
   java.io.File f = new java.io.File(dir);
   if(f.exists()){
       String [] filelist = f.list();
       for(int i=0;i<filelist.length;i++){
           java.io.File f2 = new java.io.File(dir + "/" + filelist[i]);
           %>
           
      <div lang="ko" class="container">
      <div class ="one"><% out.print(i+1); %></div>
       <div class ="two"><% out.println("<a href='C:/Users/USER/jsp_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/minjin/fileup/"+f2.getName()+"'>"+f2.getName()+"</a><BR>");%></div>       
          // 여기도 href 부분 수정해야함 !!! 
      </div>
      <% 
           
       }
   }
%>
