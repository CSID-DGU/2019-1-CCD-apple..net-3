<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
 
<head>
<meta charset="UTF-8"/>
</head>


<%
    response.setContentType("text/html;charset=utf-8");
    // String filename = request.getParameter("filename") + ".pdf";
    String root = request.getSession().getServletContext().getRealPath("/");
    String location = root + request.getParameter("location");
    String filename = request.getParameter("filename");
    filename = URLEncoder.encode(filename,"UTF-8").replaceAll("\\+", " ");
    File file = null;
    BufferedInputStream fin = null;
    BufferedOutputStream outs = null;
 
    try{
       
        file = new File(location);
        byte []b=new byte[(int)file.length()];
        FileInputStream in = new FileInputStream(file);
       
        response.reset();
 
        response.setHeader("Content-Type","application.octet-stream");
        response.setHeader("Content-Disposition","attachment;filename="+filename+";");
        response.setHeader("Content-Length",String.valueOf(file.length()));
  
        if(file != null){
            fin = new BufferedInputStream(new FileInputStream(file));
            outs = new BufferedOutputStream(response.getOutputStream());
   
            
            int read = 0;
 
            while((read = fin.read(b)) != -1 ){
                outs.write(b,0,read);
            }
        }
        in.close();
 
    }catch(Exception e){
        out.println("<script type='text/javascript'>");
        out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
        out.println("</script>");
        out.print("Exception Error...");
        out.print(e.toString());
    }finally{
 
        if(outs != null) fin.close();
        if(fin != null) outs.close();
 
    }
   
%>

<script>
</script>