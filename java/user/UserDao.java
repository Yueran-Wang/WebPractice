package user;

import dbmysql.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDao类用于执行与用户数据相关的数据库操作。
 * 它提供了方法来获取所有用户的信息，以及一个内部类User来表示用户数据。
 * 这个类使用DBConnection来建立数据库连接，并执行SQL查询来获取用户信息。
 * 主要用于用户信息的检索和管理。
 */
public class UserDao {

    /**
     * 获取所有用户的信息。
     *
     * @return 包含所有用户信息的列表
     */
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT email, username, password, user_type FROM users ORDER BY email";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String userType = rs.getString("user_type");

                users.add(new User(email, username, password, userType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    /**
     * 用户类，用于表示用户信息。
     */
    public static class User {
        private String email;
        private String username;
        private String password;
        private String userType;

        public User(String email, String username, String password, String userType) {
            this.email = email;
            this.username = username;
            this.password = password;
            this.userType = userType;
        }

        // Getter 方法
        public String getEmail() {
            return email;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() { // 新增的 Getter 方法
            return password;
        }

        public String getUserType() {
            return userType;
        }

    }
}
