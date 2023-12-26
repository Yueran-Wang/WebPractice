package dbmysql;

import java.sql.*;

/**
 * DBConnection 类用于管理与数据库的连接。
 * 它提供了一个静态方法 getConnection，用于建立与 MySQL 数据库的连接。
 * 该方法使用 JDBC 驱动来连接到指定的数据库URL，需要提供相应的用户名和密码。
 * 此类是一个通用的数据库连接工具，主要用于 Web 应用中处理数据库相关操作。
 */
public class DBConnection {
    // 数据库连接参数
    private static final String URL = "jdbc:mysql://101.201.81.43:3306/WebPractice";
    private static final String USER = "WebPractice";
    private static final String PASSWORD = "admin";

    /**
     * 获取数据库连接的静态方法。
     * 此方法尝试通过 JDBC 驱动连接到 MySQL 数据库，并返回一个数据库连接对象。
     * 如果连接失败，将打印错误信息并返回 null。
     *
     * @return 成功时返回数据库连接对象，失败时返回 null。
     */
    public static Connection getConnection() {
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 建立并返回数据库连接
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            // 打印异常信息
            e.printStackTrace();
            // 连接失败返回 null
            return null;
        }
    }
}
