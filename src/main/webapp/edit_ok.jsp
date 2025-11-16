<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String category = request.getParameter("category");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
%>
<html>
<head>
    <title>글 수정 완료!</title>
    <style>
        body {
            font-family: Arial, "Noto Sans KR", sans-serif;
            padding: 30px;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        .result-box {
            max-width: 700px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .result-box h3 {
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .result-box p {
            line-height: 1.6;
        }
        .btn-cancel {
            display: inline-block;
            background-color: #6c757d;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>수정 결과</h2>
    <div class="result-box">
        <h3>'<%= title %>'</h3>
        <p><strong>작성자:</strong> <%= writer %></p>
        <p><strong>카테고리:</strong> <%= category %></p>
        <p><strong>수정된 내용:</strong><br>
            <%= content.replace("\n", "<br>") %>
        </p>
        <hr>
        <a href="index.jsp" class="btn-cancel">목록으로 돌아가기</a>
    </div>
</div>
</body>
</html>