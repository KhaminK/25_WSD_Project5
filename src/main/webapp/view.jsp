<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글 상세보기</title>
    <style>
        body {
            padding: 30px;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
        }
        .view-box {
            max-width: 700px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .view-header {
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .view-header h2 {
            margin: 0;
        }
        .view-meta {
            font-size: 0.9rem;
            color: #555;
            margin-top: 10px;
        }
        .view-content {
            padding: 20px 0;
            line-height: 1.7;
            min-height: 150px;
        }
        .button-group {
            text-align: right;
            margin-top: 20px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            font-size: 1rem;
            margin-left: 5px;
            text-decoration: none;
        }
        .btn-edit { background-color: #ffc107; color: black; }
        .btn-delete { background-color: #dc3545; }
        .btn-list { background-color: #6c757d; }
    </style>
</head>
<body>
<div class="container">
    <div class="view-box">

        <div class="view-header">
            <h2>첫 번째 게시글</h2>
            <div class="view-meta">
                <span>작성자: <strong>호날두</strong></span> |
                <span>작성일: 2025-11-16</span> |
                <span>카테고리: 자유</span>
            </div>
        </div>

        <div class="view-content">
            <p>[Web발신]</p>
            <p>너는나를존중해야한다나는발롱도르5개와수많은개인트로피를들어올렸으며2016유로에서포르투갈을이끌고우승을차지했고동시에A매치역대최다득점자이다또한챔스역대최다득점자이자5번이나우승을차지한레알마드리드의상징이다또한36세의나이에도프리미어리그에서18골을기록하고챔스에서5경기연속골을기록하며내가세계최고임을증명해냈다은혜를모르는맨유보드진과팬들은내가맨유의골칫덩이라며쫓아냈지만내가세계최고이고내가팀보다위대하다는사실은바뀌지않는다내가사우디에간이유는메시에대한자격지심이아니라유럽에서이룰수있는모든것을이루었기에아시아를정복하기위해간것이지단지돈을위해서간것이아니다</p>
        </div>


        <div class="button-group">
            <a href="index.jsp" class="btn btn-list">목록</a>
            <a href="edit.html" class="btn btn-edit">수정</a>
            <a href="delete_ok.jsp" class="btn btn-delete">삭제</a>
        </div>
    </div>
</div>
</body>
</html>