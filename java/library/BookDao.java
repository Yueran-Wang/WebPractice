package library;

import dbmysql.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * BookDao类专注于执行与图书数据相关的数据库操作。
 * 它提供了方法来获取所有图书的信息，以及一个内部类Book来表示图书数据。
 * 这个类使用DBConnection来建立数据库连接，并执行SQL查询来获取图书信息。
 * 主要用于图书信息的检索和管理。
 */
public class BookDao {

    /**
     * 获取所有图书的信息，首先按大类排序，然后按小类排序。
     *
     * @return 包含所有图书信息的列表
     */
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT ID, name, bigtype, type, publishing, price, pub_date, editor, quantities FROM books ORDER BY bigtype, type";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

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

                books.add(new Book(id, name, bigType, type, publishing, price, pubDate, editor, quantities));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public List<Book> getBooksByPage(int page, int pageSize) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books ORDER BY bigtype, type LIMIT ?, ?";
        int start = (page - 1) * pageSize;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, start);
            pstmt.setInt(2, pageSize);

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

                    books.add(new Book(id, name, bigType, type, publishing, price, pubDate, editor, quantities));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public int getTotalBooksCount() {
        String sql = "SELECT COUNT(*) FROM books";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 图书类，用于表示图书信息。
     */
    public static class Book {
        private int id;
        private String name;
        private String bigType;
        private String type;
        private String publishing;
        private BigDecimal price;
        private Date pubDate;
        private String editor;
        private int quantities;

        public Book(int id, String name, String bigType, String type, String publishing, BigDecimal price, Date pubDate, String editor, int quantities) {
            this.id = id;
            this.name = name;
            this.bigType = bigType;
            this.type = type;
            this.publishing = publishing;
            this.price = price;
            this.pubDate = pubDate;
            this.editor = editor;
            this.quantities = quantities;
        }

        // Getter 方法
        public int getId() { return id; }
        public String getName() { return name; }
        public String getBigType() { return bigType; }
        public String getType() { return type; }
        public String getPublishing() { return publishing; }
        public BigDecimal getPrice() { return price; }
        public Date getPubDate() { return pubDate; }
        public String getEditor() { return editor; }
        public int getQuantities() { return quantities; }

    }
}
