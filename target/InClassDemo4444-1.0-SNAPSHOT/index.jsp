<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.example.inclassdemo4444.board.BoardDAO" %>
<%@ page import="org.example.inclassdemo4444.board.BoardVO" %>
<%@ page import="java.util.List" %>


<jsp:include page="top.jsp" />
<jsp:include page="header.jsp" />

<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = null;

    String field = request.getParameter("field");
    String keyword = request.getParameter("keyword");
    String sort = request.getParameter("sort");
    String category = request.getParameter("category");

    if(field != null && keyword != null && !keyword.trim().isEmpty()) {
        list = dao.searchBoard(field, keyword);
    } else if(category != null && !category.equals("")) {
        list = dao.getBoardListByCategory(category);
    } else {
        list = dao.getBoardList(sort);
    }

    request.setAttribute("list", list);
%>

<style>
    body {
        font-family: "Noto Sans KR", Arial, sans-serif;
        color: #333;
        background-color: #fff;

    }
    .container {
        max-width: 900px;
        margin: 0 auto;
    }

    .board-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #eee;
    }
    .board-header h2 { margin: 0; color: #333; }

    .btn-add {
        display: inline-block;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 20px;
        font-weight: bold;
        font-size: 0.9rem;
        transition: background 0.3s;
    }
    .btn-add:hover { background-color: #0056b3; }

    .filter-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        font-size: 0.9rem;
        background-color: #f9f9f9;
        padding: 10px;
        border-radius: 8px;
    }
    .filter-group a {
        text-decoration: none;
        color: #666;
        padding: 5px 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-right: 5px;
        background-color: white;
        transition: all 0.2s;
    }
    .filter-group a:hover { background-color: #eee; }
    .filter-group a.active {
        background-color: #6c757d;
        color: white;
        border-color: #6c757d;
    }

    .search-form {
        display: flex;
        gap: 5px;
    }
    .search-select, .search-input {
        padding: 6px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .btn-search {
        padding: 6px 12px;
        background-color: #6c757d;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-search:hover { background-color: #5a6268; }

    .board-table {
        width: 100%;
        border-collapse: collapse;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    .board-table th, .board-table td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }
    .board-table th {
        background-color: #f8f9fa;
        color: #555;
        font-weight: bold;
        border-top: 2px solid #ddd;
    }
    .board-table td.title { text-align: left; }
    .board-table td.title a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
    }
    .board-table td.title a:hover { color: #007bff; text-decoration: underline; }

    .badge { padding: 3px 8px; border-radius: 4px; font-size: 0.8rem; color: white; }
    .badge-notice { background-color: #dc3545; }
    .badge-free { background-color: #6c757d; }

    .btn-mini {
        font-size: 0.8rem;
        color: #888;
        margin-left: 5px;
        text-decoration: none;
        border: 1px solid #eee;
        padding: 2px 6px;
        border-radius: 3px;
    }
    .btn-mini:hover { background-color: #eee; color: #333; }
</style>

<div class="container">
    <div class="board-header">
        <h2>게시판 목록</h2>
        <a href="write.jsp" class="btn-add">✏️ 글쓰기</a>
    </div>

    <div class="filter-bar">
        <form method="get" action="index.jsp" class="search-form">
            <select name="field" class="search-select">
                <option value="title" ${(param.field == "title")?"selected":""}>제목</option>
                <option value="writer" ${(param.field == "writer")?"selected":""}>작성자</option>
                <option value="content" ${(param.field == "content")?"selected":""}>내용</option>
            </select>
            <input type="text" name="keyword" class="search-input" placeholder="검색어" value="${param.keyword}">
            <button type="submit" class="btn-search">검색</button>
        </form>

        <div class="filter-group">
            <a href="index.jsp" class="<%=category==null?"active":""%>">전체</a>
            <a href="index.jsp?category=free" class="<%="free".equals(category)?"active":""%>">자유</a>
            <a href="index.jsp?category=notice" class="<%="notice".equals(category)?"active":""%>">공지</a>
            <span style="border-left:1px solid #ccc; margin:0 5px;"></span>
            <a href="index.jsp?sort=regdate" class="<%=(sort==null||sort.equals("regdate"))?"active":""%>">최신</a>
            <a href="index.jsp?sort=cnt" class="<%="cnt".equals(sort)?"active":""%>">인기</a>
        </div>
    </div>

    <table class="board-table">
        <thead>
        <tr>
            <th width="8%">번호</th>
            <th width="10%">분류</th>
            <th>제목</th>
            <th width="15%">작성자</th>
            <th width="20%">작성일</th>
            <th width="8%">조회수</th>
            <th width="12%">관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr>
                <td>${vo.seq}</td>
                <td>
                    <c:choose>
                        <c:when test="${vo.category == 'notice'}">
                            <span class="badge badge-notice">공지</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-free">자유</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="title">
                    <a href="view.jsp?seq=${vo.seq}">${vo.title}</a>
                    <c:if test="${not empty vo.filename}">
                        <span>📎</span>
                    </c:if>
                </td>
                <td>${vo.writer}</td>
                <td>${vo.regdate}</td>
                <td>${vo.cnt}</td>
                <td>
                    <a href="edit.jsp?seq=${vo.seq}" class="btn-mini">수정</a><br />
                    <a href="delete.jsp?seq=${vo.seq}" class="btn-mini">삭제</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp" />
<jsp:include page="bottom.jsp" />