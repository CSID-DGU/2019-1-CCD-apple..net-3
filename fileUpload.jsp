<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%

   String uploadPath= request.getRealPath("/fileup");

   
   out.println("업로드가 완료되었습니다.");
   
   int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
   
   String name = "";
   String subject = "";
   
   String fileName1 = ""; // 중복처리된 이름
   String originalName1 = ""; // 중복 처리전 실제 원본 이름
   long fileSize = 0; // 파일 사이즈
   String fileType = ""; // 파일 타입
   
   MultipartRequest multi = null;
   
   try{
      // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
      multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
      
      // form내의 input name="name" 인 녀석 value를 가져옴
      name = multi.getParameter("name");
      // name="subject" 인 녀석 value를 가져옴
      subject = multi.getParameter("subject");
      
      // 전송한 전체 파일이름들을 가져옴
      Enumeration files = multi.getFileNames();
      
      while(files.hasMoreElements()){
         String file1 = (String)files.nextElement();
         originalName1 = multi.getOriginalFileName(file1);
         fileName1 = multi.getFilesystemName(file1);  
         fileType = multi.getContentType(file1);
         File file = multi.getFile(file1);
         fileSize = file.length();
      }
   }catch(Exception e){
      e.printStackTrace();
   }
%>
<!-- 
   해당 페이지는 사용자에게 보여줄 필요가 없고 해당 정보를 전달만 해주면 되기 때문에 hidden으로 했다.
 -->
<form action="filecheck_pr.jsp" method="post" name="fileCheckFormName">
   <input type="hidden" value="<%=name%>" name="name" />
   <input type="hidden" value="<%=subject%>" name="subject" />
   <input type="hidden" value="<%=fileName1%>" name="fileName1" />
   <input type="hidden" value="<%=originalName1%>" name="originalName1" />
</form>

<!-- 
   a태그로 클릭시 파일체크하는 jsp페이지로 이동하도록 함
   javascript를 이용해서 onclick시 폼태그를 잡아와 submit()을 호출해 폼태그를 전송
 -->
<a href="#" onclick="javascript:document.fileCheckFormName.submit()">게시판 확인하기</a>