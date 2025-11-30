<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.inclassdemo4444.board.BoardDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    String seq = request.getParameter("seq");
    String password = request.getParameter("password");

    BoardDAO dao = new BoardDAO();
    int result = dao.deleteBoard(Integer.parseInt(seq), password);

    if (result == 0) {
%>
<script>
    alert("비밀번호가 틀렸습니다.");
    history.back(); // 다시 delete.jsp로 돌려보냄
</script>
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>