package util;

import java.sql.*;

public class JdbcConnection {


    public static Connection getConnection() {
        Connection con = null;
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String userId = "kic";
        String password = "1111";
        try {
            Class.forName("oracle.jdbc.OracleDriver"); // path가 있는지 확인
            con = DriverManager.getConnection(url, userId, password); //정보 넘김

            System.out.println("ok jdbc");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return con; //연결 반환
    }

    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (con != null) {
                con.commit();
                con.close();
            }
            if (pstmt != null) pstmt.close();
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
