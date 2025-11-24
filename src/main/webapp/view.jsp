<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.com.myproject.board.*" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getBoard(seq);

    // 조회수 증가
    vo.setCnt(vo.getCnt() + 1);
    dao.updateBoard(vo);
%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2><%= vo.getTitle() %></h2>
    <p><strong>작성자:</strong> <%= vo.getWriter() %> | <strong>카테고리:</strong> <%= vo.getCategory() %> | <strong>조회수:</strong> <%= vo.getCnt() %></p>
    <hr>
    <p><%= vo.getContent() %></p>
    <hr>
    <a href="edit.jsp?seq=<%= vo.getSeq() %>" class="btn btn-primary">수정</a>
    <a href="delete.jsp?seq=<%= vo.getSeq() %>" class="btn btn-danger">삭제</a>
    <a href="index.jsp" class="btn btn-secondary">목록으로</a>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>
