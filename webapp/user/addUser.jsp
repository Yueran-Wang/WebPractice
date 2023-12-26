<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="sign.SignUp" %>
<!-- 用户注册 -->
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    SignUp signUp = new SignUp();
    signUp.setUsername(username);
    signUp.setEmail(email);
    signUp.setPassword(password);

    String resultMessage = signUp.registerUser();

    // 根据结果进行相应的处理
    if(resultMessage.equals("注册成功。")) {
        out.println("<script type='text/javascript'>");
        out.println("window.location.href = '../user.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('" + resultMessage + "');");
        out.println("window.location.href = '../user.jsp';");
        out.println("</script>");
    }
%>
