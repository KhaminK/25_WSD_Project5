<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.com.myproject.board.*" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));
    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getBoard(seq);
%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>글 수정</h2>
    <form action="edit_ok.jsp" method="post">
        <input type="hidden" name="seq" value="<%= vo.getSeq() %>">
        <div class="mb-3">
            <label class="form-label">카테고리</label>
            <select class="form-select" name="category">
                <option value="free" <%= "free".equals(vo.getCategory()) ? "selected" : "" %>>자유</option>
                <option value="notice" <%= "notice".equals(vo.getCategory()) ? "selected" : "" %>>공지</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input class="form-control" type="text" name="title" value="<%= vo.getTitle() %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea class="form-control" name="content" rows="5" required><%= vo.getContent() %></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">비밀번호</label>
            <input class="form-control" type="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">수정 완료</button>
        <a href="index.jsp" class="btn btn-secondary">취소</a>
    </form>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>
