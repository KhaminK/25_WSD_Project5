package org.example.inclassdemo4444.com.myproject.board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM BOARD ORDER BY seq DESC";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setCategory(rs.getString("category"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setPassword(rs.getString("password"));
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                list.add(vo);
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return list;
    }

    public BoardVO getBoard(int seq) {
        BoardVO vo = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM BOARD WHERE seq=?";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, seq);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setCategory(rs.getString("category"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setPassword(rs.getString("password"));
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setCnt(rs.getInt("cnt"));
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return vo;
    }

    public int insertBoard(BoardVO vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        String SQL = "INSERT INTO BOARD(category, title, writer, content, password, regdate, cnt) VALUES(?,?,?,?,?,NOW(),0)";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, vo.getCategory());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getWriter());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getPassword());
            result = pstmt.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, null); }

        return result;
    }

    public int updateBoard(BoardVO vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        String SQL = "UPDATE BOARD SET category=?, title=?, content=? WHERE seq=? AND password=?";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, vo.getCategory());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getContent());
            pstmt.setInt(4, vo.getSeq());
            pstmt.setString(5, vo.getPassword());
            result = pstmt.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, null); }

        return result;
    }

    public int deleteBoard(int seq, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        String SQL = "DELETE FROM BOARD WHERE seq=? AND password=?";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, seq);
            pstmt.setString(2, password);
            result = pstmt.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, null); }

        return result;
    }

    public List<BoardVO> searchBoard(String field, String keyword) {
        List<BoardVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM BOARD WHERE " + field + " LIKE ? ORDER BY seq DESC";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setCategory(rs.getString("category"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setContent(rs.getString("content"));
                vo.setPassword(rs.getString("password"));
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                list.add(vo);
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return list;
    }


}
