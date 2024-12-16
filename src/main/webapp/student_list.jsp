<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.bean.User" %>
<%
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
    <title>Danh sách sinh viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 0;
            padding: 20px;
            background-color: #007BFF;
            color: white;
        }

        .filter-form {
            text-align: center;
            margin: 20px 0;
        }

        select, .btn-submit {
            padding: 10px;
            margin: 0 10px;
            font-size: 16px;
            border-radius: 5px;
        }

        select {
            border: 1px solid #ccc;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            text-decoration: none;
            padding: 8px 15px;
            margin: 0 5px;
            border-radius: 5px;
            color: white;
            background-color: #007BFF;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: red;
        }

        .btn-danger:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <h2>Danh sách sinh viên</h2>

    <div class="filter-form">
        <form action="student-list" method="get">
            <select name="department">
                <option value="">-- Chọn khoa --</option>
                <option value="T" <c:if test="${param.department == 'Khoa Toán'}">selected</c:if>>Khoa Toán</option>
                <option value="L" <c:if test="${param.department == 'Khoa Lý'}">selected</c:if>>Khoa Lý</option>
                <option value="H" <c:if test="${param.department == 'Khoa Hóa'}">selected</c:if>>Khoa Hóa</option>
                <option value="CNTT" <c:if test="${param.department == 'CNTT'}">selected</c:if>>Khoa Công nghệ thông tin</option>
            </select>
            <button type="submit" class="btn-submit">Lọc</button>
        </form>
    </div>
    
    <div style="text-align: center; margin-bottom: 10px;">
    <c:if test="${param.success == 'deleted'}">
        <div style="color: green; font-weight: bold;">Xóa sinh viên thành công!</div>
    </c:if>
    <c:if test="${param.error == 'notfound'}">
        <div style="color: red; font-weight: bold;">Sinh viên không tồn tại!</div>
    </c:if>
</div>
  
    <div style="text-align: center; margin-top: 10px;">
    <a href="student_add.jsp" class="btn" style="background-color: #28a745;">Thêm sinh viên mới</a>
</div>


    <table>
    
        <thead>
            <tr>
                <th>MSV</th>
                <th>Họ và tên</th>
                <th>Giới tính</th>
                <th>Khoa</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${studentList}">
                <tr>
                    <td>${student.studentId}</td>
                    <td>${student.fullName}</td>
                    <td>${student.gender}</td>
                    <td>${student.department}</td>
                    <td>
                        <a href="student-edit?student_id=${student.studentId}" class="btn">Sửa</a>
                        <a href="student-delete-handler?student_id=${student.studentId}" class="btn btn-danger">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty studentList}">
                <tr>
                    <td colspan="5">Không có sinh viên nào.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>
