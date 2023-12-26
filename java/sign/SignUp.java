package sign;

import dbmysql.*;
import user.UserManager;

import java.sql.*;

/**
 * SignUp类用于处理新用户的注册流程。
 * 它包含用户名、密码和电子邮箱作为用户信息。
 * 类中包括了registerUser方法，该方法首先检查邮箱是否已被注册，
 * 然后连接数据库并尝试将新用户的信息保存到数据库中。
 * 如果用户注册成功，方法返回成功消息；如果注册失败，返回相应的错误信息。
 */

public class SignUp {
    private String username;
    private String password;
    private String email;

    public SignUp() {
        // 默认构造器
    }

    // getter 和 setter 方法
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String registerUser() {
        // 检查用户名是否已存在
        if (UserManager.emailExists(this.email)) {
            return "用户已存在，请选择其他邮箱。";
        }

        // 连接数据库并保存用户信息
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (username, email, password) VALUES (?, ?, ?)")) {

            stmt.setString(1, this.username);
            stmt.setString(2, this.email);
            stmt.setString(3, this.password);
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                return "注册成功。";
            } else {
                return "注册失败，请稍后重试。";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "注册时发生错误：" + e.getMessage();
        }
    }


}
