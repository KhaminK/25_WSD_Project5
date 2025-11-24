<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 삭제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>글 삭제 확인</h2>
    <form action="delete_ok.jsp" method="post">
        <input type="hidden" name="seq" value="<%= seq %>">
        <div class="mb-3">
            <label class="form-label">비밀번호 입력</label>
            <input class="form-control" type="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-danger">삭제</button>
        <a href="index.jsp" class="btn btn-secondary">취소</a>
    </form>
</div>
</body>
</html>
