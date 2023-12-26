<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="user.UserDeleter" %>
<!-- 用户删除 -->
<%
  request.setCharacterEncoding("UTF-8");
  response.setCharacterEncoding("UTF-8");

  String email = request.getParameter("email");
  String message = "删除失败";
  if(email != null && !email.isEmpty()) {
    boolean result = UserDeleter.deleteUserByEmail(email);
    if(result) {
      message = "删除成功";
    }
  }

  response.setContentType("text/plain");
  response.setCharacterEncoding("UTF-8");
  response.getWriter().write(message);
%>
