<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page import="user.UserDao" %>
<%@ page import="user.UserDao.User" %>

<%
    // 验证是否登录
    String username = (String) session.getAttribute("username");
    String accountType = (String) session.getAttribute("accountType");

    if (username == null || username.isEmpty()) {
        response.sendRedirect("./sign-in.jsp");
    }

    if (Objects.equals(accountType, "用户")) {
        response.sendRedirect("./user/blank.jsp");
    }
%>

<!doctype html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>用户管理</title>
    <!-- CSS files -->
    <link href="./dist/css/tabler.min.css?1684106062" rel="stylesheet"/>
    <link href="./dist/css/tabler-flags.min.css?1684106062" rel="stylesheet"/>
    <link href="./dist/css/tabler-payments.min.css?1684106062" rel="stylesheet"/>
    <link href="./dist/css/tabler-vendors.min.css?1684106062" rel="stylesheet"/>
    <link href="./dist/css/demo.min.css?1684106062" rel="stylesheet"/>
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
<body >
<script src="./dist/js/demo-theme.min.js?1684106062"></script>
<div class="page">
    <!-- Navbar -->
    <header class="navbar navbar-expand-md d-print-none" >
        <div class="container-xl">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu" aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
                <a href="#">
                    <img src="./static/logo.svg" width="110" height="32" alt="Tabler" class="navbar-brand-image">
                </a>
            </h1>
            <div class="navbar-nav flex-row order-md-last">
                <div class="d-none d-md-flex">
                    <div class="nav-item dropdown d-none d-md-flex me-3">
                        <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip"
                           data-bs-placement="bottom">
                            <!-- Download SVG icon from http://tabler-icons.io/i/moon -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z" /></svg>
                        </a>
                        <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip"
                           data-bs-placement="bottom">
                            <!-- Download SVG icon from http://tabler-icons.io/i/sun -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" /><path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" /></svg>
                        </a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown" aria-label="Open user menu">
                        <span class="avatar avatar-sm" style="background-image: url(./static/avatars/000m.jpg)"></span>
                        <div class="d-none d-xl-block ps-2">
                            <div><%= username %></div>
                            <div class="mt-1 small text-secondary"><%= accountType %></div>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                        <a href="./error-maintenance.jsp" class="dropdown-item">设置</a>
                        <a href="./sign-in.jsp" class="dropdown-item">退出</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <header class="navbar-expand-md">
        <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="navbar">
                <div class="container-xl">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="./index.jsp" >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l-2 0l9 -9l9 9l-2 0" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                        </span>
                                <span class="nav-link-title">
                          我的主页
                        </span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="./books.jsp" >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-adjustments-horizontal" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 6m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 6l8 0" /><path d="M16 6l4 0" /><path d="M8 12m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 12l2 0" /><path d="M10 12l10 0" /><path d="M17 18m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 18l11 0" /><path d="M19 18l1 0" /></svg>
                        </span>
                                <span class="nav-link-title">
                          图书管理
                        </span>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="./user.jsp">
                        <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-adjustments-horizontal" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M14 6m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 6l8 0" /><path d="M16 6l4 0" /><path d="M8 12m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 12l2 0" /><path d="M10 12l10 0" /><path d="M17 18m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" /><path d="M4 18l11 0" /><path d="M19 18l1 0" /></svg>
                        </span>
                                <span class="nav-link-title">
                          用户管理
                        </span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="https://github.com/Yueran-Wang/WebPractice" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >
                        <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/lifebuoy -->
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 12m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0" /><path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0" /><path d="M15 15l3.35 3.35" /><path d="M9 15l-3.35 3.35" /><path d="M5.65 5.65l3.35 3.35" /><path d="M18.35 5.65l-3.35 3.35" /></svg>
                        </span>
                                <span class="nav-link-title">
                          关于项目
                        </span>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="https://github.com/Yueran-Wang/WebPractice" target="_blank" rel="noopener">
                                    项目代码
                                </a>
                                <a class="dropdown-item" href="https://github.com/Yueran-Wang/WebPractice/wiki" target="_blank" rel="noopener">
                                    说明文档
                                </a>
                                <a class="dropdown-item text-pink" href="./error-maintenance.jsp" target="_blank" rel="noopener">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-inline me-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
                                    赞助我们！
                                </a>
                            </div>
                        </li>
                    </ul>
                    <div class="my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last">
                        <form action="./" method="get" autocomplete="off" novalidate>
                            <div class="input-icon">
                        <span class="input-icon-addon">
                          <!-- Download SVG icon from http://tabler-icons.io/i/search -->
                          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" /><path d="M21 21l-6 -6" /></svg>
                        </span>
                                <input type="text" value="" class="form-control" placeholder="搜索…" aria-label="Search in website">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="page-wrapper">
        <div class="page-header d-print-none">
            <div class="container-xl">
                <div class="row g-2 align-items-center">
                    <div class="col">
                        <h1 class="page-title">
                            用户管理系统
                        </h1>
                    </div>
                    <!-- Page title actions -->
                    <div class="col-auto ms-auto d-print-none">
                        <div class="btn-list">
                            <div class="d-none d-sm-inline">
                                <input type="text" class="form-control" name="search-username" placeholder="请输入昵称">
                            </div>
                            <div class="d-none d-sm-inline">
                                <button class="btn" type="button" onclick="searchUsers()">搜索</button>
                            </div>
                            <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-user">
                                <!-- SVG icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5v14M5 12h14" /></svg>
                                添加新用户
                            </a>
                            <a href="#" class="btn btn-primary d-sm-none btn-icon" data-bs-toggle="modal" data-bs-target="#modal-user" aria-label="Add new user">
                                <!-- SVG icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5v14M5 12h14" /></svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page body -->
        <div class="page-body">
            <div class="container-xl">
                <div class="card">
                    <div class="card-body table table-vcenter">
                        <div id="table-default" class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th style="width: 30%;"><h3>邮箱</h3></th>
                                    <th style="width: 20%;"><h3>昵称</h3></th>
                                    <th style="width: 20%;"><h3>密码</h3></th>
                                    <th style="width: 10%;"><h3>用户类型</h3></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody class="table-tbody">
                                <%
                                    UserDao userDao = new UserDao();
                                    List<User> users = userDao.getAllUsers();
                                %>
                                <% for (User user : users) { %>
                                <tr>
                                    <td class="sort-email"><%= user.getEmail() %></td>
                                    <td class="sort-name"><%= user.getUsername() %></td>
                                    <td class="sort"><%= user.getPassword() %></td>
                                    <td class="sort"><%= user.getUserType() %></td>
                                    <td><a href="#" class="btn btn-primary w-100" onclick="openEditModal('<%= user.getEmail() %>', '<%= user.getUsername() %>')">修改</a></td>
                                    <td><a href="#" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#modal-small" onclick="setUserToDelete('<%= user.getEmail() %>')">删除</a></td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer footer-transparent d-print-none">
            <div class="container-xl">
                <div class="row text-center align-items-center flex-row-reverse">
                    <div class="col-lg-auto ms-lg-auto">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item"><a href="./license.html" class="link-secondary">许可证</a></li>
                            <li class="list-inline-item"><a href="https://github.com/Yueran-Wang/WebPractice" target="_blank" class="link-secondary" rel="noopener">源代码</a></li>
                            <li class="list-inline-item">
                                <a href="#" class="link-secondary" rel="noopener">
                                    <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon text-pink icon-filled icon-inline" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
                                    赞助商
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-12 col-lg-auto mt-3 mt-lg-0">
                        <ul class="list-inline list-inline-dots mb-0">
                            <li class="list-inline-item">
                                Copyright &copy; 2023
                                <a href="." class="link-secondary">Yueran-Wang</a>.
                                All rights reserved.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<div class="modal modal-blur fade" id="modal-user" tabindex="-1" role="dialog" aria-hidden="true">
    <form action="user/addUser.jsp" method="post">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">添加新用户</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">昵称</label>
                        <input type="text" class="form-control" name="username" placeholder="用户昵称">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">邮件</label>
                        <input type="text" class="form-control" name="email" placeholder="用户邮件">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">密码</label>
                        <input type="password" class="form-control" name="password" placeholder="密码">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">
                        返回
                    </a>
                    <button type="submit" class="btn btn-primary ms-auto">
                        <!-- SVG icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5v14M5 12h14" /></svg>
                        创建新用户
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal modal-blur fade" id="modal-warning" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-warning"></div>
            <div class="modal-body text-center py-4">
                <!-- Download SVG icon from http://tabler-icons.io/i/alert-triangle -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10.24 3.957l-8.422 14.06a1.989 1.989 0 0 0 1.7 2.983h16.845a1.989 1.989 0 0 0 1.7 -2.983l-8.423 -14.06a1.989 1.989 0 0 0 -3.4 0z" /><path d="M12 9v4" /><path d="M12 17h.01" /></svg>
                <h3>信息不完整</h3>
                <div class="text-muted">请填写所有必填的用户信息后再提交。</div>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn btn-danger w-100" data-bs-dismiss="modal">关闭</a>
            </div>
        </div>
    </div>
</div>
<div class="modal modal-blur fade" id="modal-small" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="modal-title">确定删除？</div>
                <div>你将删除这个用户，并且无法恢复。</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link link-secondary me-auto" data-bs-dismiss="modal">返回</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="deleteUser()">确认删除</button>
            </div>
        </div>
    </div>
</div>
<div class="modal modal-blur fade" id="modal-edit-user" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改用户信息</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="user/editUser.jsp" method="post">  <!-- 修改操作指向 editUser.jsp -->
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">昵称</label>
                        <input type="text" class="form-control" name="username" id="edit-username" placeholder="用户昵称">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">邮件</label>
                        <input type="text" class="form-control" name="email" id="edit-email" readonly> <!-- 邮件字段设置为只读 -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">密码</label>
                        <input type="password" class="form-control" name="password" id="edit-password" placeholder="新密码">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-link link-secondary" data-bs-dismiss="modal">返回</a>
                    <button type="submit" class="btn btn-primary ms-auto">更新用户信息</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal modal-blur fade" id="modal-danger" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-status bg-danger"></div>
            <div class="modal-body text-center py-4">
                <!-- Download SVG icon from http://tabler-icons.io/i/alert-triangle -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M10.24 3.957l-8.422 14.06a1.989 1.989 0 0 0 1.7 2.983h16.845a1.989 1.989 0 0 0 1.7 -2.983l-8.423 -14.06a1.989 1.989 0 0 0 -3.4 0z" /><path d="M12 9v4" /><path d="M12 17h.01" /></svg>
                <h3>请输入密码</h3>
                <div class="text-muted">在修改账户时，请重新为其设置密码！</div>
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
<!-- Libs JS -->
<script src="./dist/libs/list.js/dist/list.min.js?1684106062" defer></script>
<!-- Tabler Core -->
<script src="./dist/js/tabler.min.js?1684106062" defer></script>
<script src="./dist/js/demo.min.js?1684106062" defer></script>
<script>

    /**
     * 该脚本用于管理用户信息编辑的模态框行为。
     * 在文档加载完成后绑定事件和函数，以确保DOM元素可用。
     * openEditModal函数用于打开并填充编辑用户信息的模态框。
     * 同时，绑定了一个表单提交事件来校验密码的输入。
     * 如果没有输入密码，会阻止表单提交并显示警告模态框。
     */

    // 确保在 DOM 完全加载后执行脚本
    document.addEventListener('DOMContentLoaded', function() {
        // 函数用于打开编辑用户信息的模态框并填充数据
        window.openEditModal = function(email, username) {
            document.getElementById('edit-email').value = email;
            document.getElementById('edit-username').value = username;
            var editModal = new bootstrap.Modal(document.getElementById('modal-edit-user'));
            editModal.show();
        };

        // 绑定表单提交事件以进行密码校验
        var form = document.querySelector('#modal-edit-user form');
        form.addEventListener('submit', function(event) {
            var password = document.getElementById('edit-password').value;
            if (!password) {
                event.preventDefault();
                var modal = new bootstrap.Modal(document.getElementById('modal-danger'));
                modal.show();
            }
        });
    });
</script>
<script>

    /**
     * 此脚本提供了删除用户的功能。
     * 通过 setUserToDelete 函数设置要删除的用户的电子邮箱地址。
     * deleteUser 函数负责调用服务器端的 deleteUser.jsp，执行删除操作。
     * 如果删除成功，页面将重新加载以反映变化。
     * 如果请求失败，将显示错误信息，并重新加载页面。
     */

    var userToDelete = '';

    function setUserToDelete(email) {
        userToDelete = email;
    }

    function deleteUser() {
        if (userToDelete) {
            fetch('user/deleteUser.jsp?email=' + encodeURIComponent(userToDelete))
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    } else {
                        throw new Error('请求失败: ' + response.statusText);
                    }
                })
                .then(() => {
                    window.location.reload();
                })
                .catch(error => {
                    alert(error.message);
                    window.location.reload();
                });
            userToDelete = '';
        }
    }
</script>
<script>

    /**
     * 此脚本用于实现用户搜索功能。
     * searchUsers 函数通过从输入框获取用户名的一部分，
     * 然后调用服务器端的 searchUser.jsp 页面进行搜索。
     * 搜索结果会被返回并显示在指定的表格中。
     * 如果搜索过程中发生错误，错误信息将在控制台中输出。
     */

    function searchUsers() {
        var usernamePart = document.querySelector('input[name="search-username"]').value;

        fetch('user/searchUser.jsp?username=' + encodeURIComponent(usernamePart))
            .then(response => response.text())
            .then(data => {
                document.querySelector('.table-tbody').innerHTML = data;
            })
            .catch(error => console.error('Error:', error));
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var form = document.querySelector('#modal-user form');
        form.addEventListener('submit', function(event) {
            var username = form.querySelector('[name="username"]').value;
            var email = form.querySelector('[name="email"]').value;
            var password = form.querySelector('[name="password"]').value;

            if (!username || !email || !password) {
                event.preventDefault();
                var warningModal = new bootstrap.Modal(document.getElementById('modal-warning'));
                warningModal.show();
            }
        });
    });
</script>
</body>
</html>