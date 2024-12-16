<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <div style="margin: 20px;">
        <!-- Nút điều hướng tới danh sách sinh viên -->
        <a href="student-list" class="btn">Student List</a>
        <!-- Nút logout -->
        <form action="logout" method="post" style="display: inline;">
            <button type="submit" class="btn" style="background-color: red;">Logout</button>
        </form>
    </div>
</body>
</html>
