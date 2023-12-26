<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="user.UserUpdater" %>
<!-- 用户信息更新 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // 创建 UserUpdater 实例并尝试更新用户信息
    UserUpdater updater = new UserUpdater(email, username, password);
    boolean updateResult = updater.updateUser();

    // 根据更新结果进行相应的处理
    if(updateResult) {
        // 更新成功
        out.println("<script type='text/javascript'>");
        out.println("window.location.href = '../user.jsp';");
        out.println("</script>");
    } else {
        // 更新失败
        out.println("<script type='text/javascript'>");
        out.println("alert('用户信息更新失败');");
        out.println("window.location.href = '../user.jsp';");
        out.println("</script>");
    }
%>
