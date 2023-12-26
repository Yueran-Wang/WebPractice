<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="dbmysql.BorrowProcess" %>
<!-- 删除记录 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String message = "";
    String bookIdStr = request.getParameter("bookId");
    if (bookIdStr != null && !bookIdStr.isEmpty()) {
        int bookId = Integer.parseInt(bookIdStr);
        String userEmail = (String) session.getAttribute("email");
        if (userEmail != null) {
            BorrowProcess bp = new BorrowProcess();
            if (bp.returnBook(bookId, userEmail)) {
                response.sendRedirect("../borrow.jsp");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('删除失败');");
                out.println("location='../borrow.jsp';");
                out.println("</script>");
            }
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('账户错误');");
            out.println("location='../borrow.jsp';");
            out.println("</script>");
        }
    }
%>
