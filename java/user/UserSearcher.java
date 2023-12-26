package user;

import dbmysql.DBConnection;
import user.UserDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserSearcher类用于根据用户名执行模糊搜索查询用户信息的功能。
 * 它提供了一个searchUsersByUsername方法，该方法接受用户名的一部分作为参数，
 * 并返回数据库中与该模式匹配的所有用户信息。
 * 这个类使用DBConnection来建立数据库连接，并执行SQL查询以检索匹配的用户数据。
 * 主要用于用户信息检索和搜索功能。
 */

public class UserSearcher {

    /**
     * 根据用户名模糊查询用户信息。
     *
     * @param usernamePart 部分用户名用于模糊查询
     * @return 匹配的用户列表
     */
    public List<UserDao.User> searchUsersByUsername(String usernamePart) {
        List<UserDao.User> users = new ArrayList<>();
        String sql = "SELECT email, username, password, user_type FROM users WHERE username LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + usernamePart + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String userType = rs.getString("user_type");

                    users.add(new UserDao.User(email, username, password, userType));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
