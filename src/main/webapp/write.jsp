<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>글쓰기</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4">글쓰기</h2>

  <form action="write_ok.jsp" method="post" enctype="multipart/form-data">

    <div class="mb-3">
      <label class="form-label">카테고리</label>
      <select class="form-select" name="category">
        <option value="free">자유</option>
        <option value="notice">공지</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">제목</label>
      <input class="form-control" type="text" name="title" required>
    </div>

    <div class="mb-3">
      <label class="form-label">작성자</label>
      <input class="form-control" type="text" name="writer" required>
    </div>

    <div class="mb-3">
      <label class="form-label">내용</label>
      <textarea class="form-control" name="content" rows="5" required></textarea>
    </div>

    <div class="mb-3">
      <label for="fileInput" class="form-label">파일 첨부</label>
      <input class="form-control" type="file" id="fileInput" name="photo">
    </div>

    <div class="mb-3">
      <label class="form-label">비밀번호</label>
      <input class="form-control" type="password" name="password" required>
    </div>

    <button type="submit" class="btn btn-success">작성 완료</button>
    <a href="index.jsp" class="btn btn-secondary">취소</a>
  </form>
</div>
</body>
</html>

<%@ include file="footer.jsp" %>