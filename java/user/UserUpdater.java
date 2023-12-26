package user;

import dbmysql.DBConnection;

import java.sql.*;

/**
 * UserUpdater类用于更新数据库中的用户信息。
 * 这个类包含用户的电子邮箱、用户名和密码作为属性，并提供一个构造器来初始化这些属性。
 * 它提供了updateUser方法，用于更新数据库中对应邮箱地址的用户的用户名和密码。
 * 此方法在成功更新信息后返回true，如果发生错误则返回false。
 * 类使用DBConnection来建立数据库连接，并执行SQL更新操作。
 */

public class UserUpdater {
    private String email;
    private String username;
    private String password;


    // 构造器
    public UserUpdater(String email, String username, String password) {
        this.email = email;
        this.username = username;
        this.password = password;
    }

    // 更新用户信息的方法
    public boolean updateUser() {
        // 连接数据库
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE users SET username = ?, password = ? WHERE email = ?")) {

            stmt.setString(1, this.username);
            stmt.setString(2, this.password);
            stmt.setString(3, this.email);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
