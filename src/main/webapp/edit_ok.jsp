<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.inclassdemo4444.board.*" %>

<%
    FileUpload upload = new FileUpload();
    BoardVO vo = upload.uploadPhoto(request);

    BoardDAO dao = new BoardDAO();

    int result = dao.updateBoard(vo);

    if(result == 0) {
%>
<script>
    alert("비밀번호가 일치하지 않습니다.");
    history.back();
</script>
<%
    } else {
        response.sendRedirect("view.jsp?seq=" + vo.getSeq());
    }
%>