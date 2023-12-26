<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    // 检查是否为登录页面的请求
    String requestURI = request.getRequestURI();
    if (requestURI.endsWith("/signin.jsp")) {
        // 清空会话信息
        session.invalidate();
    }
%>
<jsp:useBean id="validator" class="sign.SianIn" scope="request" />
<jsp:setProperty name="validator" property="*" />
<%
    boolean isPost = "post".equalsIgnoreCase(request.getMethod());
    if (isPost) {
        if (validator.validateUser()) {
            // 用户名和密码匹配
            session.setAttribute("username", validator.getUsername());
            session.setAttribute("accountType", validator.getAccountType());
            session.setAttribute("email", validator.getEmail());
            session.setMaxInactiveInterval(300);
            response.sendRedirect("index.jsp");
            return;
        } else {
            // 用户名和密码不匹配
            out.println("<script type='text/javascript'>");
            out.println("alert('密码错误！');");
            out.println("</script>");
        }
    }
%>

<!doctype html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>登录页面</title>
    <!-- CSS files -->
    <link href="./dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="./dist/css/tabler-flags.min.css" rel="stylesheet"/>
    <link href="./dist/css/tabler-payments.min.css" rel="stylesheet"/>
    <link href="./dist/css/tabler-vendors.min.css" rel="stylesheet"/>
    <link href="./dist/css/demo.min.css" rel="stylesheet"/>
    <style>
        @import url('https://rsms.me/inter/inter.css');
        :root {
            --tblr-font-sans-serif: 'Inter Var', -apple-system, BlinkMacSystemFont, San Francisco, Segoe UI, Roboto, Helvetica Neue, sans-serif;
        }
        body {
            font-feature-settings: "cv03", "cv04", "cv11";
        }
    </style>
</head>
<body  class=" d-flex flex-column">
<script src="./dist/js/demo-theme.min.js"></script>
<div class="page page-center">
    <div class="container container-normal py-4">
        <div class="row align-items-center g-4">
            <div class="col-lg">
                <div class="container-tight">
                    <div class="text-center mb-4">
                        <img src="./static/logo.svg" height="36" alt="">
                    </div>
                    <div class="card card-md">
                        <div class="card-body">
                            <h2 class="h2 text-center mb-4">登录页面</h2>
                            <form action="" method="post" autocomplete="off" novalidate>
                                <div class="mb-3">
                                    <label class="form-label">电子邮件地址</label>
                                    <input type="text" class="form-control" id="email" name="email" placeholder="你的电子邮件" autocomplete="off">
                                </div>
                                <div class="mb-2">
                                    <label class="form-label">
                                        密码
                                        <span class="form-label-description">
                                            <a href="error-404.jsp">忘记密码</a>
                                        </span>
                                    </label>
                                    <div class="input-group input-group-flat">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="你的密码" autocomplete="off">
                                        <span class="input-group-text">
                                            <a href="#" class="link-secondary" title="Show password" data-bs-toggle="tooltip"><!-- Download SVG icon from http://tabler-icons.io/i/eye -->
                                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" /><path d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" /></svg>
                                            </a>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-footer">
                                    <button type="submit" class="btn btn-primary w-100">登录</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="text-center text-secondary mt-3">
                        还没有账户？ <a href="./sign-up.jsp" tabindex="-1">注册</a>
                    </div>
                </div>
            </div>
            <div class="col-lg d-none d-lg-block">
                <img src="./static/illustrations/undraw_secure_login_pdn4.svg" height="300" class="d-block mx-auto" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Libs JS -->
<!-- Tabler Core -->
<script src="./dist/js/tabler.min.js" defer></script>
<script src="./dist/js/demo.min.js" defer></script>
</body>
</html>