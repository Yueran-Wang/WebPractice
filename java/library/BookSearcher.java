package library;

import dbmysql.DBConnection;
import library.BookDao;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * BookSearcher类用于根据图书名称执行模糊搜索查询图书信息的功能。
 * 它提供了一个searchBooksByName方法，该方法接受图书名称的一部分作为参数，
 * 并返回数据库中与该模式匹配的所有图书信息。
 * 这个类使用DBConnection来建立数据库连接，并执行SQL查询以检索匹配的图书数据。
 * 主要用于图书信息检索和搜索功能。
 */

public class BookSearcher {

    /**
     * 根据图书名称模糊查询图书信息。
     *
     * @param namePart 部分图书名称用于模糊查询
     * @return 匹配的图书列表
     */
    public List<BookDao.Book> searchBooksByName(String namePart) {
        List<BookDao.Book> books = new ArrayList<>();
        String sql = "SELECT ID, name, bigtype, type, publishing, price, pub_date, editor, quantities FROM books WHERE name LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + namePart + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String name = rs.getString("name");
                    String bigType = rs.getString("bigtype");
                    String type = rs.getString("type");
                    String publishing = rs.getString("publishing");
                    BigDecimal price = rs.getBigDecimal("price");
                    Date pubDate = rs.getDate("pub_date");
                    String editor = rs.getString("editor");
                    int quantities = rs.getInt("quantities");

                    books.add(new BookDao.Book(id, name, bigType, type, publishing, price, pubDate, editor, quantities));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
}
