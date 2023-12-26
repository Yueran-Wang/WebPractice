<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="library.BookDeleter" %>
<!-- 图书删除 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String bookIdStr = request.getParameter("id");
    String message = "删除失败";
    if(bookIdStr != null && !bookIdStr.isEmpty()) {
        try {
            int bookId = Integer.parseInt(bookIdStr);
            boolean result = BookDeleter.deleteBookById(bookId);
            if(result) {
                message = "删除成功";
            }
        } catch (NumberFormatException e) {
            // 处理无效的图书ID格式
            message = "无效的图书ID";
        }
    }

    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(message);
%>
