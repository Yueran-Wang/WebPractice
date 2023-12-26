package user;

import dbmysql.DBConnection;

import java.sql.*;

/**
 * UserDeleter类用于执行与删除用户相关的数据库操作。
 * 它包含一个静态方法 deleteUserByEmail，此方法根据提供的邮箱地址删除用户。
 * 方法执行成功后返回一个布尔值表示删除操作是否成功。
 * 这个类使用DBConnection类来建立数据库连接，并执行SQL删除操作。
 */

public class UserDeleter {

    /**
     * 根据邮箱地址删除用户。
     *
     * @param email 要删除的用户的邮箱地址
     * @return 删除操作是否成功
     */
    public static boolean deleteUserByEmail(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean deleteSuccess = false;

        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM users WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);

            int rowsAffected = pstmt.executeUpdate();
            deleteSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return deleteSuccess;
    }
}
