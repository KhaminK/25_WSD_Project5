<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.com.myproject.board.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    int seq = Integer.parseInt(request.getParameter("seq"));
    String category = request.getParameter("category");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String password = request.getParameter("password");

    BoardVO vo = new BoardVO();
    vo.setSeq(seq);
    vo.setCategory(category);
    vo.setTitle(title);
    vo.setContent(content);
    vo.setPassword(password);

    BoardDAO dao = new BoardDAO();
    int result = dao.updateBoard(vo);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 수정 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <% if(result > 0) { %>
    <div class="alert alert-success">글 수정 완료!</div>
    <% } else { %>
    <div class="alert alert-danger">글 수정 실패! 비밀번호를 확인하세요.</div>
    <% } %>
    <a href="index.jsp" class="btn btn-primary">목록으로</a>
</div>
</body>
</html>
