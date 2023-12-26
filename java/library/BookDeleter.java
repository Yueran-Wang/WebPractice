package library;

import dbmysql.DBConnection;

import java.sql.*;

/**
 * BookDeleter类用于执行与删除图书相关的数据库操作。
 * 它包含一个静态方法 deleteBookById，此方法根据提供的图书ID删除图书。
 * 方法执行成功后返回一个布尔值表示删除操作是否成功。
 * 这个类使用DBConnection类来建立数据库连接，并执行SQL删除操作。
 */
public class BookDeleter {

    /**
     * 根据图书ID删除图书。
     *
     * @param bookId 要删除的图书的ID
     * @return 删除操作是否成功
     */
    public static boolean deleteBookById(int bookId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean deleteSuccess = false;

        try {
            conn = DBConnection.getConnection();
            String sql = "DELETE FROM books WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookId);

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
