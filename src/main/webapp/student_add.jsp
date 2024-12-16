<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.bean.User" %>
<%
    // Kiểm tra user đã đăng nhập hay chưa
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sinh viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 20px 0;
            color: #007BFF;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Thêm sinh viên mới</h2>

    <!-- Form thêm sinh viên -->
    <form action="student-add-handler" method="post">
        <label for="studentId">Mã sinh viên:</label>
        <input type="text" id="student_id" name="student_id" required>

        <label for="fullName">Họ và tên:</label>
        <input type="text" id="full_name" name="full_name" required>

        <label>Giới tính:</label>
        <label>
            <input type="radio" name="gender" value="Nam" required> Nam
        </label>
        <label>
            <input type="radio" name="gender" value="Nữ" required> Nữ
        </label>

        <label for="department">Khoa:</label>
        <select id="department" name="department" required>
            <option value="">-- Chọn khoa --</option>
            <option value="T">Khoa Toán</option>
            <option value="L">Khoa Lý</option>
            <option value="H">Khoa Hóa</option>
            <option value="CNTT">Khoa Công nghệ thông tin</option>
        </select>

        <button type="submit" class="btn-submit">Thêm sinh viên</button>
    </form>

    <!-- Link quay lại danh sách -->
    <div style="text-align: center;">
        <a href="student-list">Quay lại danh sách</a>
    </div>
</body>
</html>
