<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.example.inclassdemo4444.board.*" %>

<%
    String seq = request.getParameter("seq");
    BoardDAO dao = new BoardDAO();

    dao.increaseCnt(Integer.parseInt(seq));

    BoardVO u = dao.getBoard(Integer.parseInt(seq));
    request.setAttribute("u", u);
%>

<!DOCTYPE html>
<html>
<head>
    <title>게시글 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">게시글 상세보기</h2>

    <div class="card">
        <div class="card-header">
            [${u.category}] <strong>${u.title}</strong>
        </div>
        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-6">작성자: ${u.writer}</div>
                <div class="col-md-6 text-end">
                    작성일: ${u.regdate} | 조회수: ${u.cnt}
                </div>
            </div>
            <hr>
            <div class="mb-3">
                <p style="white-space: pre-wrap;">${u.content}</p>
            </div>

            <c:if test="${not empty u.filename}">
                <div class="mb-3">
                    <img src="upload/${u.filename}" style="max-width: 100%; height: auto;">
                </div>
            </c:if>
        </div>
    </div>

    <div class="mt-3">
        <a href="index.jsp" class="btn btn-secondary">목록</a>
        <a href="edit.jsp?seq=${u.seq}" class="btn btn-warning">수정</a>
        <a href="delete.jsp?seq=${u.seq}" class="btn btn-danger">삭제</a>
    </div>
</div>


</body>
</html>