package dbmysql;

import java.sql.*;
import java.util.*;

/**
 * BorrowProcess 类用于处理图书的借阅和归还流程。
 * 这个类提供了方法来借阅和归还书籍，通过与数据库进行交互来更新借阅记录。
 */
public class BorrowProcess {

    /**
     * 借书方法。
     * 通过接收书籍ID和用户邮箱，将借书记录插入到数据库中。
     *
     * @param bookId    要借阅的书籍ID
     * @param userEmail 借阅者的邮箱地址
     * @return 如果操作成功，返回 true；否则返回 false。
     */
    public boolean borrowBook(int bookId, String userEmail) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // 获取数据库连接
            conn = DBConnection.getConnection();
            // 插入借书记录的SQL语句
            String sql = "INSERT INTO borrowed_books (book_id, user_email, borrow_date) VALUES (?, ?, CURDATE())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookId);
            pstmt.setString(2, userEmail);
            // 执行更新并返回结果
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // 关闭数据库连接和语句对象
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * 还书方法。
     * 通过接收书籍ID和用户邮箱，从数据库中删除对应的借书记录。
     *
     * @param id    借阅记录的id
     * @param userEmail 借阅者的邮箱地址
     * @return 如果操作成功，返回 true；否则返回 false。
     */
    public boolean returnBook(int id, String userEmail) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // 获取数据库连接
            conn = DBConnection.getConnection();
            // 删除借书记录的SQL语句
            String sql = "DELETE FROM borrowed_books WHERE id = ? AND user_email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, userEmail);
            // 执行更新并返回结果
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // 关闭数据库连接和语句对象
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * 获取用户当前借阅的所有书籍信息。
     * 此方法查询数据库，返回一个用户当前借阅的所有书籍的列表。
     * 每个书籍信息以 Map<String, Object> 的形式返回，包含书籍的ID、名称和借阅日期。
     *
     * @param userEmail 用户的邮箱地址，用于查询该用户的借阅记录。
     * @return 一个包含用户借阅书籍信息的列表。如果没有借阅记录或查询出错，则返回空列表。
     */
    public List<Map<String, Object>> getBorrowedBooks(String userEmail) {
        List<Map<String, Object>> books = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            String sql = "SELECT bb.id, b.name, bb.borrow_date FROM borrowed_books bb JOIN books b ON bb.book_id = b.ID WHERE bb.user_email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Map<String, Object> book = new HashMap<>();
                book.put("id", rs.getInt("id"));
                book.put("name", rs.getString("name"));
                book.put("borrow_date", rs.getDate("borrow_date"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return books;
    }
}
