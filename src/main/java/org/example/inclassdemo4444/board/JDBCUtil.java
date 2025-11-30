package org.example.inclassdemo4444.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static final String URL = "jdbc:mariadb://walab.handong.edu:3306/W25_22400386"; // Walab DB
    private static final String USER = "W25_22400386";
    private static final String PASS = "Ohtha0";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("DB 연결 오류 발생: " + e.getMessage());
        }
        return con;
    }
}
