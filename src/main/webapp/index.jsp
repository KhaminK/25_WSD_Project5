<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.com.myproject.board.*" %>
<%@ page import="java.util.List" %>

<%
    BoardDAO dao = new BoardDAO();
    String field = request.getParameter("field");
    String keyword = request.getParameter("keyword");
    List<BoardVO> list;

    if(field != null && keyword != null && !keyword.trim().isEmpty()) {
        list = dao.searchBoard(field, keyword);
    } else {
        list = dao.getBoardList();
    }
%>


<jsp:include page="top.jsp" />
<jsp:include page="header.jsp" />

<h2>게시판 목록</h2>

<form method="get" action="index.jsp" class="mb-3 d-flex">
    <select name="field" class="form-select me-2" style="width: 120px;">
        <option value="title">제목</option>
        <option value="writer">작성자</option>
        <option value="content">내용</option>
    </select>
    <input type="text" name="keyword" class="form-control me-2" placeholder="검색어 입력">
    <button type="submit" class="btn btn-primary">검색</button>
</form>

<table class="table table-striped">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <% for(BoardVO vo : list) { %>
    <tr>
        <td><%= vo.getSeq() %></td>
        <td><a href="view.jsp?seq=<%= vo.getSeq() %>"><%= vo.getTitle() %></a></td>
        <td><%= vo.getWriter() %></td>
        <td><%= vo.getCnt() %></td>
        <td><%= vo.getRegdate() %></td>
        <td>
            <a href="edit.jsp?seq=<%= vo.getSeq() %>" class="btn btn-primary btn-sm">수정</a>
            <a href="delete.jsp?seq=<%= vo.getSeq() %>" class="btn btn-danger btn-sm">삭제</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<jsp:include page="footer.jsp" />
<jsp:include page="bottom.jsp" />
