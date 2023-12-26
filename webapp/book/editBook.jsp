<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="library.BookUpdater" %>
<!-- 图书信息更新 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // 获取请求参数
    String bookIdStr = request.getParameter("bookId");
    String bigType = request.getParameter("bigType");
    String type = request.getParameter("type");
    String priceStr = request.getParameter("price");
    String quantitiesStr = request.getParameter("quantities");

    boolean updateResult = false;

    try {
        // 解析图书ID、价格和数量
        int bookId = Integer.parseInt(bookIdStr);
        java.math.BigDecimal price = new java.math.BigDecimal(priceStr);
        int quantities = Integer.parseInt(quantitiesStr);

        // 创建 BookUpdater 实例并尝试更新图书信息
        BookUpdater updater = new BookUpdater(bookId, bigType, type, price, quantities);
        updateResult = updater.updateBook();
    } catch (NumberFormatException e) {
        // 处理解析异常
        e.printStackTrace();
    }

    // 根据更新结果进行相应的处理
    if(updateResult) {
        // 更新成功
        out.println("<script type='text/javascript'>");
        out.println("window.location.href = '../books.jsp';"); // 修改为指向图书页面
        out.println("</script>");
    } else {
        // 更新失败
        out.println("<script type='text/javascript'>");
        out.println("alert('图书信息更新失败');");
        out.println("window.location.href = '../books.jsp';"); // 修改为指向图书页面
        out.println("</script>");
    }
%>
