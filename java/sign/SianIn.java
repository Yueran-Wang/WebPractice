package sign;

import dbmysql.*;
import java.sql.*;

/**
 * SianIn类用于处理用户登录功能。
 * 它包含了用户的邮箱、密码、账户类型和用户名。
 * 类提供了一个validateUser方法来验证用户的邮箱和密码是否正确，
 * 并在验证成功时获取用户的账户类型和用户名。
 * 此类使用DBConnection类来建立数据库连接，并执行SQL查询。
 */

public class SianIn {
    private String email;
    private String password;
    private String accountType;
    private String username;

    public SianIn() {
        // 默认构造器
    }

    // getter和setter方法
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // 获取账户类型的方法
    public String getAccountType() {
        return accountType;
    }

    // 获取用户名的方法
    public String getUsername() {
        return username;
    }

    public boolean validateUser() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT username, user_type FROM users WHERE email = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, this.email);
            pstmt.setString(2, this.password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 用户名和密码匹配，现在获取账户类型和用户名
                this.username = rs.getString("username"); // 获取用户名
                this.accountType = rs.getString("user_type"); // 获取账户类型
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {};
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
            try { if (conn != null) conn.close(); } catch (Exception e) {};
        }
    }
}
