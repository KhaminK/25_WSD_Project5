<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<%
    String seq = request.getParameter("seq");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 삭제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width: 600px;">
    <h2 class="mb-4 text-danger">글 삭제</h2>

    <div class="alert alert-danger" role="alert">
        <h4 class="alert-heading">정말 삭제하시겠습니까?</h4>
        <p>삭제된 글은 복구할 수 없습니다. 삭제를 원하시면 아래에 비밀번호를 입력해 주세요.</p>
    </div>

    <div class="card p-4 shadow-sm">
        <form action="delete_ok.jsp" method="post">
            <input type="hidden" name="seq" value="<%=seq%>">

            <div class="mb-3">
                <label for="password" class="form-label fw-bold">비밀번호 확인</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="d-flex justify-content-end gap-2">
                <a href="view.jsp?seq=<%=seq%>" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-danger">삭제하기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>