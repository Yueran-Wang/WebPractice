<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="signUp" class="sign.SignUp" scope="request" />
<jsp:setProperty name="signUp" property="*" />
<%
    boolean isPost = "post".equalsIgnoreCase(request.getMethod());
    if (isPost) {
        String registrationResult = signUp.registerUser();
        if (registrationResult.equals("注册成功。")) {
            response.sendRedirect("sign-in.jsp");
            return;
        } else {
            // 注册失败，显示错误信息
            out.println("<script type='text/javascript'>");
            out.println("alert('" + registrationResult + "');");
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
    <title>注册页面</title>
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
<script src="./dist/js/demo-theme.min.js?1684106062"></script>
<div class="page page-center">
    <div class="container container-tight py-4">
        <div class="text-center mb-4">
                <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
        </div>
        <form class="card card-md" action="" method="post" autocomplete="off" id="myForm" novalidate>
            <div class="card-body">
                <h2 class="card-title text-center mb-4">注册页面</h2>
                <div class="mb-3">
                    <label class="form-label">名称</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="输入名称">
                </div>
                <div class="mb-3">
                    <label class="form-label">电子邮件地址</label>
                    <input type="text" class="form-control" id="email" name="email" placeholder="输入电子邮件">
                </div>
                <div class="mb-3">
                    <label class="form-label">密码</label>
                    <div class="input-group input-group-flat">
                        <input type="password" class="form-control" id="password" name="password" placeholder="输入密码" autocomplete="off">
                        <span class="input-group-text">
                  <a href="#" class="link-secondary" title="Show password" data-bs-toggle="tooltip"><!-- Download SVG icon from http://tabler-icons.io/i/eye -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0" /><path d="M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6" /></svg>
                  </a>
                </span>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-check">
                        <input type="checkbox" class="form-check-input" id="termsCheckbox"/>
                        <span class="form-check-label">同意<a href="error-404.jsp" tabindex="-1">条款和政策</a>.</span>
                    </label>
                </div>
                <div class="form-footer">
                    <button type="submit" class="btn btn-primary w-100">创建新账户</button>
                </div>
            </div>
        </form>
        <div class="text-center text-secondary mt-3">
            已有账户？ <a href="./sign-in.jsp" tabindex="-1">登录</a>
        </div>
    </div>
</div>
<div class="modal modal-blur fade" id="modalError" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <!-- Download SVG icon from http://tabler-icons.io/i/alert-triangle -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10.24 3.957l-8.422 14.06a1.989 1.989 0 0 0 1.7 2.983h16.845a1.989 1.989 0 0 0 1.7 -2.983l-8.423 -14.06a1.989 1.989 0 0 0 -3.4 0z" /><path d="M12 9v4" /><path d="M12 17h.01" /></svg>
                <h3>请注意！</h3>
                <div class="text-muted">您必须填写全部信息并且同意条款和政策才能继续。</div>
            </div>
            <div class="modal-footer">
                <div class="w-100">
                    <div class="row">
                        <div class="col"><a href="#" class="btn btn-danger w-100" data-bs-dismiss="modal">
                            关闭
                        </a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="./dist/libs/list.js/dist/list.min.js?1684106062" defer></script>
<!-- Tabler Core -->
<script src="./dist/js/tabler.min.js?1684106062" defer></script>
<script src="./dist/js/demo.min.js?1684106062" defer></script>
<script>
    // 确保在 DOM 完全加载后执行脚本
    document.addEventListener('DOMContentLoaded', function() {
        // 绑定表单提交事件以进行字段校验
        var form = document.getElementById('myForm');
        form.addEventListener('submit', function(event) {
            var username = document.getElementById('username').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var termsChecked = document.getElementById('termsCheckbox').checked;

            if (!username || !email || !password || !termsChecked) {
                // 阻止表单提交
                event.preventDefault();
                // 使用Bootstrap的Modal类显示模态框
                var modal = new bootstrap.Modal(document.getElementById('modalError'));
                modal.show();
            }
        });
    });
</script>
</body>
</html>


