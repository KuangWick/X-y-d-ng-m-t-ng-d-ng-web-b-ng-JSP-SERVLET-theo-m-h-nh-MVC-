<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.bean.Student" %>

<%
    String studentId = request.getParameter("student_id");
    Student student = (Student) request.getAttribute("student"); // Dữ liệu sinh viên lấy từ controller
    if (student == null) {
        response.sendRedirect("student-list?error=notfound");
        return;
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận xóa sinh viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 20px;
            color: #dc3545;
        }

        .confirm-container {
            background-color: white;
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        p {
            font-size: 18px;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            text-decoration: none;
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #bd2130;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <h2>Xác nhận xóa sinh viên</h2>
    <div class="confirm-container">
        <p>Bạn có chắc chắn muốn xóa sinh viên:</p>
        <p><strong>${student.fullName}</strong> (Mã SV: ${student.studentId})</p>

        <div class="btn-container">
            <a href="student-delete-handler?student_id=${student.studentId}" class="btn btn-danger">Xác nhận</a>
            <a href="student-list" class="btn btn-secondary">Hủy</a>
        </div>
    </div>
</body>
</html>
