<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.board.BoardDAO" %>
<%@ page import="org.example.inclassdemo4444.board.BoardVO" %>
<%@ include file="header.jsp" %>

<%
    String seq = request.getParameter("seq");

    BoardDAO dao = new BoardDAO();
    BoardVO u = dao.getBoard(Integer.parseInt(seq));
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">글 수정</h2>

    <form action="edit_ok.jsp" method="post" enctype="multipart/form-data">

        <input type="hidden" name="seq" value="<%=u.getSeq()%>">

        <div class="mb-3">
            <label class="form-label">카테고리</label>
            <select class="form-select" name="category">
                <option value="free" <%=u.getCategory().equals("free")?"selected":""%>>자유</option>
                <option value="notice" <%=u.getCategory().equals("notice")?"selected":""%>>공지</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">제목</label>
            <input class="form-control" type="text" name="title" value="<%=u.getTitle()%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">작성자</label>
            <input class="form-control" type="text" name="writer" value="<%=u.getWriter()%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea class="form-control" name="content" rows="5" required><%=u.getContent()%></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label text-danger">비밀번호 확인</label>
            <input class="form-control" type="password" name="password" placeholder="비밀번호가 일치해야 수정됩니다" required>
        </div>

        <div class="mb-3">
            <label class="form-label">첨부파일</label>
            <% if(u.getFilename() != null && !u.getFilename().equals("")) { %>
            <div class="alert alert-secondary py-2 mb-2">
                현재 파일: <strong><%=u.getFilename()%></strong>
            </div>
            <% } %>
            <input class="form-control" type="file" name="photo">
            <div class="form-text">새로운 파일을 선택하면 기존 파일은 삭제되고 대체됩니다.</div>
        </div>

        <button type="submit" class="btn btn-warning">수정 완료</button>
        <a href="view.jsp?seq=<%=u.getSeq()%>" class="btn btn-secondary">취소</a>
    </form>
</div>
</body>
</html>

<%@ include file="footer.jsp" %>