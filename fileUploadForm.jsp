<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [문제은행] 관리자 문제 업로드 </title>
</head>

<h3> 관리자 문제 업로드용 </h3>
<center>
 
   <form action="fileUpload.jsp" method="post" enctype="Multipart/form-data">
     
      파일명 : <input type="file" name="fileName1" /><br/>
      <input type="submit" value="업로드" />  
      <input type="reset" value="취소" />
   </form>
</center>
