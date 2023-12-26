<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="user.UserSearcher" %>
<%@ page import="java.util.List" %>
<%@ page import="user.UserDao.User" %>
<!-- 用户查询 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String usernamePart = request.getParameter("username");
    UserSearcher searcher = new UserSearcher();
    List<User> users = searcher.searchUsersByUsername(usernamePart);

    for (User user : users) {
%>
<tr>
    <td class="sort-email"><%= user.getEmail() %></td>
    <td class="sort-name"><%= user.getUsername() %></td>
    <td class="sort"><%= user.getPassword() %></td>
    <td class="sort"><%= user.getUserType() %></td>
    <td><a href="#" class="btn btn-primary w-100" onclick="openEditModal('<%= user.getEmail() %>', '<%= user.getUsername() %>')">修改</a></td>
    <td><a href="#" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#modal-small" onclick="setUserToDelete('<%= user.getEmail() %>')">删除</a></td>
</tr>
<%
    }
%>
