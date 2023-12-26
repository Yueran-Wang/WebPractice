<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="dbmysql.DBConnection" %>
<%@ page import="dbmysql.BorrowProcess" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    int bookId = Integer.parseInt(request.getParameter("bookId"));
    String userEmail = (String) session.getAttribute("email");
    String message = "";

    if (userEmail != null) {
        int availableQuantity = 0;
        String sql = "SELECT quantities - (SELECT COUNT(*) FROM borrowed_books WHERE book_id = ?) AS available FROM books WHERE ID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, bookId);
            pstmt.setInt(2, bookId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    availableQuantity = rs.getInt("available");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Database error occurred.";
        }

        if (availableQuantity > 0) {
            BorrowProcess bp = new BorrowProcess();
            if (bp.borrowBook(bookId, userEmail)) {
                message = "success";
            } else {
                message = "error";
            }
        } else {
            message = "error";
        }
    } else {
        message = "error";
    }

    // 重定向到 index.jsp 并带上消息
    response.sendRedirect("../index.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
%>
