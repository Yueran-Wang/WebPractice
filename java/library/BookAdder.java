package library;

import dbmysql.DBConnection;
import java.sql.*;
import java.math.BigDecimal;

/*
 * 书籍添加器类 (BookAdder)
 * 功能描述: 这个类用于向数据库中添加新的书籍信息。
 * 它接受书籍的各种细节，如名称、类型、出版社、价格等，并将这些信息存储在数据库中。
 * 主要方法:
 *   - 构造函数: 初始化书籍的详细信息。
 *   - addBook(): 将书籍信息添加到数据库中。
 * 使用方式: 创建一个BookAdder对象，设置书籍的详细信息，然后调用addBook()方法。
 * 依赖: 这个类依赖于dbmysql.DBConnection类来建立数据库连接。
 */

public class BookAdder {
    private String name;
    private String bigType;
    private String type;
    private String publishing;
    private BigDecimal price;
    private Date pubDate;
    private String editor;
    private Integer quantities;

    public BookAdder(String name, String bigType, String type, String publishing, BigDecimal price, Date pubDate, String editor, Integer quantities) {
        this.name = name;
        this.bigType = bigType;
        this.type = type;
        this.publishing = publishing;
        this.price = price;
        this.pubDate = pubDate;
        this.editor = editor;
        this.quantities = quantities;
    }

    public boolean addBook() {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO books (name, bigtype, type, publishing, price, pub_date, editor, quantities) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, this.name);
            stmt.setString(2, this.bigType);
            stmt.setString(3, this.type);
            stmt.setString(4, this.publishing);
            stmt.setBigDecimal(5, this.price);

            stmt.setDate(6, new java.sql.Date(this.pubDate.getTime()));

            stmt.setString(7, this.editor);
            if (this.quantities != null) {
                stmt.setInt(8, this.quantities);
            } else {
                stmt.setNull(8, Types.INTEGER);
            }

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
