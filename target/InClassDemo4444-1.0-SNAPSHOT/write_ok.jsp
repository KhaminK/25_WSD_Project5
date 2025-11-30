<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.board.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.example.inclassdemo4444.board.*" %>
<%
    FileUpload upload = new FileUpload();

    BoardVO vo = upload.uploadPhoto(request);

    BoardDAO dao = new BoardDAO();
    int result = dao.insertBoard(vo);

    if(result == 0) System.out.println("글 추가 실패");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글쓰기 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <% if(result > 0) { %>
    <div class="alert alert-success">
        글이 성공적으로 작성되었습니다.
    </div>
    <% } else { %>
    <div class="alert alert-danger">
        글 작성에 실패했습니다. 다시 시도해주세요.
    </div>
    <% } %>
    <a href="index.jsp" class="btn btn-primary mt-3">목록으로 돌아가기</a>
    <a href="write.jsp" class="btn btn-secondary mt-3">다시 작성하기</a>
</div>
</body>
</html>
