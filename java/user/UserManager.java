package user;

import dbmysql.DBConnection;

import java.sql.*;

/**
 * UserManager类负责进行用户相关的核心操作。
 * 它提供了一个静态方法emailExists来检查数据库中是否存在指定的电子邮箱地址。
 * 该方法通过建立数据库连接和执行SQL查询来完成操作，如果邮箱存在返回true，否则返回false。
 * 主要用于在用户注册或其他场景中验证电子邮箱的唯一性。
 */

public class UserManager {
    public static boolean emailExists(String email) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT email FROM users WHERE email = ?")) {
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
