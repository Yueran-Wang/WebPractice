<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="library.BookSearcher" %>
<%@ page import="java.util.List" %>
<%@ page import="library.BookDao.Book" %>
<!-- 图书查询 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String bookNamePart = request.getParameter("name");
    BookSearcher searcher = new BookSearcher();
    List<Book> books = searcher.searchBooksByName(bookNamePart);

    for (Book book : books) {
%>
<tr>
    <td class="sort-name"><%= book.getName() %></td>
    <td class="sort-bigtype"><%= book.getBigType() %></td>
    <td class="sort-type"><%= book.getType() %></td>
    <td class="sort-price"><%= book.getPrice().toPlainString() %></td>
    <td class="sort-quantities"><%= book.getQuantities() %></td>
    <td><a href="#" class="btn btn-success w-100" onclick="openDetailModal('<%= book.getName() %>', '<%= book.getBigType() %>', '<%= book.getType() %>', '<%= book.getPrice() %>', '<%= book.getPublishing() %>', '<%= book.getPubDate() %>', '<%= book.getEditor() %>', '<%= book.getQuantities() %>')">详细</a></td>
    <td><a href="#" class="btn btn-primary w-100" onclick="openEditModal('<%= book.getId() %>', '<%= book.getName() %>', '<%= book.getBigType() %>', '<%= book.getType() %>', '<%= book.getPrice() %>', '<%= book.getQuantities() %>')">修改</a></td>
    <td><a href="#" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#modal-small" onclick="setBookToDelete('<%= book.getId() %>')">删除</a></td>
</tr>
<%
    }
%>
