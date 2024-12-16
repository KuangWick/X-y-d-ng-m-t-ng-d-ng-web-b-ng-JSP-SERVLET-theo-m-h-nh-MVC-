<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.bean.Student" %>
<%
    // Lấy thông tin sinh viên từ request attribute
    Student student = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa thông tin sinh viên</title>
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
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .radio-group label {
            display: inline;
            margin-right: 20px;
        }
        button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .btn-cancel {
            background-color: #6c757d;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h2>Sửa thông tin sinh viên</h2>
    <form action="student-update" method="post">
        <!-- Mã sinh viên -->
        <label for="studentId">Mã SV</label>
        <input type="text" id="student_id" name="student_id" value="${student.studentId}" readonly>

        <!-- Họ tên -->
        <label for="fullName">Họ tên</label>
        <input type="text" id="full_name" name="full_name" value="${student.fullName}" required>

        <!-- Giới tính -->
        <label>Giới tính</label>
        <br>
        <div style="display: flex; align-items: center;">
    <label style="margin-right: 20px;">
        Nam <input type="radio" name="gender" value="Nam" <c:if test="${student.gender == 'Nam'}">checked</c:if>>
    </label>
    <label>
        Nữ <input type="radio" name="gender" value="Nữ" <c:if test="${student.gender == 'Nữ'}">checked</c:if>>
    </label>
</div>

        
        <br>

        <!-- Khoa -->
        <label for="department">Khoa</label>
        <select id="department" name="department" required>
            <option value="T" <c:if test="${student.department == 'Khoa Toán'}">selected</c:if>>Khoa Toán</option>
            <option value="L" <c:if test="${student.department == 'Khoa Lý'}">selected</c:if>>Khoa Lý</option>
            <option value="H" <c:if test="${student.department == 'Khoa Hóa'}">selected</c:if>>Khoa Hóa</option>
            <option value="CNTT" <c:if test="${student.department == 'CNTT'}">selected</c:if>>Khoa Công nghệ thông tin</option>
        </select>

        <!-- Nút hành động -->
        <button type="submit">Lưu lại</button>
        <a href="student-list" class="btn-cancel" style="text-decoration:none; padding:10px 15px; color:white;">Quay lại</a>
    </form>
</body>
</html>
