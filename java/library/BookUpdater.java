package library;

import dbmysql.DBConnection;

import java.math.BigDecimal;
import java.sql.*;

/**
 * BookUpdater类用于更新数据库中的图书信息。
 * 这个类包含图书的ID、大类、小类、价格和数量作为属性，并提供一个构造器来初始化这些属性。
 * 它提供了updateBook方法，用于更新数据库中对应ID的图书的信息。
 * 此方法在成功更新信息后返回true，如果发生错误则返回false。
 * 类使用DBConnection来建立数据库连接，并执行SQL更新操作。
 */
public class BookUpdater {
    private int bookId;
    private String bigType;
    private String type;
    private BigDecimal price;
    private int quantities;

    // 构造器
    public BookUpdater(int bookId, String bigType, String type, BigDecimal price, int quantities) {
        this.bookId = bookId;
        this.bigType = bigType;
        this.type = type;
        this.price = price;
        this.quantities = quantities;
    }

    // 更新图书信息的方法
    public boolean updateBook() {
        // 连接数据库
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("UPDATE books SET bigtype = ?, type = ?, price = ?, quantities = ? WHERE ID = ?")) {

            stmt.setString(1, this.bigType);
            stmt.setString(2, this.type);
            stmt.setBigDecimal(3, this.price);
            stmt.setInt(4, this.quantities);
            stmt.setInt(5, this.bookId);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
