<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>간단한 게시판</title>

    <style>
        body {
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn-add {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .btn-add:hover {
            background-color: #0056b3;
        }

        .board-table {
            width: 100%;
            /* 이거 하면 한 줄로 합쳐짐 */
            border-collapse: collapse;
            margin-top: 15px;
        }

        .board-table th, .board-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .board-table th {
            background-color: #f2f2f2;
        }

        .board-table td a {
            text-decoration: none;
            color: #555;
            margin-right: 10px;
        }
        .board-table td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="header">
        <h2>자유게시판</h2>
        <a href="write.html" class="btn-add">글쓰기 (Add)</a>
    </div>

    <table class="board-table">
        <thead>
        <tr>
            <th>#</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Date</th>
            <th>Menu</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>3</td>
-            <td><a href="view.jsp">첫 번째 게시글</a></td>
            <td>호날두</td>
            <td>2025-11-16</td>
            <td>
                <a href="edit.html">수정</a>
                <a href="delete_ok.jsp">삭제</a>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td><a href="view.jsp">두 번째 게시글</a></td>
            <td>Ronaldo</td>
            <td>2025-11-15</td>
            <td>
                <a href="edit.html">수정</a>
                <a href="delete_ok.jsp">삭제</a>
            </td>
        </tr>
        <tr>
            <td>1</td>
            <td><a href="view.jsp">세 번째 게시글</a></td>
            <td>SIUUU</td>
            <td>2025-11-14</td>
            <td>
                <a href="edit.html">수정</a>
                <a href="delete_ok.jsp">삭제</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>

</body>
</html>