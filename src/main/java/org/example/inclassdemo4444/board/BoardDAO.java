package org.example.inclassdemo4444.board;

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
                vo.setFilename(rs.getString("filename"));
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
                vo.setFilename(rs.getString("filename"));
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return vo;
    }

    public int insertBoard(BoardVO vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;
        String SQL = "INSERT INTO BOARD(category, title, writer, content, password, regdate, cnt, filename) VALUES(?,?,?,?,?,NOW(),0, ?)";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, vo.getCategory());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getWriter());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getPassword());
            pstmt.setString(6, vo.getFilename());
            result = pstmt.executeUpdate();
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, null); }

        return result;
    }

    public int updateBoard(BoardVO vo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

         String SQL = "UPDATE BOARD SET category=?, title=?, writer=?,content=?, filename=? WHERE seq=? AND password=?";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);

            pstmt.setString(1, vo.getCategory());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getWriter());
            pstmt.setString(4, vo.getContent());
            pstmt.setString(5, vo.getFilename());

            pstmt.setInt(6, vo.getSeq());
            pstmt.setString(7, vo.getPassword());

            System.out.println("Update 시도: seq=" + vo.getSeq() + ", pw=" + vo.getPassword() + ", file=" + vo.getFilename());

            result = pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, null);
        }

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
                vo.setFilename(rs.getString("filename"));
                list.add(vo);
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return list;
    }

    public void increaseCnt(int seq) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String SQL = "UPDATE BOARD SET cnt=cnt+1 WHERE seq=?";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, seq);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn, pstmt, null);
        }
    }

    public List<BoardVO> getBoardList(String order) {
        List<BoardVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String SQL = "SELECT * FROM BOARD ORDER BY seq DESC";

        if(order != null && !order.equals("")){
            if(order.equals("title")) SQL = "SELECT * FROM BOARD ORDER BY title ASC";
            else if(order.equals("regdate")) SQL = "SELECT * FROM BOARD ORDER BY regdate DESC";
            else if(order.equals("cnt")) SQL = "SELECT * FROM BOARD ORDER BY cnt DESC";
        }

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
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                vo.setFilename(rs.getString("filename"));
                list.add(vo);
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return list;
    }

    public List<BoardVO> getBoardListByCategory(String category) {
        List<BoardVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM BOARD WHERE category=? ORDER BY seq DESC";

        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                BoardVO vo = new BoardVO();
                vo.setSeq(rs.getInt("seq"));
                vo.setCategory(rs.getString("category"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setRegdate(rs.getTimestamp("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                vo.setFilename(rs.getString("filename"));
                list.add(vo);
            }
        } catch(Exception e) { e.printStackTrace(); }
        finally { close(conn, pstmt, rs); }

        return list;
    }


}
