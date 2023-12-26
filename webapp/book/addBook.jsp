<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="library.BookAdder, java.math.BigDecimal"%>
<!-- 添加新图书 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String bigType = request.getParameter("bigtype");
    String type = request.getParameter("type");
    String publishing = request.getParameter("publishing");
    BigDecimal price = new BigDecimal(request.getParameter("price"));
    java.sql.Date pubDate = java.sql.Date.valueOf(request.getParameter("pubdate"));
    String editor = request.getParameter("editor");
    Integer quantities = request.getParameter("quantities") != null && !request.getParameter("quantities").isEmpty() ? Integer.parseInt(request.getParameter("quantities")) : null;

    BookAdder bookAdder = new BookAdder(name, bigType, type, publishing, price, pubDate, editor, quantities);
    boolean addResult = bookAdder.addBook();

    if(addResult) {
        out.println("<script type='text/javascript'>");
        out.println("window.location.href = '../books.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('图书添加失败');");
        out.println("window.location.href = '../books.jsp';");
        out.println("</script>");
    }
%>
