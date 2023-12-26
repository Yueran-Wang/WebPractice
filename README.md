# Java Web 课程项目：源代码概述
项目在线体验：http://101.201.81.43:8080
管理员账户：dozhiyu91@gmail.com    leA4hkk1Jr

## Java代码结构
- **`dbmysql` 包**：负责数据库连接和用户借阅系统的管理。
- **`sign` 包**：处理用户登录和注册流程。
- **`user` 包**：实现用户管理页面的功能。
- **`library` 包**：支持图书管理页面的相关功能。

## 网页概览
所有页面均适配浅色和深色两种模式，并采用响应式框架，确保兼容各种设备，如智能手机、平板电脑和电脑。

### 登录和注册
由 `sign-in.jsp` 和 `sign-up.jsp` 两个文件组成，分别负责登录和注册页面。

### 主页
主页通过 `index.jsp` 和 `indexAdmin` 展现。  
首先检查会话中是否存在用户，若存在，则根据用户类型跳转到相应主页；若不存在，则回到登录页面。
主页采用卡片式布局，突出显示关键信息。

### 主页（用户类型）
在此部分，用户可以进行图书借阅活动。  
选择图书并点击借阅后，会将相应ID提交给JSP页面处理。如果有足够的图书副本，借阅信息将被记录在借阅表中。

### 借阅管理
由 `borrow.jsp`、借阅包及相应的JSP文件和Java类管理。  
该功能支持查询借阅表数据库，并包括还书功能。
还书操作会跳转到特定的JSP页面，从数据库中删除该条记录以完成还书过程。

### 用户管理
由 `user.jsp` 和用户包提供支持。  
此部分为不同用户类型提供了不同的操作：管理员可以管理用户账户，而普通用户则被重定向到 `blank.jsp`，显示访问限制。
包括添加、修改、删除和搜索用户的功能，每个功能都由专门的JSP页面和Java类支持，增强了模态对话框，以提供更精致的用户体验。

### 图书管理
通过 `books.jsp` 和图书馆包实现。  
利用Bootstrap框架，实现了图书分页显示功能。
实现了添加、修改、删除和搜索图书的功能，每个功能都由相应的JSP页面和Java类支持，并配有模态对话框以改进界面。


## HTML 响应式模板
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.0.0-beta20
* @link https://tabler.io
* Copyright 2018-2023 The Tabler Authors
* Copyright 2018-2023 codecalm.net Paweł Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
